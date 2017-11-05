#!/usr/bin/env runhaskell

{-|
Copyright   :  Copyright (c) 2016, RISE SICS AB
License     :  BSD3 (see the LICENSE file)
Maintainer  :  roberto.castaneda@ri.se

Runs 'gecode-solver' and 'minizinc-solver' (with 'chuffed') in parallel,
returning the result of the fastest solver.

-}
{-
Main authors:
  Roberto Castaneda Lozano <roberto.castaneda@ri.se>

This file is part of Unison, see http://unison-code.github.io
-}

{-# LANGUAGE DeriveDataTypeable, RecordWildCards, OverloadedStrings #-}

import Data.Aeson
import Data.Int
import qualified Data.ByteString.Lazy.Char8 as BSL
import qualified Data.HashMap.Strict as HM
import Control.Concurrent
import Control.Concurrent.Async
import Control.Monad
import Control.Exception
import System.Console.CmdArgs
import System.Process
import System.Process.Internals
import System.Directory
import System.IO
import System.Environment
import Data.List.Split

data Portfolio =
  Portfolio {inFile  :: FilePath,
             outFile :: FilePath,
             verbose :: Bool,
             gecodeFlags :: String,
             chuffedFlags :: String,
             timeOut :: Maybe Integer}
  deriving (Data, Typeable, Show)

data Solver = Gecode | Chuffed deriving Eq

portfolioArgs = cmdArgsMode $ Portfolio
    {
     inFile  = "" &= argPos 1 &= typFile,
     outFile = "" &= name "o" &= help "Output file name" &= typFile,
     verbose = False &= name "v" &= help "Run solvers in verbose mode",
     gecodeFlags = "" &= help "Flags passed to the Gecode solver",
     chuffedFlags = "" &= help "Flags passed to the Chuffed solver",
     timeOut = Nothing &= help "Timeout for both solvers (in seconds)"
    }

gecodeFile :: FilePath -> String
gecodeFile outJsonFile = outJsonFile ++ ".gecode"
chuffedFile :: FilePath -> String
chuffedFile outJsonFile = outJsonFile ++ ".chuffed"

runGecode flags timeOut v extJson outJsonFile =
  do tryUntilSuccess $ callProcess "gecode-solver"
       (["-o", outJsonFile] ++ ["--verbose" | v] ++ (splitFlags flags) ++
        (gecodeTimeoutFlags timeOut) ++ [extJson])
     return outJsonFile

gecodeTimeoutFlags (Just s) = ["--complete", "--timeout", show (s * 1000)]
gecodeTimeoutFlags Nothing  = []

tryIO :: IO a ->  IO (Either IOException a)
tryIO =  try

tryUntilSuccess a =
  do result <- tryIO $ a
     case result of
      Left ex ->
        do putStrLn $ show ex ++ ", trying again..."
           tryUntilSuccess a
      Right () -> return ()

runChuffed flags timeOut extJson outJsonFile =
  do -- call 'minizinc-solver' but only for the setup (we would like to use the
     -- entire script but for some reason then we cannot kill the underlying
     -- processes when MiniZinc looses the race)
     callProcess "minizinc-solver"
       (["--topdown", "--chuffed", "--free", "--no-diffn", "--no-cumulative",
         "--setuponly"] ++ (splitFlags flags) ++ [extJson])
     -- now call the underlying 'minizinc' process that is killable (unlike what
     -- is executed from 'minizinc-solver')
     let pre = (take (length extJson - 9) extJson)
         mzn = pre ++ ".mzn"
         dzn = pre ++ ".dzn"
         ozn = pre ++ ".ozn"
         timeOutFlags =
           case timeOut of
            Just s  -> ["--fzn-flag", "--time-out", "--fzn-flag", show s]
            Nothing -> []
     setEnv "FLATZINC_CMD" "fzn-chuffed"
     tryUntilSuccess $ callProcess "minizinc"
       (["-Gchuffed", "--fzn-flag", "--mdd", "--fzn-flag", "on", "-a", "-k",
        "-s", "--fzn-flag", "-f", "--fzn-flag", "--rnd-seed", "--fzn-flag",
        "123456", "-D", "good_cumulative=true", "-D", "good_diffn=false"] ++
        timeOutFlags ++ [mzn, dzn, "-o", ozn])
     -- finally, invoke 'outfilter' to format the output
     inf  <- openFile ozn ReadMode
     outf <- openFile outJsonFile WriteMode
     (_, _, _, h) <- createProcess
                     (proc "outfilter.pl" [outJsonFile ++ ".last"])
                       {std_in = UseHandle inf, std_out = UseHandle outf}
     waitForProcess h
     hClose inf
     hClose outf
     out <- strictReadFile outJsonFile
     return outJsonFile

splitFlags :: String -> [String]
splitFlags flags =
  let flags' = map replaceFlagChar flags
  in [flag | flag <- splitOn " " flags', not (null flag)]

proven json =
  let sol    = parseJson json
      proven = sol HM.! "proven"
  in (solutionFromJson proven) :: Bool

parseJson json =
  case decode (BSL.pack json) of
   Nothing -> error ("error parsing JSON output")
   Just (Object s) -> s

solutionFromJson object =
  case fromJSON object of
   Error e -> error ("error converting JSON input:\n" ++ show e)
   Success s -> s

strictReadFile f =
  do h <- openFile f ReadMode
     c <- strictHGetContents h
     return c

strictHGetContents h =
  do c <- hGetContents h
     length c `seq` return c

main =
    do Portfolio{..} <- cmdArgsRun portfolioArgs
       let gecodeOutFile  = outFile ++ ".gecode"
           chuffedOutFile = outFile ++ ".chuffed"
           chuffedLastOutFile = outFile ++ ".chuffed.last"
       result <- race
                 (runGecode  gecodeFlags  timeOut verbose inFile gecodeOutFile)
                 (runChuffed chuffedFlags timeOut inFile chuffedOutFile)
       let winner = case result of
                      Left  _ -> Gecode
                      Right _ -> Chuffed
       finalOutFile <- if winner == Chuffed then return chuffedOutFile
                       else
                         do gecodeOut <- strictReadFile gecodeOutFile
                            if proven gecodeOut then return gecodeOutFile
                            else
                            -- gecode-solver timed out, the last solution
                            -- provided by Chuffed might be actually better
                                 do chuffedLastOut <- readIfExists
                                                   chuffedLastOutFile
                                    if chuffedLastOut `betterThan` gecodeOut
                                       then return chuffedLastOutFile
                                       else return gecodeOutFile
       renameFile finalOutFile outFile
       removeIfExists gecodeOutFile
       removeIfExists chuffedOutFile
       removeIfExists chuffedLastOutFile
       return ()

replaceFlagChar '=' = ' '
replaceFlagChar ';' = ' '
replaceFlagChar c = c

removeIfExists file =
  do fileExists <- doesFileExist file
     when fileExists (removeFile file)

readIfExists file =
  do fileExists <- doesFileExist file
     if fileExists then strictReadFile file else return ""

betterThan out1 out2 = cost out1 < cost out2

cost "" = maxInt
cost out =
  let sol  = parseJson out
      cost = sol HM.! "cost"
      -- Assumes a single goal as the minizinc solver does not support more
      [c]  = (solutionFromJson cost) :: [Integer]
  in if c == -1 then maxInt else c

maxInt = toInteger (maxBound - 1 :: Int32)
