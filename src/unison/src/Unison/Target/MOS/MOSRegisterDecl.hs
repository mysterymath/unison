{-|
Part of LLVM-MOS, under the Apache License v2.0 with LLVM Exceptions.
See https://llvm.org/LICENSE.txt for license information.
SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
-}
module Unison.Target.MOS.MOSRegisterDecl (MOSRegister (..)) where

data MOSRegister =
    R0 |
    R1 |
    R2 |
    R3 |
    R4 |
    R5 |
    R6 |
    R7
    deriving (Eq, Ord)
