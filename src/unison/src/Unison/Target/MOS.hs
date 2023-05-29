{-|
Part of LLVM-MOS, under the Apache License v2.0 with LLVM Exceptions.
See https://llvm.org/LICENSE.txt for license information.
SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
-}
module Unison.Target.MOS (target) where

import Unison
import qualified Unison.Target.API as API

target =
    API.TargetDescription {
      API.tRegisterArray    = const registerArray,
      API.tRegisterAtoms    = const registerAtoms,
      API.tRegClasses       = const regClasses,
      API.tRegisters        = const registers,
      API.tInfRegClassUsage = const infRegClassUsage,
      API.tInfRegClassBound = const infRegClassBound,
      API.tSubRegIndexType  = const subRegIndexType,
      API.tCallerSaved      = const callerSaved,
      API.tCalleeSaved      = const calleeSaved,
      API.tReserved         = const reserved,
      API.tInstructionType  = const instructionType,
      API.tBranchInfo       = const branchInfo,
      API.tPreProcess       = const preProcess,
      API.tPostProcess      = const postProcess,
      API.tTransforms       = const transforms,
      API.tCopies           = const copies,
      API.tRematInstrs      = const rematInstrs,
      API.tFromCopy         = const fromCopy,
      API.tOperandInfo      = const operandInfo,
      API.tAlignedPairs     = const alignedPairs,
      API.tPackedPairs      = const packedPairs,
      API.tRelatedPairs     = const relatedPairs,
      -- Pass target options to 'resources' to specify target width
      API.tResources        = resources,
      API.tUsages           = const usages,
      API.tNop              = const nop,
      API.tReadWriteInfo    = const readWriteInfo,
      API.tImplementFrame   = const implementFrame,
      API.tAddPrologue      = const addPrologue,
      API.tAddEpilogue      = const addEpilogue,
      API.tStackDirection   = const stackDirection,
      API.tReadWriteLatency = const readWriteLatency,
      API.tAlternativeTemps = const alternativeTemps,
      API.tExpandCopy       = const expandCopy,
      API.tConstraints      = const constraints,
      API.tSpillOverhead    = const spillOverhead
    }
