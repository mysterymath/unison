{-|
Part of LLVM-MOS, under the Apache License v2.0 with LLVM Exceptions.
See https://llvm.org/LICENSE.txt for license information.
SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
-}
module Unison.Target.MOS.MOSRegisterDecl (MOSRegister (..)) where

data MOSRegister =
    C |
    V |
    NZ |
    RS0 |
    RS1 |
    RS2 |
    RS3 |
    RS4 |
    RS5 |
    RS6 |
    RS7 |
    RS8 |
    RS9 |
    RS10 |
    RS11 |
    RS12 |
    RS13 |
    RS14 |
    RS15 |
    RC0 |
    RC1 |
    RC2 |
    RC3 |
    RC4 |
    RC5 |
    RC6 |
    RC7 |
    RC8 |
    RC9 |
    RC10 |
    RC11 |
    RC12 |
    RC13 |
    RC14 |
    RC15 |
    RC16 |
    RC17 |
    RC18 |
    RC19 |
    RC20 |
    RC21 |
    RC22 |
    RC23 |
    RC24 |
    RC25 |
    RC26 |
    RC27 |
    RC28 |
    RC29 |
    RC30 |
    RC31
    deriving (Eq, Ord)
