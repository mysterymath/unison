-- This file has been generated by specsgen. Do not modify by hand!

module Unison.Target.MOS.SpecsGen.ReadWriteInfo (readWriteInfo)
       where
import Unison
import Unison.Target.MOS.SpecsGen.MOSInstructionDecl
import Unison.Target.MOS.MOSRegisterDecl
readWriteInfo i
  | i `elem`
      [ADCImag8, ADCImm, ANDImag8, ANDImm, ANNOTATION_LABEL, ARITH_FENCE,
       ASL, AddrHistk, AddrLostk, BR, BRA, BUNDLE, CFI_INSTRUCTION, CLV,
       CMPImag8, CMPImm, COPY, COPY_TO_REGCLASS, DBG_INSTR_REF, DBG_LABEL,
       DBG_PHI, DBG_VALUE, DBG_VALUE_LIST, DE, DECImag8, EH_LABEL,
       EORImag8, EORImm, EXTRACT_SUBREG, GC_LABEL, G_ABS, G_ADD,
       G_ADDRSPACE_CAST, G_AND, G_ANYEXT, G_ASHR, G_ASSERT_ALIGN,
       G_ASSERT_SEXT, G_ASSERT_ZEXT, G_BITCAST, G_BITREVERSE,
       G_BLOCK_ADDR, G_BR, G_BRCOND, G_BRCOND_IMM, G_BRINDIRECT, G_BRJT,
       G_BSWAP, G_BUILD_VECTOR, G_BUILD_VECTOR_TRUNC, G_CMPZ,
       G_CONCAT_VECTORS, G_CONSTANT, G_CONSTANT_POOL, G_CTLZ,
       G_CTLZ_ZERO_UNDEF, G_CTPOP, G_CTTZ, G_CTTZ_ZERO_UNDEF, G_DEC,
       G_DYN_STACKALLOC, G_EXTRACT, G_EXTRACT_VECTOR_ELT, G_FABS, G_FADD,
       G_FCANONICALIZE, G_FCEIL, G_FCMP, G_FCONSTANT, G_FCOPYSIGN, G_FCOS,
       G_FDIV, G_FENCE, G_FEXP, G_FEXP2, G_FFLOOR, G_FLOG, G_FLOG10,
       G_FLOG2, G_FMA, G_FMAD, G_FMAXIMUM, G_FMAXNUM, G_FMAXNUM_IEEE,
       G_FMINIMUM, G_FMINNUM, G_FMINNUM_IEEE, G_FMUL, G_FNEARBYINT,
       G_FNEG, G_FPEXT, G_FPOW, G_FPOWI, G_FPTOSI, G_FPTOUI, G_FPTRUNC,
       G_FRAME_INDEX, G_FREEZE, G_FREM, G_FRINT, G_FSHL, G_FSHR, G_FSIN,
       G_FSQRT, G_FSUB, G_GLOBAL_VALUE, G_ICMP, G_IMPLICIT_DEF, G_INC,
       G_INSERT, G_INSERT_VECTOR_ELT, G_INTRINSIC,
       G_INTRINSIC_FPTRUNC_ROUND, G_INTRINSIC_LRINT, G_INTRINSIC_ROUND,
       G_INTRINSIC_ROUNDEVEN, G_INTRINSIC_TRUNC, G_INTTOPTR,
       G_INVOKE_REGION_START, G_IS_FPCLASS, G_JUMP_TABLE, G_LLROUND,
       G_LROUND, G_LSHR, G_LSHRE, G_MERGE_VALUES, G_MUL, G_OR, G_PHI,
       G_PTRMASK, G_PTRTOINT, G_PTR_ADD, G_READCYCLECOUNTER,
       G_READ_REGISTER, G_ROTL, G_ROTR, G_SADDE, G_SADDO, G_SADDSAT,
       G_SBC, G_SBFX, G_SDIV, G_SDIVFIX, G_SDIVFIXSAT, G_SDIVREM,
       G_SELECT, G_SEXT, G_SEXT_INREG, G_SHL, G_SHLE, G_SHUFFLE_VECTOR,
       G_SITOFP, G_SMAX, G_SMIN, G_SMULFIX, G_SMULFIXSAT, G_SMULH,
       G_SMULO, G_SREM, G_SSHLSAT, G_SSUBE, G_SSUBO, G_SSUBSAT,
       G_STRICT_FADD, G_STRICT_FDIV, G_STRICT_FMA, G_STRICT_FMUL,
       G_STRICT_FREM, G_STRICT_FSQRT, G_STRICT_FSUB, G_SUB, G_TRUNC,
       G_UADDE, G_UADDO, G_UADDSAT, G_UBFX, G_UDIV, G_UDIVFIX,
       G_UDIVFIXSAT, G_UDIVREM, G_UITOFP, G_UMAX, G_UMIN, G_UMULFIX,
       G_UMULFIXSAT, G_UMULH, G_UMULO, G_UNMERGE_VALUES, G_UREM,
       G_USHLSAT, G_USUBE, G_USUBO, G_USUBSAT, G_VECREDUCE_ADD,
       G_VECREDUCE_AND, G_VECREDUCE_FADD, G_VECREDUCE_FMAX,
       G_VECREDUCE_FMIN, G_VECREDUCE_FMUL, G_VECREDUCE_MUL,
       G_VECREDUCE_OR, G_VECREDUCE_SEQ_FADD, G_VECREDUCE_SEQ_FMUL,
       G_VECREDUCE_SMAX, G_VECREDUCE_SMIN, G_VECREDUCE_UMAX,
       G_VECREDUCE_UMIN, G_VECREDUCE_XOR, G_WRITE_REGISTER, G_XOR, G_ZEXT,
       ICALL_BRANCH_FUNNEL, IMPLICIT_DEF, IN, INCImag8, INLINEASM,
       INLINEASM_BR, INSERT_SUBREG, JMP, JMPIndir, JSR, KILL, LDCImm,
       LDImag8, LDImm, LDImm1, LDImm16, LDImm16Remat, LDZ, LIFETIME_END,
       LIFETIME_START, LOCAL_ESCAPE, LSR, MEMBARRIER, ORAImag8, ORAImm,
       PATCHABLE_FUNCTION_ENTER, PATCHABLE_FUNCTION_EXIT, PATCHABLE_RET,
       PATCHABLE_TAIL_CALL, PHI, PREALLOCATED_ARG, PREALLOCATED_SETUP,
       PSEUDO_PROBE, REG_SEQUENCE, ROL, ROR, RTI, RTS, SBCImag8, SBCImm,
       STImag8, SUBREG_TO_REG, SelectImm, TA, T_A, TailJMP]
    = ([], [])
  | i `elem`
      [G_BZERO, G_INDEXED_STORE, G_MEMSET, G_STORE, G_STORE_ABS,
       G_STORE_ABS_IDX, G_STORE_INDIR_IDX, G_VASTART, PH, STAbs, STAbsIdx,
       STIndirIdx, STStk, STZAbs, STZAbsIdx, STZImag8]
    = ([], [Memory "mem"])
  | i `elem` [GBR] = ([], [OtherSideEffect C])
  | i `elem` [DEC, DecPtr, INC, IncPtr] =
    ([], [OtherSideEffect C, OtherSideEffect V])
  | i `elem` [CMPTermImag8, CMPTermImm, CMPTermZ, CMPTermZMB] =
    ([], [OtherSideEffect NZ])
  | i `elem`
      [ADCAbs, ADCAbsIdx, ADCIndirIdx, ANDAbs, ANDAbsIdx, ANDIndirIdx,
       BITAbs, CMPAbs, CMPAbsIdx, CMPIndirIdx, EORAbs, EORAbsIdx,
       EORIndirIdx, G_INDEXED_LOAD, G_INDEXED_SEXTLOAD,
       G_INDEXED_ZEXTLOAD, G_LOAD, G_LOAD_ABS, G_LOAD_ABS_IDX,
       G_LOAD_INDIR_IDX, G_SEXTLOAD, G_ZEXTLOAD, LDAAbsIdx, LDAbs,
       LDAbsIdx, LDIndirIdx, LDStk, LDXAbsIdx, LDYAbsIdx,
       LOAD_STACK_GUARD, ORAAbs, ORAAbsIdx, ORAIndirIdx, PATCHPOINT, PL,
       SBCAbs, SBCAbsIdx, SBCIndirIdx, STACKMAP]
    = ([Memory "mem"], [])
  | i `elem`
      [ADC_Absolute, ADC_AbsoluteLong, ADC_AbsoluteX, ADC_AbsoluteXLong,
       ADC_AbsoluteY, ADC_Immediate, ADC_Immediate16, ADC_IndexedIndirect,
       ADC_Indirect, ADC_IndirectIndexed, ADC_IndirectIndexedLong,
       ADC_IndirectLong, ADC_IndirectZeroPageZ, ADC_ZeroPage,
       ADC_ZeroPageX, AND_Absolute, AND_AbsoluteLong, AND_AbsoluteX,
       AND_AbsoluteXLong, AND_AbsoluteY, AND_Immediate, AND_Immediate16,
       AND_IndexedIndirect, AND_Indirect, AND_IndirectIndexed,
       AND_IndirectIndexedLong, AND_IndirectLong, AND_IndirectZeroPageZ,
       AND_ZeroPage, AND_ZeroPageX, ASLAbs, ASLAbsIdx, ASL_Absolute,
       ASL_AbsoluteX, ASL_Accumulator, ASL_ZeroPage, ASL_ZeroPageX,
       ASR_Implied, ASR_ZeroPage, ASR_ZeroPageX, ASW_Absolute,
       BCC_Relative, BCC_Relative16, BCS_Relative, BCS_Relative16,
       BEQ_Relative, BEQ_Relative16, BIT_Absolute, BIT_AbsoluteX,
       BIT_Immediate, BIT_ZeroPage, BIT_ZeroPageX, BMI_Relative,
       BMI_Relative16, BNE_Relative, BNE_Relative16, BPL_Relative,
       BPL_Relative16, BRA_Relative, BRA_Relative16, BRK_Implied,
       BRL_Relative16, BSR_Relative16, BVC_Relative, BVC_Relative16,
       BVS_Relative, BVS_Relative16, CLC_Implied, CLD_Implied,
       CLE_Implied, CLI_Implied, CLV_Implied, CMP_Absolute,
       CMP_AbsoluteLong, CMP_AbsoluteX, CMP_AbsoluteXLong, CMP_AbsoluteY,
       CMP_Immediate, CMP_Immediate16, CMP_IndexedIndirect, CMP_Indirect,
       CMP_IndirectIndexed, CMP_IndirectIndexedLong, CMP_IndirectLong,
       CMP_IndirectZeroPageZ, CMP_ZeroPage, CMP_ZeroPageX, CPX_Absolute,
       CPX_Immediate, CPX_Immediate16, CPX_ZeroPage, CPY_Absolute,
       CPY_Immediate, CPY_Immediate16, CPY_ZeroPage, CPZ_Absolute,
       CPZ_Immediate, CPZ_ZeroPage, DECAbs, DECAbsIdx, DEC_Absolute,
       DEC_AbsoluteX, DEC_Accumulator, DEC_ZeroPage, DEC_ZeroPageX,
       DEW_ZeroPage, DEX_Implied, DEY_Implied, DEZ_Implied, EOR_Absolute,
       EOR_AbsoluteLong, EOR_AbsoluteX, EOR_AbsoluteXLong, EOR_AbsoluteY,
       EOR_Immediate, EOR_Immediate16, EOR_IndexedIndirect, EOR_Indirect,
       EOR_IndirectIndexed, EOR_IndirectIndexedLong, EOR_IndirectLong,
       EOR_IndirectZeroPageZ, EOR_ZeroPage, EOR_ZeroPageX, FAULTING_OP,
       FENTRY_CALL, G_ATOMICRMW_ADD, G_ATOMICRMW_AND, G_ATOMICRMW_FADD,
       G_ATOMICRMW_FMAX, G_ATOMICRMW_FMIN, G_ATOMICRMW_FSUB,
       G_ATOMICRMW_MAX, G_ATOMICRMW_MIN, G_ATOMICRMW_NAND, G_ATOMICRMW_OR,
       G_ATOMICRMW_SUB, G_ATOMICRMW_UDEC_WRAP, G_ATOMICRMW_UINC_WRAP,
       G_ATOMICRMW_UMAX, G_ATOMICRMW_UMIN, G_ATOMICRMW_XCHG,
       G_ATOMICRMW_XOR, G_ATOMIC_CMPXCHG, G_ATOMIC_CMPXCHG_WITH_SUCCESS,
       G_DEC_TMP, G_INC_TMP, G_INTRINSIC_W_SIDE_EFFECTS, G_MEMCPY,
       G_MEMCPY_INLINE, G_MEMMOVE, G_VAARG, INCAbs, INCAbsIdx,
       INC_Absolute, INC_AbsoluteX, INC_Accumulator, INC_ZeroPage,
       INC_ZeroPageX, INW_ZeroPage, INX_Implied, INY_Implied, INZ_Implied,
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
       LDY_ZeroPageX, LDZ_Absolute, LDZ_AbsoluteX, LDZ_Immediate, LSRAbs,
       LSRAbsIdx, LSR_Absolute, LSR_AbsoluteX, LSR_Accumulator,
       LSR_ZeroPage, LSR_ZeroPageX, NEG_Implied, NOP_Implied,
       ORA_Absolute, ORA_AbsoluteLong, ORA_AbsoluteX, ORA_AbsoluteXLong,
       ORA_AbsoluteY, ORA_Immediate, ORA_Immediate16, ORA_IndexedIndirect,
       ORA_Indirect, ORA_IndirectIndexed, ORA_IndirectIndexedLong,
       ORA_IndirectLong, ORA_IndirectZeroPageZ, ORA_ZeroPage,
       ORA_ZeroPageX, PATCHABLE_EVENT_CALL, PATCHABLE_OP,
       PATCHABLE_TYPED_EVENT_CALL, PHA_Implied, PHP_Implied, PHW_Absolute,
       PHW_Immediate, PHX_Implied, PHY_Implied, PHZ_Implied, PLA_Implied,
       PLP_Implied, PLX_Implied, PLY_Implied, PLZ_Implied, REP_Immediate,
       ROLAbs, ROLAbsIdx, ROL_Absolute, ROL_AbsoluteX, ROL_Accumulator,
       ROL_ZeroPage, ROL_ZeroPageX, RORAbs, RORAbsIdx, ROR_Absolute,
       ROR_AbsoluteX, ROR_Accumulator, ROR_ZeroPage, ROR_ZeroPageX,
       ROW_Absolute, RTI_Implied, RTL_Implied, RTN_Immediate, RTS_Implied,
       SBC_Absolute, SBC_AbsoluteLong, SBC_AbsoluteX, SBC_AbsoluteXLong,
       SBC_AbsoluteY, SBC_Immediate, SBC_Immediate16, SBC_IndexedIndirect,
       SBC_Indirect, SBC_IndirectIndexed, SBC_IndirectIndexedLong,
       SBC_IndirectLong, SBC_IndirectZeroPageZ, SBC_ZeroPage,
       SBC_ZeroPageX, SEC_Implied, SED_Implied, SEE_Implied, SEI_Implied,
       SEP_Immediate, STATEPOINT, STA_Absolute, STA_AbsoluteLong,
       STA_AbsoluteX, STA_AbsoluteXLong, STA_AbsoluteY,
       STA_IndexedIndirect, STA_Indirect, STA_IndirectIndexed,
       STA_IndirectIndexedLong, STA_IndirectLong,
       STA_IndirectStackPointerY, STA_IndirectZeroPageZ, STA_ZeroPage,
       STA_ZeroPageX, STX_Absolute, STX_AbsoluteY, STX_ZeroPage,
       STX_ZeroPageY, STY_Absolute, STY_AbsoluteX, STY_ZeroPage,
       STY_ZeroPageX, STZ_Absolute, STZ_AbsoluteX, STZ_ZeroPage,
       STZ_ZeroPageX, TAB_Implied, TAX_Implied, TAY_Implied, TAZ_Implied,
       TBA_Implied, TRB_Absolute, TRB_ZeroPage, TSB_Absolute,
       TSB_ZeroPage, TSX_Implied, TSY_Implied, TXA_Implied, TXS_Implied,
       TYA_Implied, TYS_Implied, TZA_Implied]
    = ([Memory "mem"], [Memory "mem"])
  | i `elem` [DecMB, IncMB] =
    ([Memory "mem"],
     [Memory "mem", OtherSideEffect C, OtherSideEffect V])
  | i `elem` [CMPTermAbs, CMPTermIdx, CMPTermIndir] =
    ([Memory "mem"], [OtherSideEffect NZ])
  | i `elem` [ADJCALLSTACKDOWN, ADJCALLSTACKUP] =
    ([OtherSideEffect RS0], [OtherSideEffect RS0])

