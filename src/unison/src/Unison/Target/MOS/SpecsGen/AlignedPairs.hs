-- This file has been generated by specsgen. Do not modify by hand!

module Unison.Target.MOS.SpecsGen.AlignedPairs (alignedPairs) where
import Unison.Target.MOS.SpecsGen.MOSInstructionDecl
alignedPairs i ([], [])
  | i `elem`
      [ASL_Accumulator, ASR_Implied, BRK_Implied, CLC_Implied,
       CLD_Implied, CLE_Implied, CLI_Implied, CLV_Implied,
       DEC_Accumulator, DEX_Implied, DEY_Implied, DEZ_Implied,
       FENTRY_CALL, G_INVOKE_REGION_START, INC_Accumulator, INX_Implied,
       INY_Implied, INZ_Implied, LSR_Accumulator, MEMBARRIER, NEG_Implied,
       NOP_Implied, PATCHABLE_FUNCTION_ENTER, PATCHABLE_FUNCTION_EXIT,
       PHA_Implied, PHP_Implied, PHX_Implied, PHY_Implied, PHZ_Implied,
       PLA_Implied, PLP_Implied, PLX_Implied, PLY_Implied, PLZ_Implied,
       ROL_Accumulator, ROR_Accumulator, RTI, RTI_Implied, RTL_Implied,
       RTS, RTS_Implied, SEC_Implied, SED_Implied, SEE_Implied,
       SEI_Implied, TAB_Implied, TAX_Implied, TAY_Implied, TAZ_Implied,
       TBA_Implied, TSX_Implied, TSY_Implied, TXA_Implied, TXS_Implied,
       TYA_Implied, TYS_Implied, TZA_Implied]
    = []
alignedPairs i ([], [_]) | i `elem` [STZImag8] = []
alignedPairs i ([], [_])
  | i `elem`
      [CLV, G_IMPLICIT_DEF, G_READCYCLECOUNTER, IMPLICIT_DEF, LDZ,
       LOAD_STACK_GUARD, PL]
    = []
alignedPairs i ([_], []) | i `elem` [PREALLOCATED_SETUP] = []
alignedPairs i ([_, _], [_]) | i `elem` [PREALLOCATED_ARG] = []
alignedPairs i ([_, _], [_])
  | i `elem` [G_VECREDUCE_SEQ_FADD, G_VECREDUCE_SEQ_FMUL] = []
alignedPairs i ([_], []) | i `elem` [DECAbs, INCAbs, STZAbs] = []
alignedPairs i ([_], [_]) | i `elem` [ASLAbs, LSRAbs] = []
alignedPairs i ([_], [_])
  | i `elem` [G_LOAD, G_LOAD_ABS, G_SEXTLOAD, G_ZEXTLOAD] = []
alignedPairs i ([_, carryin], [carryin'])
  | i `elem` [ROLAbs, RORAbs] = [(carryin, carryin')]
alignedPairs i ([_, _, _], [_]) | i `elem` [G_ATOMIC_CMPXCHG] = []
alignedPairs i ([_, _, _], [_, _])
  | i `elem` [G_ATOMIC_CMPXCHG_WITH_SUCCESS] = []
alignedPairs i ([_, _], [])
  | i `elem` [DECAbsIdx, INCAbsIdx, STZAbsIdx] = []
alignedPairs i ([_, _], [_]) | i `elem` [ASLAbsIdx, LSRAbsIdx] = []
alignedPairs i ([_, _], [_])
  | i `elem` [LDAAbsIdx, LDAbsIdx, LDXAbsIdx, LDYAbsIdx] = []
alignedPairs i ([_, _, carryin], [carryin'])
  | i `elem` [ROLAbsIdx, RORAbsIdx] = [(carryin, carryin')]
alignedPairs i ([_, _], [_]) | i `elem` [LDIndirIdx] = []
alignedPairs i ([_, _], [_])
  | i `elem`
      [G_ATOMICRMW_ADD, G_ATOMICRMW_AND, G_ATOMICRMW_FADD,
       G_ATOMICRMW_FMAX, G_ATOMICRMW_FMIN, G_ATOMICRMW_FSUB,
       G_ATOMICRMW_MAX, G_ATOMICRMW_MIN, G_ATOMICRMW_NAND, G_ATOMICRMW_OR,
       G_ATOMICRMW_SUB, G_ATOMICRMW_UDEC_WRAP, G_ATOMICRMW_UINC_WRAP,
       G_ATOMICRMW_UMAX, G_ATOMICRMW_UMIN, G_ATOMICRMW_XCHG,
       G_ATOMICRMW_XOR]
    = []
alignedPairs i ([_], [_]) | i `elem` [G_BLOCK_ADDR] = []
alignedPairs i ([_, _], [_])
  | i `elem` [G_LOAD_ABS_IDX, G_LOAD_INDIR_IDX] = []
alignedPairs i ([_, _], [_, _, _]) | i `elem` [AddrLostk] = []
alignedPairs i ([_, _], [_, _]) | i `elem` [LDStk] = []
alignedPairs i ([_, _, _], [_, _])
  | i `elem` [G_INDEXED_LOAD, G_INDEXED_SEXTLOAD, G_INDEXED_ZEXTLOAD]
    = []
alignedPairs i ([_, _, _], [_, _, _]) | i `elem` [AddrHistk] = []
alignedPairs i ([_, _], [])
  | i `elem` [ADJCALLSTACKDOWN, ADJCALLSTACKUP] = []
alignedPairs i ([_, _, _], []) | i `elem` [G_BZERO] = []
alignedPairs i ([_, _, _], []) | i `elem` [G_MEMCPY_INLINE] = []
alignedPairs i ([_, _, _, _], [])
  | i `elem` [G_MEMCPY, G_MEMMOVE] = []
alignedPairs i ([_, _, _, _], []) | i `elem` [G_MEMSET] = []
alignedPairs i ([_, _], []) | i `elem` [PATCHABLE_EVENT_CALL] = []
alignedPairs i ([_, _, _, _], []) | i `elem` [PSEUDO_PROBE] = []
alignedPairs i ([_], [])
  | i `elem`
      [ANNOTATION_LABEL, CFI_INSTRUCTION, EH_LABEL, GC_LABEL,
       LIFETIME_END, LIFETIME_START]
    = []
alignedPairs i ([_, _, _, _, _, _], [_])
  | i `elem` [PATCHPOINT] = []
alignedPairs i ([_, _, _], []) | i `elem` [STACKMAP] = []
alignedPairs i ([_], [_]) | i `elem` [G_CONSTANT, G_FCONSTANT] = []
alignedPairs i ([_, _, _], [_]) | i `elem` [SUBREG_TO_REG] = []
alignedPairs i ([_, _], [])
  | i `elem` [G_INTRINSIC, G_INTRINSIC_W_SIDE_EFFECTS] = []
alignedPairs i ([_], [_]) | i `elem` [G_JUMP_TABLE] = []
alignedPairs i ([_, _], [_]) | i `elem` [CMPAbs, CMPTermAbs] = []
alignedPairs i ([_, _, _], [_])
  | i `elem` [CMPAbsIdx, CMPIndirIdx, CMPTermIdx, CMPTermIndir] = []
alignedPairs i ([l, _, _], [l'])
  | i `elem`
      [ANDAbsIdx, ANDIndirIdx, EORAbsIdx, EORIndirIdx, ORAAbsIdx,
       ORAIndirIdx]
    = [(l, l')]
alignedPairs i ([l, _, _, carryin], [l', carryin', _])
  | i `elem` [ADCAbsIdx, ADCIndirIdx, SBCAbsIdx, SBCIndirIdx] =
    [(l, l'), (carryin, carryin')]
alignedPairs i ([_, _], [_])
  | i `elem` [CMPImag8, CMPImm, CMPTermImag8, CMPTermImm] = []
alignedPairs i ([l, _], [l'])
  | i `elem`
      [ANDAbs, ANDImag8, ANDImm, EORAbs, EORImag8, EORImm, ORAAbs,
       ORAImag8, ORAImm]
    = [(l, l')]
alignedPairs i ([_, _], [_]) | i `elem` [BITAbs] = []
alignedPairs i ([l, _, carryin], [l', carryin', _])
  | i `elem` [ADCAbs, ADCImm, SBCAbs, SBCImag8, SBCImm] =
    [(l, l'), (carryin, carryin')]
alignedPairs i ([l, _, _], [l', _, _])
  | i `elem` [ADCImag8] = [(l, l')]
alignedPairs i ([_, _, _], [_, _, _, _, _]) | i `elem` [G_SBC] = []
alignedPairs i ([_], []) | i `elem` [DBG_LABEL] = []
alignedPairs i ([_], []) | i `elem` [G_VASTART] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_VAARG] = []
alignedPairs i ([_, _], []) | i `elem` [G_FENCE] = []
alignedPairs i ([_], [])
  | i `elem`
      [ADC_Absolute, ADC_AbsoluteLong, ADC_AbsoluteX, ADC_AbsoluteXLong,
       ADC_AbsoluteY, ADC_Immediate, ADC_Immediate16, ADC_IndexedIndirect,
       ADC_Indirect, ADC_IndirectIndexed, ADC_IndirectIndexedLong,
       ADC_IndirectLong, ADC_IndirectZeroPageZ, ADC_ZeroPage,
       ADC_ZeroPageX, AND_Absolute, AND_AbsoluteLong, AND_AbsoluteX,
       AND_AbsoluteXLong, AND_AbsoluteY, AND_Immediate, AND_Immediate16,
       AND_IndexedIndirect, AND_Indirect, AND_IndirectIndexed,
       AND_IndirectIndexedLong, AND_IndirectLong, AND_IndirectZeroPageZ,
       AND_ZeroPage, AND_ZeroPageX, ASL_Absolute, ASL_AbsoluteX,
       ASL_ZeroPage, ASL_ZeroPageX, ASR_ZeroPage, ASR_ZeroPageX,
       ASW_Absolute, BCC_Relative, BCC_Relative16, BCS_Relative,
       BCS_Relative16, BEQ_Relative, BEQ_Relative16, BIT_Absolute,
       BIT_AbsoluteX, BIT_Immediate, BIT_ZeroPage, BIT_ZeroPageX,
       BMI_Relative, BMI_Relative16, BNE_Relative, BNE_Relative16,
       BPL_Relative, BPL_Relative16, BRA_Relative, BRA_Relative16,
       BRL_Relative16, BSR_Relative16, BVC_Relative, BVC_Relative16,
       BVS_Relative, BVS_Relative16, CMP_Absolute, CMP_AbsoluteLong,
       CMP_AbsoluteX, CMP_AbsoluteXLong, CMP_AbsoluteY, CMP_Immediate,
       CMP_Immediate16, CMP_IndexedIndirect, CMP_Indirect,
       CMP_IndirectIndexed, CMP_IndirectIndexedLong, CMP_IndirectLong,
       CMP_IndirectZeroPageZ, CMP_ZeroPage, CMP_ZeroPageX, CPX_Absolute,
       CPX_Immediate, CPX_Immediate16, CPX_ZeroPage, CPY_Absolute,
       CPY_Immediate, CPY_Immediate16, CPY_ZeroPage, CPZ_Absolute,
       CPZ_Immediate, CPZ_ZeroPage, DEC_Absolute, DEC_AbsoluteX,
       DEC_ZeroPage, DEC_ZeroPageX, DEW_ZeroPage, EOR_Absolute,
       EOR_AbsoluteLong, EOR_AbsoluteX, EOR_AbsoluteXLong, EOR_AbsoluteY,
       EOR_Immediate, EOR_Immediate16, EOR_IndexedIndirect, EOR_Indirect,
       EOR_IndirectIndexed, EOR_IndirectIndexedLong, EOR_IndirectLong,
       EOR_IndirectZeroPageZ, EOR_ZeroPage, EOR_ZeroPageX, INC_Absolute,
       INC_AbsoluteX, INC_ZeroPage, INC_ZeroPageX, INW_ZeroPage,
       JML_Indirect16, JMP_Absolute, JMP_AbsoluteLong,
       JMP_IndexedIndirect, JMP_Indirect16, JSL_AbsoluteLong,
       JSR_Absolute, JSR_AbsoluteIndirect, JSR_AbsoluteIndirectX,
       JSR_IndexedIndirect16, LDA_Absolute, LDA_AbsoluteLong,
       LDA_AbsoluteX, LDA_AbsoluteXLong, LDA_AbsoluteY, LDA_Immediate,
       LDA_Immediate16, LDA_IndexedIndirect, LDA_Indirect,
       LDA_IndirectIndexed, LDA_IndirectIndexedLong, LDA_IndirectLong,
       LDA_IndirectStackPointerY, LDA_IndirectZeroPageZ, LDA_ZeroPage,
       LDA_ZeroPageX, LDX_Absolute, LDX_AbsoluteY, LDX_Immediate,
       LDX_Immediate16, LDX_ZeroPage, LDX_ZeroPageY, LDY_Absolute,
       LDY_AbsoluteX, LDY_Immediate, LDY_Immediate16, LDY_ZeroPage,
       LDY_ZeroPageX, LDZ_Absolute, LDZ_AbsoluteX, LDZ_Immediate,
       LSR_Absolute, LSR_AbsoluteX, LSR_ZeroPage, LSR_ZeroPageX,
       ORA_Absolute, ORA_AbsoluteLong, ORA_AbsoluteX, ORA_AbsoluteXLong,
       ORA_AbsoluteY, ORA_Immediate, ORA_Immediate16, ORA_IndexedIndirect,
       ORA_Indirect, ORA_IndirectIndexed, ORA_IndirectIndexedLong,
       ORA_IndirectLong, ORA_IndirectZeroPageZ, ORA_ZeroPage,
       ORA_ZeroPageX, PHW_Absolute, PHW_Immediate, REP_Immediate,
       ROL_Absolute, ROL_AbsoluteX, ROL_ZeroPage, ROL_ZeroPageX,
       ROR_Absolute, ROR_AbsoluteX, ROR_ZeroPage, ROR_ZeroPageX,
       ROW_Absolute, RTN_Immediate, SBC_Absolute, SBC_AbsoluteLong,
       SBC_AbsoluteX, SBC_AbsoluteXLong, SBC_AbsoluteY, SBC_Immediate,
       SBC_Immediate16, SBC_IndexedIndirect, SBC_Indirect,
       SBC_IndirectIndexed, SBC_IndirectIndexedLong, SBC_IndirectLong,
       SBC_IndirectZeroPageZ, SBC_ZeroPage, SBC_ZeroPageX, SEP_Immediate,
       STA_Absolute, STA_AbsoluteLong, STA_AbsoluteX, STA_AbsoluteXLong,
       STA_AbsoluteY, STA_IndexedIndirect, STA_Indirect,
       STA_IndirectIndexed, STA_IndirectIndexedLong, STA_IndirectLong,
       STA_IndirectStackPointerY, STA_IndirectZeroPageZ, STA_ZeroPage,
       STA_ZeroPageX, STX_Absolute, STX_AbsoluteY, STX_ZeroPage,
       STX_ZeroPageY, STY_Absolute, STY_AbsoluteX, STY_ZeroPage,
       STY_ZeroPageX, STZ_Absolute, STZ_AbsoluteX, STZ_ZeroPage,
       STZ_ZeroPageX, TRB_Absolute, TRB_ZeroPage, TSB_Absolute,
       TSB_ZeroPage]
    = []
alignedPairs i ([_], [_]) | i `elem` [G_READ_REGISTER] = []
alignedPairs i ([_, _], []) | i `elem` [G_WRITE_REGISTER] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_DYN_STACKALLOC] = []
alignedPairs i ([_], []) | i `elem` [PH] = []
alignedPairs i ([_], [_])
  | i `elem`
      [COPY, G_ABS, G_ADDRSPACE_CAST, G_ANYEXT, G_BITCAST, G_BITREVERSE,
       G_BSWAP, G_CONSTANT_POOL, G_CTLZ, G_CTLZ_ZERO_UNDEF, G_CTPOP,
       G_CTTZ, G_CTTZ_ZERO_UNDEF, G_FABS, G_FCANONICALIZE, G_FNEG,
       G_FPEXT, G_FPTOSI, G_FPTOUI, G_FPTRUNC, G_FREEZE, G_GLOBAL_VALUE,
       G_INTRINSIC_LRINT, G_INTTOPTR, G_LLROUND, G_LROUND, G_PTRTOINT,
       G_SEXT, G_SITOFP, G_TRUNC, G_UITOFP, G_ZEXT, LDAbs, LDImag8,
       STImag8, TA, T_A]
    = []
alignedPairs i ([_], [_, _]) | i `elem` [G_UNMERGE_VALUES] = []
alignedPairs i ([src], [_, src'])
  | i `elem` [DecPtr] = [(src, src')]
alignedPairs i ([src], [src'])
  | i `elem`
      [ARITH_FENCE, DE, DEC, DECImag8, IN, INC, INCImag8, IncPtr]
    = [(src, src')]
alignedPairs i ([src], [src', _])
  | i `elem` [ASL, LSR] = [(src, src')]
alignedPairs i ([_, _], []) | i `elem` [G_STORE, G_STORE_ABS] = []
alignedPairs i ([_, _, _], []) | i `elem` [STAbsIdx] = []
alignedPairs i ([_, _, _], []) | i `elem` [STIndirIdx] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_ASSERT_ALIGN] = []
alignedPairs i ([_, _, _], [_]) | i `elem` [STStk] = []
alignedPairs i ([_, _, _], [])
  | i `elem` [G_STORE_ABS_IDX, G_STORE_INDIR_IDX] = []
alignedPairs i ([_, _, _, _], [_])
  | i `elem` [G_INDEXED_STORE] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_PTRMASK] = []
alignedPairs i ([_, _], [_, _]) | i `elem` [G_LSHRE, G_SHLE] = []
alignedPairs i ([src, carryin], [src', carryin'])
  | i `elem` [ROL, ROR] = [(src, src'), (carryin, carryin')]
alignedPairs i ([_, _], []) | i `elem` [STAbs] = []
alignedPairs i ([_, _, _], [_])
  | i `elem` [G_INSERT_VECTOR_ELT] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_EXTRACT_VECTOR_ELT] = []
alignedPairs i ([_, _, _], [_]) | i `elem` [G_SBFX, G_UBFX] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_EXTRACT] = []
alignedPairs i ([_, _, _], [_]) | i `elem` [G_INSERT] = []
alignedPairs i ([_, _], [_]) | i `elem` [COPY_TO_REGCLASS] = []
alignedPairs i ([_, _], [_])
  | i `elem` [G_ASSERT_SEXT, G_ASSERT_ZEXT, G_SEXT_INREG] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_IS_FPCLASS] = []
alignedPairs i ([_, _], [_]) | i `elem` [G_FCOPYSIGN, G_FPOWI] = []
alignedPairs i ([_, _, _], [_])
  | i `elem`
      [G_SDIVFIX, G_SDIVFIXSAT, G_SMULFIX, G_SMULFIXSAT, G_UDIVFIX,
       G_UDIVFIXSAT, G_UMULFIX, G_UMULFIXSAT]
    = []
alignedPairs i ([_, _], [_])
  | i `elem`
      [G_BUILD_VECTOR, G_BUILD_VECTOR_TRUNC, G_CONCAT_VECTORS,
       G_MERGE_VALUES]
    = []
alignedPairs i ([_], []) | i `elem` [G_BR, G_BRINDIRECT] = []
alignedPairs i ([_], [_])
  | i `elem`
      [G_FCEIL, G_FCOS, G_FEXP, G_FEXP2, G_FFLOOR, G_FLOG, G_FLOG10,
       G_FLOG2, G_FNEARBYINT, G_FRINT, G_FSIN, G_FSQRT, G_INTRINSIC_ROUND,
       G_INTRINSIC_ROUNDEVEN, G_INTRINSIC_TRUNC, G_STRICT_FSQRT]
    = []
alignedPairs i ([_, _], [_])
  | i `elem` [G_INTRINSIC_FPTRUNC_ROUND] = []
alignedPairs i ([_, _], [_, _])
  | i `elem` [G_SDIVREM, G_UDIVREM] = []
alignedPairs i ([_, _], [_])
  | i `elem`
      [G_ADD, G_AND, G_ASHR, G_FADD, G_FDIV, G_FMAXIMUM, G_FMAXNUM,
       G_FMAXNUM_IEEE, G_FMINIMUM, G_FMINNUM, G_FMINNUM_IEEE, G_FMUL,
       G_FPOW, G_FREM, G_FSUB, G_LSHR, G_MUL, G_OR, G_PTR_ADD, G_ROTL,
       G_ROTR, G_SADDSAT, G_SDIV, G_SHL, G_SMAX, G_SMIN, G_SMULH, G_SREM,
       G_SSHLSAT, G_SSUBSAT, G_STRICT_FADD, G_STRICT_FDIV, G_STRICT_FMUL,
       G_STRICT_FREM, G_STRICT_FSUB, G_SUB, G_UADDSAT, G_UDIV, G_UMAX,
       G_UMIN, G_UMULH, G_UREM, G_USHLSAT, G_USUBSAT, G_XOR]
    = []
alignedPairs i ([_, _], [_, _])
  | i `elem` [G_SADDO, G_SMULO, G_SSUBO, G_UADDO, G_UMULO, G_USUBO] =
    []
alignedPairs i ([_, _, _], [_, _])
  | i `elem` [G_SADDE, G_SSUBE, G_UADDE, G_USUBE] = []
alignedPairs i ([_, _, _], [_])
  | i `elem` [G_FMA, G_FMAD, G_FSHL, G_FSHR, G_STRICT_FMA] = []
alignedPairs i ([_], [_]) | i `elem` [G_FRAME_INDEX] = []
alignedPairs i ([_, _], [_]) | i `elem` [EXTRACT_SUBREG] = []
alignedPairs i ([supersrc, _, _], [supersrc'])
  | i `elem` [INSERT_SUBREG] = [(supersrc, supersrc')]
alignedPairs i ([_, _], [_]) | i `elem` [REG_SEQUENCE] = []
alignedPairs i ([_, _], []) | i `elem` [LOCAL_ESCAPE] = []
alignedPairs i ([_, _, _], []) | i `elem` [G_BRJT] = []
alignedPairs i ([_], [])
  | i `elem` [BRA, JMP, JMPIndir, JSR, TailJMP] = []
alignedPairs i ([_, _, _], []) | i `elem` [BR] = []
alignedPairs i ([_, _, _], []) | i `elem` [GBR] = []
alignedPairs i ([_, _, _], [_])
  | i `elem` [G_FCMP, G_ICMP, G_SELECT] = []
alignedPairs i ([_, _, _], [_]) | i `elem` [SelectImm] = []
alignedPairs i ([_, _], []) | i `elem` [G_BRCOND] = []
alignedPairs i ([_, _, _], []) | i `elem` [G_BRCOND_IMM] = []
alignedPairs i ([_, _, _], [])
  | i `elem` [PATCHABLE_TYPED_EVENT_CALL] = []
alignedPairs i ([_], [_])
  | i `elem`
      [G_VECREDUCE_ADD, G_VECREDUCE_AND, G_VECREDUCE_FADD,
       G_VECREDUCE_FMAX, G_VECREDUCE_FMIN, G_VECREDUCE_FMUL,
       G_VECREDUCE_MUL, G_VECREDUCE_OR, G_VECREDUCE_SMAX,
       G_VECREDUCE_SMIN, G_VECREDUCE_UMAX, G_VECREDUCE_UMIN,
       G_VECREDUCE_XOR]
    = []
alignedPairs i ([_, _, _], [_]) | i `elem` [G_SHUFFLE_VECTOR] = []
alignedPairs i ([_], [_]) | i `elem` [CMPTermZ] = []
alignedPairs i ([_], [_])
  | i `elem` [LDCImm, LDImm, LDImm1, LDImm16Remat] = []
alignedPairs i ([_], [_, _]) | i `elem` [LDImm16] = []
alignedPairs i ([_], [])
  | i `elem`
      [BUNDLE, DBG_INSTR_REF, DBG_PHI, DBG_VALUE, DBG_VALUE_LIST,
       ICALL_BRANCH_FUNNEL, INLINEASM, INLINEASM_BR, KILL, PATCHABLE_OP,
       PATCHABLE_RET, PATCHABLE_TAIL_CALL]
    = []
alignedPairs i ([_], [_]) | i `elem` [CMPTermZMB] = []
alignedPairs i ([_], [_]) | i `elem` [FAULTING_OP, G_PHI, PHI] = []
alignedPairs i ([variable], [_, variable'])
  | i `elem` [DecMB] = [(variable, variable')]
alignedPairs i ([variable], [variable'])
  | i `elem` [G_DEC, G_DEC_TMP, G_INC, G_INC_TMP, IncMB, STATEPOINT]
    = [(variable, variable')]
alignedPairs i ([_], [_]) | i `elem` [G_CMPZ] = []
alignedPairs _ _ = []

