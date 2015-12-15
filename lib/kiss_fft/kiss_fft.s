	.cpu arm10tdmi
	.eabi_attribute 27, 3	@ Tag_ABI_HardFP_use
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.fpu vfp
	.eabi_attribute 23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"kiss_fft.c"
@ GNU C (crosstool-NG 1.18.0) version 4.7.3 20130102 (prerelease) (arm-unknown-linux-gnueabi)
@	compiled by GNU C version 4.6.3, GMP version 5.0.2, MPFR version 3.1.0, MPC version 0.9
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  kiss_fft.c -mfloat-abi=hard -mtls-dialect=gnu -O3
@ -ffast-math -fomit-frame-pointer -fverbose-asm
@ options enabled:  -fassociative-math -fauto-inc-dec -fbranch-count-reg
@ -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
@ -fcprop-registers -fcrossjumping -fcse-follow-jumps -fcx-limited-range
@ -fdebug-types-section -fdefer-pop -fdelete-null-pointer-checks
@ -fdevirtualize -fdwarf2-cfi-asm -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
@ -fgcse-after-reload -fgcse-lm -fgnu-runtime -fguess-branch-probability
@ -fident -fif-conversion -fif-conversion2 -findirect-inlining -finline
@ -finline-atomics -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
@ -fipa-pure-const -fipa-reference -fipa-sra -fira-share-save-slots
@ -fira-share-spill-slots -fivopts -fkeep-static-consts
@ -fleading-underscore -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-register-move
@ -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole
@ -fpeephole2 -fpredictive-commoning -fprefetch-loop-arrays
@ -freciprocal-math -freg-struct-return -fregmove -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
@ -fschedule-insns2 -fsection-anchors -fshow-column -fshrink-wrap
@ -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
@ -fstrict-overflow -fstrict-volatile-bitfields -fthread-jumps
@ -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
@ -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename
@ -ftree-cselim -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop
@ -ftree-fre -ftree-loop-distribute-patterns -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
@ -ftree-slp-vectorize -ftree-sra -ftree-switch-conversion
@ -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vectorize
@ -ftree-vrp -funit-at-a-time -funsafe-math-optimizations -funswitch-loops
@ -fverbose-asm -fzero-initialized-in-bss -marm -mglibc -mlittle-endian
@ -msched-prolog -mvectorize-with-neon-quad

	.text
	.align	2
	.type	kf_work, %function
kf_work:
	@ args = 8, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
@ BLOCK 2 freq:44 seq:0
@ PRED: ENTRY [100.0%]  (fallthru)
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}	@,
	fstmfdd	sp!, {d8, d9, d10, d11}	@,
	sub	sp, sp, #52	@,,
	ldr	ip, [sp, #120]	@ factors, factors
	mov	r9, r0	@ Fout, Fout
	ldmia	ip, {r5, r6}	@ factors,,
	str	r6, [sp, #16]	@, %sfp
	ldr	fp, [sp, #16]	@, %sfp
	mov	r6, r1	@ f, f
	mul	r7, fp, r5	@ tmp710,, p
	cmp	fp, #1	@,
	str	r2, [sp, #24]	@ fstride, %sfp
	mov	r8, r3	@ in_stride, in_stride
	add	r7, r0, r7, asl #3	@, Fout_end, Fout, tmp710,
	ldr	r4, [sp, #124]	@ st, st
@ SUCC: 33 [28.0%]  (can_fallthru) 3 [72.0%]  (fallthru,can_fallthru)
	beq	.L45	@,
@ BLOCK 3 freq:32 seq:1
@ PRED: 2 [72.0%]  (fallthru,can_fallthru)
	mov	sl, r2, asl #3	@ pretmp.110, tmp11,
	mul	fp, r3, sl	@, in_stride, pretmp.110
	str	fp, [sp, #12]	@, %sfp
	ldr	fp, [sp, #24]	@, %sfp
	add	ip, ip, #8	@, factors,
	mul	r0, fp, r5	@,, p
	ldr	fp, [sp, #16]	@, %sfp
	str	ip, [sp, #28]	@, %sfp
	mov	ip, fp, asl #3	@ pretmp.120,,
	str	r5, [sp, #32]	@ p, %sfp
	mov	fp, r9	@ Fout, Fout
	str	r9, [sp, #36]	@ Fout, %sfp
	ldr	r6, [sp, #28]	@ tmp889, %sfp
	str	r0, [sp, #20]	@, %sfp
	str	sl, [sp, #28]	@ pretmp.110, %sfp
	mov	r9, ip	@ pretmp.120, pretmp.120
	mov	r5, r1	@ f, f
@ SUCC: 4 [100.0%]  (fallthru,can_fallthru)
	mov	sl, r0	@ pretmp.120,
@ BLOCK 4 freq:226 seq:2
@ PRED: 3 [100.0%]  (fallthru,can_fallthru) 4 [86.0%]  (dfs_back,can_fallthru)
.L10:
	mov	r0, fp	@, Fout
	mov	r1, r5	@, f
	str	r6, [sp, #0]	@ tmp889,
	str	r4, [sp, #4]	@ st,
	mov	r2, sl	@, pretmp.120
	mov	r3, r8	@, in_stride
	bl	kf_work	@
	add	fp, fp, r9	@ Fout, Fout, pretmp.120
	ldr	r0, [sp, #12]	@, %sfp
	cmp	fp, r7	@ Fout, Fout_end
	add	r5, r5, r0	@ f, f,
@ SUCC: 4 [86.0%]  (dfs_back,can_fallthru) 5 [14.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L10	@,
@ BLOCK 5 freq:32 seq:3
@ PRED: 4 [14.0%]  (fallthru,can_fallthru,loop_exit)
	ldr	r5, [sp, #32]	@ p, %sfp
	ldr	r9, [sp, #36]	@ Fout, %sfp
@ SUCC: 6 [100.0%]  (fallthru,can_fallthru)
	ldr	sl, [sp, #28]	@ pretmp.110, %sfp
@ BLOCK 6 freq:44 seq:4
@ PRED: 5 [100.0%]  (fallthru,can_fallthru) 35 [100.0%] 
.L11:
	sub	r3, r5, #2	@ tmp714, p,
@ SUCC: 20 [20.0%]  17 [20.0%]  14 [20.0%]  11 [20.0%]  7 [20.0%] 
	cmp	r3, #3	@ tmp714,
	ldrls	pc, [pc, r3, asl #2]	@ tmp714
	b	.L4	@
.L9:
	.word	.L5
	.word	.L6
	.word	.L7
	.word	.L8
@ BLOCK 7 freq:9 seq:5
@ PRED: 6 [20.0%] 
.L8:
	ldr	r5, [sp, #24]	@, %sfp
	ldr	r3, [sp, #16]	@ D.7702, %sfp
	ldr	r6, [sp, #16]	@, %sfp
	mul	r3, r5, r3	@ D.7702,, D.7702
	add	ip, r4, #264	@ twiddles, st,
	add	r2, r3, #33	@ tmp809, D.7702,
	add	r2, r4, r2, asl #3	@, tmp811, st, tmp809,
	add	r3, ip, r3, asl #4	@, D.7700, twiddles, D.7702,
	add	r5, r6, r6, asl #1	@, tmp818,,,
	add	r7, sp, #48	@,,
	cmp	r6, #0	@,
	ldmia	r2, {r0, r1}	@ tmp811,,
	flds	s5, [r3, #0]	@ yb$r, D.7700_233->r
	stmdb	r7, {r0, r1}	@,,
	flds	s4, [r3, #4]	@ yb$i, D.7700_233->i
	add	r2, r9, r5, asl #3	@, Fout3, Fout, tmp818,
	add	r0, r9, r6, asl #3	@, Fout1, Fout,,
	add	r1, r9, r6, asl #4	@, Fout2, Fout,,
	add	r3, r9, r6, asl #5	@, Fout4, Fout,,
@ SUCC: 8 [91.0%]  (fallthru,can_fallthru) 10 [9.0%]  (can_fallthru)
	ble	.L1	@,
@ BLOCK 8 freq:8 seq:6
@ PRED: 7 [91.0%]  (fallthru,can_fallthru)
	flds	s6, [sp, #40]	@ pretmp.106, ya.r
	flds	s7, [sp, #44]	@ pretmp.106, ya.i
	ldr	fp, [sp, #24]	@, %sfp
	mov	r6, #0	@ ivtmp.236,
	add	r7, fp, fp, asl #1	@, tmp823,,,
	mov	fp, r7, asl #3	@ tmp824, tmp823,
	ldr	r7, [sp, #24]	@, %sfp
	add	r9, r9, #8	@ ivtmp.221, Fout,
	mov	r7, r7, asl #4	@,,
	str	r7, [sp, #12]	@, %sfp
	ldr	r7, [sp, #24]	@, %sfp
	add	r0, r0, #8	@ ivtmp.223, Fout1,
	mov	r7, r7, asl #5	@,,
	add	r1, r1, #8	@ ivtmp.224, Fout2,
	add	r2, r2, #8	@ ivtmp.225, Fout3,
	add	r3, r3, #8	@ ivtmp.226, Fout4,
	mov	r8, ip	@ ivtmp.241, ivtmp.241
	mov	r5, ip	@ ivtmp.241, ivtmp.241
	mov	sl, r6	@ u, ivtmp.236
@ SUCC: 9 [100.0%]  (fallthru,can_fallthru)
	str	r7, [sp, #20]	@, %sfp
@ BLOCK 9 freq:89 seq:7
@ PRED: 9 [91.0%]  (dfs_back,can_fallthru) 8 [100.0%]  (fallthru,can_fallthru)
.L20:
	flds	s13, [ip, #4]	@ D.7676, MEM[base: D.8032_734, offset: 4B]
	flds	s20, [r2, #-8]	@ D.7670, MEM[base: D.8035_737, offset: 4294967288B]
	flds	s19, [r2, #-4]	@ D.7665, MEM[base: D.8035_737, offset: 4294967292B]
	flds	s15, [r5, #4]	@ D.7664, MEM[base: D.8036_738, offset: 4B]
	flds	s23, [r1, #-8]	@ D.7682, MEM[base: D.8031_733, offset: 4294967288B]
	flds	s22, [r1, #-4]	@ D.7677, MEM[base: D.8031_733, offset: 4294967292B]
	add	r7, r6, #33	@ tmp825, ivtmp.236,
	add	r7, r4, r7, asl #3	@, D.7692, st, tmp825,
	flds	s18, [r5, #0]	@ D.7667, MEM[base: D.8036_738, offset: 0B]
	flds	s12, [r7, #4]	@ D.7688, D.7692_252->i
	flds	s17, [r0, #-4]	@ D.7689, MEM[base: D.8029_731, offset: 4294967292B]
	flds	s16, [r0, #-8]	@ D.7695, MEM[base: D.8029_731, offset: 4294967288B]
	flds	s1, [r3, #-8]	@ D.7658, MEM[base: D.8039_741, offset: 4294967288B]
	flds	s2, [r3, #-4]	@ D.7653, MEM[base: D.8039_741, offset: 4294967292B]
	flds	s11, [r8, #4]	@ D.7652, MEM[base: D.8040_742, offset: 4B]
	flds	s21, [ip, #0]	@ D.7679, MEM[base: D.8032_734, offset: 0B]
	fmuls	s14, s15, s19	@ D.7662, D.7664, D.7665
	fmuls	s10, s13, s22	@ D.7674, D.7676, D.7677
	fmuls	s15, s15, s20	@ D.7659, D.7664, D.7670
	fmuls	s13, s13, s23	@ D.7671, D.7676, D.7682
	flds	s0, [r7, #0]	@ D.7691, D.7692_252->r
	flds	s3, [r8, #0]	@ D.7655, MEM[base: D.8040_742, offset: 0B]
	fmscs	s14, s18, s20	@ D.7662, D.7667, D.7670
	fmacs	s15, s19, s18	@ D.7659, D.7665, D.7667
	fmuls	s8, s17, s12	@ D.7686, D.7689, D.7688
	fmuls	s9, s11, s2	@ D.7650, D.7652, D.7653
	fmacs	s13, s22, s21	@ D.7671, D.7677, D.7679
	fmuls	s12, s16, s12	@ D.7683, D.7695, D.7688
	fmuls	s11, s11, s1	@ D.7647, D.7652, D.7658
	fmscs	s10, s21, s23	@ D.7674, D.7679, D.7682
	fmacs	s12, s17, s0	@ D.7683, D.7689, D.7691
	fmscs	s8, s16, s0	@ D.7686, D.7695, D.7691
	fadds	s17, s14, s10	@ D.7642, D.7662, D.7674
	fadds	s19, s15, s13	@ D.7641, D.7659, D.7671
	fmscs	s9, s3, s1	@ D.7650, D.7655, D.7658
	fmacs	s11, s2, s3	@ D.7647, D.7653, D.7655
	fadds	s18, s9, s8	@ D.7646, D.7650, D.7686
	fsubs	s10, s10, s14	@ D.7640, D.7674, D.7662
	fsubs	s9, s8, s9	@ D.7644, D.7686, D.7650
	fsubs	s14, s12, s11	@ D.7643, D.7683, D.7647
	fmuls	s20, s17, s5	@ tmp849, D.7642, yb$r
	fadds	s11, s11, s12	@ D.7645, D.7647, D.7683
	fmuls	s16, s17, s6	@ tmp863, D.7642, pretmp.106
	fmuls	s0, s19, s5	@ tmp852, D.7641, yb$r
	fmuls	s1, s19, s6	@ tmp866, D.7641, pretmp.106
	flds	s3, [r9, #-8]	@ scratch$0$r, MEM[base: D.8027_729, offset: 4294967288B]
	flds	s2, [r9, #-4]	@ scratch$0$i, MEM[base: D.8027_729, offset: 4294967292B]
	fsubs	s8, s13, s15	@ D.7639, D.7671, D.7659
	fmuls	s12, s14, s7	@ D.7622, D.7643, pretmp.106
	fmuls	s13, s9, s7	@ D.7620, D.7644, pretmp.106
	fmuls	s15, s10, s7	@ D.7600, D.7640, pretmp.106
	fmacs	s0, s11, s6	@ tmp852, D.7645, pretmp.106
	fmacs	s1, s11, s5	@ tmp866, D.7645, yb$r
	fmacs	s20, s18, s6	@ tmp849, D.7646, pretmp.106
	fmuls	s14, s14, s4	@ D.7603, D.7643, yb$i
	fmacs	s16, s18, s5	@ tmp863, D.7646, yb$r
	fadds	s20, s20, s3	@ D.7630, tmp849, scratch$0$r
	fmscs	s14, s8, s7	@ D.7603, D.7639, pretmp.106
	fadds	s16, s16, s3	@ D.7610, tmp863, scratch$0$r
	fmacs	s13, s10, s4	@ D.7620, D.7640, yb$i
	fmscs	s15, s9, s4	@ D.7600, D.7644, yb$i
	fadds	s0, s0, s2	@ D.7626, tmp852, scratch$0$i
	fadds	s1, s1, s2	@ D.7606, tmp866, scratch$0$i
	fmacs	s12, s8, s4	@ D.7622, D.7639, yb$i
	fadds	s11, s11, s19	@ tmp845, D.7645, D.7641
	fadds	s17, s18, s17	@ tmp843, D.7646, D.7642
	fsubs	s8, s20, s12	@ tmp857, D.7630, D.7622
	fadds	s2, s11, s2	@ tmp846, tmp845, scratch$0$i
	fadds	s9, s0, s13	@ tmp858, D.7626, D.7620
	fadds	s10, s16, s14	@ tmp871, D.7610, D.7603
	fadds	s11, s1, s15	@ tmp872, D.7606, D.7600
	fadds	s12, s20, s12	@ tmp859, D.7630, D.7622
	fadds	s3, s17, s3	@ tmp844, tmp843, scratch$0$r
	fsubs	s13, s0, s13	@ tmp860, D.7626, D.7620
	fsubs	s14, s16, s14	@ tmp873, D.7610, D.7603
	fsubs	s15, s1, s15	@ tmp874, D.7606, D.7600
	ldr	r7, [sp, #16]	@, %sfp
	add	sl, sl, #1	@ u, u,
	cmp	sl, r7	@ u,
	ldr	r7, [sp, #24]	@, %sfp
	fsts	s2, [r9, #-4]	@ tmp846, MEM[base: D.8027_729, offset: 4294967292B]
	add	r6, r6, r7	@ ivtmp.236, ivtmp.236,
	ldr	r7, [sp, #20]	@, %sfp
	fsts	s3, [r9, #-8]	@ tmp844, MEM[base: D.8027_729, offset: 4294967288B]
	add	r8, r8, r7	@ ivtmp.241, ivtmp.241,
	ldr	r7, [sp, #12]	@, %sfp
	fsts	s8, [r0, #-8]	@ tmp857, MEM[base: D.8029_731, offset: 4294967288B]
	fsts	s9, [r0, #-4]	@ tmp858, MEM[base: D.8029_731, offset: 4294967292B]
	add	ip, ip, r7	@ ivtmp.241, ivtmp.241,
	fsts	s12, [r3, #-8]	@ tmp859, MEM[base: D.8039_741, offset: 4294967288B]
	fsts	s13, [r3, #-4]	@ tmp860, MEM[base: D.8039_741, offset: 4294967292B]
	add	r5, r5, fp	@ ivtmp.241, ivtmp.241, tmp824
	fsts	s10, [r1, #-8]	@ tmp871, MEM[base: D.8031_733, offset: 4294967288B]
	fsts	s11, [r1, #-4]	@ tmp872, MEM[base: D.8031_733, offset: 4294967292B]
	add	r9, r9, #8	@ ivtmp.221, ivtmp.221,
	fsts	s14, [r2, #-8]	@ tmp873, MEM[base: D.8035_737, offset: 4294967288B]
	fsts	s15, [r2, #-4]	@ tmp874, MEM[base: D.8035_737, offset: 4294967292B]
	add	r0, r0, #8	@ ivtmp.223, ivtmp.223,
	add	r3, r3, #8	@ ivtmp.226, ivtmp.226,
	add	r1, r1, #8	@ ivtmp.224, ivtmp.224,
	add	r2, r2, #8	@ ivtmp.225, ivtmp.225,
@ SUCC: 9 [91.0%]  (dfs_back,can_fallthru) 10 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L20	@,
@ BLOCK 10 freq:35 seq:8
@ PRED: 7 [9.0%]  (can_fallthru) 16 [100.0%]  9 [9.0%]  (fallthru,can_fallthru,loop_exit) 13 [100.0%]  19 [100.0%] 
.L1:
@ SUCC: EXIT [100.0%] 
	add	sp, sp, #52	@,,
	fldmfdd	sp!, {d8, d9, d10, d11}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
@ BLOCK 11 freq:9 seq:9
@ PRED: 6 [20.0%] 
.L7:
	ldr	r5, [sp, #16]	@ k, %sfp
	ldr	fp, [sp, #24]	@, %sfp
	add	r0, r4, #264	@ tw3, st,
	add	r1, r5, r5, asl #1	@, tmp781, k, k,
	add	r8, fp, fp, asl #1	@, tmp775,,,
	ldr	r7, [r4, #4]	@ D.7525, st_26(D)->inverse
	add	r1, r9, r1, asl #3	@, ivtmp.216, Fout, tmp781,
	add	r2, r9, r5, asl #3	@, ivtmp.210, Fout, k,
	add	r3, r9, r5, asl #4	@, ivtmp.213, Fout, k,
	mov	r4, r0	@ tw3, tw3
	add	r9, r9, #8	@ ivtmp.205, Fout,
	mov	ip, r0	@ tw3, tw3
	mov	r8, r8, asl #3	@ tmp776, tmp775,
@ SUCC: 12 [100.0%]  (fallthru,can_fallthru)
	mov	r6, fp, asl #4	@ pretmp.110,,
@ BLOCK 12 freq:63 seq:10
@ PRED: 11 [100.0%]  (fallthru,can_fallthru) 12 [86.0%]  (dfs_back,can_fallthru)
.L17:
	flds	s10, [r0, #4]	@ D.7572, tw3_159->i
	flds	s2, [r2, #4]	@ D.7573, MEM[base: D.7959_676, offset: 4B]
	flds	s4, [r1, #0]	@ D.7552, MEM[base: D.7963_680, offset: 0B]
	flds	s5, [r1, #4]	@ D.7549, MEM[base: D.7963_680, offset: 4B]
	flds	s15, [r4, #4]	@ D.7548, tw3_185->i
	flds	s7, [r3, #0]	@ D.7564, MEM[base: D.7961_678, offset: 0B]
	flds	s8, [r3, #4]	@ D.7561, MEM[base: D.7961_678, offset: 4B]
	flds	s13, [ip, #4]	@ D.7560, tw3_172->i
	flds	s1, [r2, #0]	@ D.7576, MEM[base: D.7959_676, offset: 0B]
	flds	s3, [r0, #0]	@ D.7575, tw3_159->r
	flds	s6, [r4, #0]	@ D.7551, tw3_185->r
	flds	s9, [ip, #0]	@ D.7563, tw3_172->r
	fmuls	s11, s5, s15	@ D.7546, D.7549, D.7548
	fmuls	s12, s8, s13	@ D.7558, D.7561, D.7560
	fmuls	s14, s1, s10	@ D.7567, D.7576, D.7572
	fmuls	s15, s4, s15	@ D.7543, D.7552, D.7548
	fmuls	s10, s2, s10	@ D.7570, D.7573, D.7572
	fmuls	s13, s7, s13	@ D.7555, D.7564, D.7560
	fmacs	s14, s2, s3	@ D.7567, D.7573, D.7575
	fmscs	s10, s1, s3	@ D.7570, D.7576, D.7575
	fmacs	s15, s5, s6	@ D.7543, D.7549, D.7551
	fmscs	s12, s7, s9	@ D.7558, D.7564, D.7563
	fmacs	s13, s8, s9	@ D.7555, D.7561, D.7563
	fmscs	s11, s4, s6	@ D.7546, D.7552, D.7551
	flds	s8, [r9, #-8]	@ D.7542, MEM[base: D.7965_682, offset: 4294967288B]
	flds	s9, [r9, #-4]	@ D.7540, MEM[base: D.7965_682, offset: 4294967292B]
	fadds	s6, s11, s10	@ D.7536, D.7546, D.7570
	fadds	s7, s15, s14	@ D.7535, D.7543, D.7567
	fadds	s4, s12, s8	@ D.7538, D.7558, D.7542
	fadds	s5, s13, s9	@ D.7537, D.7555, D.7540
	fsubs	s2, s4, s6	@ tmp795, D.7538, D.7536
	fsubs	s3, s5, s7	@ tmp796, D.7537, D.7535
	fsts	s4, [r9, #-8]	@ D.7538, MEM[base: D.7965_682, offset: 4294967288B]
	fsts	s5, [r9, #-4]	@ D.7537, MEM[base: D.7965_682, offset: 4294967292B]
	fsts	s2, [r3, #0]	@ tmp795, MEM[base: D.7961_678, offset: 0B]
	fsts	s3, [r3, #4]	@ tmp796, MEM[base: D.7961_678, offset: 4B]
	fsubs	s15, s14, s15	@ D.7533, D.7567, D.7543
	flds	s4, [r9, #-8]	@ MEM[base: D.7965_682, offset: 4294967288B], MEM[base: D.7965_682, offset: 4294967288B]
	flds	s5, [r9, #-4]	@ MEM[base: D.7965_682, offset: 4294967292B], MEM[base: D.7965_682, offset: 4294967292B]
	fsubs	s11, s10, s11	@ D.7534, D.7570, D.7546
	fsubs	s13, s9, s13	@ D.7539, D.7540, D.7555
	fsubs	s12, s8, s12	@ D.7541, D.7542, D.7558
	cmp	r7, #0	@ D.7525,
	fsubsne	s10, s12, s15	@ tmp801, D.7541, D.7533
	faddsne	s14, s11, s13	@ tmp802, D.7534, D.7539
	faddseq	s10, s15, s12	@ tmp805, D.7533, D.7541
	fsubseq	s14, s13, s11	@ tmp806, D.7539, D.7534
	faddsne	s15, s15, s12	@ tmp803, D.7533, D.7541
	fsubsne	s13, s13, s11	@ tmp804, D.7539, D.7534
	fsubseq	s15, s12, s15	@ tmp807, D.7541, D.7533
	faddseq	s13, s11, s13	@ tmp808, D.7534, D.7539
	fadds	s6, s4, s6	@ tmp797, MEM[base: D.7965_682, offset: 4294967288B], D.7536
	fadds	s7, s5, s7	@ tmp799, MEM[base: D.7965_682, offset: 4294967292B], D.7535
	subs	r5, r5, #1	@ k, k,
	fsts	s6, [r9, #-8]	@ tmp797, MEM[base: D.7965_682, offset: 4294967288B]
	fsts	s7, [r9, #-4]	@ tmp799, MEM[base: D.7965_682, offset: 4294967292B]
	add	r0, r0, sl	@ tw3, tw3, pretmp.110
	fsts	s10, [r2, #0]	@ tmp805,* ivtmp.210
	fsts	s14, [r2, #4]	@ tmp806,
	add	r4, r4, r8	@ tw3, tw3, tmp776
	fsts	s15, [r1, #0]	@ tmp807,* ivtmp.216
	fsts	s13, [r1, #4]	@ tmp808,
	add	ip, ip, r6	@ tw3, tw3, pretmp.110
	add	r9, r9, #8	@ ivtmp.205, ivtmp.205,
	add	r2, r2, #8	@ ivtmp.210, ivtmp.210,
	add	r3, r3, #8	@ ivtmp.213, ivtmp.213,
	add	r1, r1, #8	@ ivtmp.216, ivtmp.216,
@ SUCC: 12 [86.0%]  (dfs_back,can_fallthru) 13 [14.0%]  (fallthru)
	bne	.L17	@,
@ BLOCK 13 freq:9 seq:11
@ PRED: 12 [14.0%]  (fallthru)
@ SUCC: 10 [100.0%] 
	b	.L1	@
@ BLOCK 14 freq:9 seq:12
@ PRED: 6 [20.0%] 
.L6:
	ldr	ip, [sp, #16]	@ m, %sfp
	ldr	r6, [sp, #24]	@, %sfp
	add	r7, sp, #48	@,,
	mul	r3, r6, ip	@ tmp730,, m
	add	r3, r3, #33	@ tmp731, tmp730,
	add	r3, r4, r3, asl #3	@, tmp733, st, tmp731,
	ldmia	r3, {r0, r1}	@ tmp733,,
	stmdb	r7, {r0, r1}	@,,
	fldd	d6, .L46	@ tmp893,
	flds	s17, [sp, #44]	@ pretmp.114, epi3.i
	add	r4, r4, #264	@ tw2, st,
	add	r3, r9, ip, asl #3	@, ivtmp.186, Fout, m,
	add	r2, r9, ip, asl #4	@, ivtmp.189, Fout, m,
	mov	r0, r6, asl #4	@ pretmp.113,,
	add	r9, r9, #8	@ ivtmp.181, Fout,
@ SUCC: 15 [100.0%]  (fallthru,can_fallthru)
	mov	r1, r4	@ tw2, tw2
@ BLOCK 15 freq:63 seq:13
@ PRED: 14 [100.0%]  (fallthru,can_fallthru) 15 [86.0%]  (dfs_back,can_fallthru)
.L14:
	flds	s6, [r4, #4]	@ D.7505, tw2_91->i
	flds	s7, [r1, #4]	@ D.7493, tw2_104->i
	flds	s3, [r2, #4]	@ D.7494, MEM[base: D.7910_646, offset: 4B]
	flds	s1, [r3, #4]	@ D.7506, MEM[base: D.7908_644, offset: 4B]
	flds	s5, [r1, #0]	@ D.7496, tw2_104->r
	flds	s2, [r4, #0]	@ D.7508, tw2_91->r
	flds	s0, [r2, #0]	@ D.7497, MEM[base: D.7910_646, offset: 0B]
	flds	s16, [r3, #0]	@ D.7509, MEM[base: D.7908_644, offset: 0B]
	fmuls	s8, s1, s6	@ D.7503, D.7506, D.7505
	fmuls	s9, s3, s7	@ D.7491, D.7494, D.7493
	fmscs	s8, s16, s2	@ D.7503, D.7509, D.7508
	fmscs	s9, s0, s5	@ D.7491, D.7497, D.7496
	flds	s14, [r9, #-8]	@ MEM[base: D.7912_648, offset: 4294967288B], MEM[base: D.7912_648, offset: 4294967288B]
	fadds	s4, s9, s8	@ D.7487, D.7491, D.7503
	fcvtds	d7, s14	@ tmp750, MEM[base: D.7912_648, offset: 4294967288B]
	fcvtds	d5, s4	@ tmp747, D.7487
	fnmacd	d7, d5, d6	@ tmp750, tmp747, tmp893
	fmuls	s6, s16, s6	@ D.7500, D.7509, D.7505
	fcvtsd	s14, d7	@ tmp751, tmp750
	fmuls	s7, s0, s7	@ D.7488, D.7497, D.7493
	fsts	s14, [r3, #0]	@ tmp751, MEM[base: D.7908_644, offset: 0B]
	fmacs	s6, s1, s2	@ D.7500, D.7506, D.7508
	fmacs	s7, s3, s5	@ D.7488, D.7494, D.7496
	flds	s14, [r9, #-4]	@ MEM[base: D.7912_648, offset: 4294967292B], MEM[base: D.7912_648, offset: 4294967292B]
	fadds	s5, s7, s6	@ D.7486, D.7488, D.7500
	fcvtds	d7, s14	@ tmp757, MEM[base: D.7912_648, offset: 4294967292B]
	fcvtds	d5, s5	@ tmp754, D.7486
	fnmacd	d7, d5, d6	@ tmp757, tmp754, tmp893
	fcvtsd	s14, d7	@ tmp758, tmp757
	fsts	s14, [r3, #4]	@ tmp758, MEM[base: D.7908_644, offset: 4B]
	flds	s14, [r9, #-8]	@ MEM[base: D.7912_648, offset: 4294967288B], MEM[base: D.7912_648, offset: 4294967288B]
	flds	s15, [r9, #-4]	@ MEM[base: D.7912_648, offset: 4294967292B], MEM[base: D.7912_648, offset: 4294967292B]
	fadds	s4, s14, s4	@ tmp761, MEM[base: D.7912_648, offset: 4294967288B], D.7487
	fadds	s5, s15, s5	@ tmp763, MEM[base: D.7912_648, offset: 4294967292B], D.7486
	fsts	s4, [r9, #-8]	@ tmp761, MEM[base: D.7912_648, offset: 4294967288B]
	fsts	s5, [r9, #-4]	@ tmp763, MEM[base: D.7912_648, offset: 4294967292B]
	fsubs	s14, s6, s7	@ tmp760, D.7500, D.7488
	flds	s11, [r3, #0]	@ MEM[base: D.7908_644, offset: 0B], MEM[base: D.7908_644, offset: 0B]
	fmuls	s14, s14, s17	@ D.7467, tmp760, pretmp.114
	fadds	s11, s14, s11	@ tmp765, D.7467, MEM[base: D.7908_644, offset: 0B]
	fsubs	s15, s8, s9	@ tmp759, D.7503, D.7491
	fsts	s11, [r2, #0]	@ tmp765, MEM[base: D.7910_646, offset: 0B]
	fmuls	s15, s15, s17	@ D.7468, tmp759, pretmp.114
	flds	s11, [r3, #4]	@ MEM[base: D.7908_644, offset: 4B], MEM[base: D.7908_644, offset: 4B]
	fsubs	s11, s11, s15	@ tmp767, MEM[base: D.7908_644, offset: 4B], D.7468
	fsts	s11, [r2, #4]	@ tmp767, MEM[base: D.7910_646, offset: 4B]
	flds	s10, [r3, #0]	@ MEM[base: D.7908_644, offset: 0B], MEM[base: D.7908_644, offset: 0B]
	flds	s11, [r3, #4]	@ MEM[base: D.7908_644, offset: 4B], MEM[base: D.7908_644, offset: 4B]
	fsubs	s14, s10, s14	@ tmp769, MEM[base: D.7908_644, offset: 0B], D.7467
	fadds	s15, s11, s15	@ tmp771, MEM[base: D.7908_644, offset: 4B], D.7468
	subs	ip, ip, #1	@ m, m,
	fsts	s14, [r3, #0]	@ tmp769, MEM[base: D.7908_644, offset: 0B]
	fsts	s15, [r3, #4]	@ tmp771, MEM[base: D.7908_644, offset: 4B]
	add	r4, r4, sl	@ tw2, tw2, pretmp.110
	add	r1, r1, r0	@ tw2, tw2, pretmp.113
	add	r9, r9, #8	@ ivtmp.181, ivtmp.181,
	add	r2, r2, #8	@ ivtmp.189, ivtmp.189,
	add	r3, r3, #8	@ ivtmp.186, ivtmp.186,
@ SUCC: 15 [86.0%]  (dfs_back,can_fallthru) 16 [14.0%]  (fallthru)
	bne	.L14	@,
@ BLOCK 16 freq:9 seq:14
@ PRED: 15 [14.0%]  (fallthru)
@ SUCC: 10 [100.0%] 
	b	.L1	@
@ BLOCK 17 freq:9 seq:15
@ PRED: 6 [20.0%] 
.L5:
	ldr	r5, [sp, #16]	@, %sfp
	add	r4, r4, #264	@ tw1, st,
	add	r3, r9, r5, asl #3	@, tmp717, Fout,,
	add	r3, r3, #8	@ ivtmp.163, tmp717,
	add	r9, r9, #8	@ ivtmp.164, Fout,
@ SUCC: 18 [100.0%]  (fallthru,can_fallthru)
	mov	r2, r5	@ m,
@ BLOCK 18 freq:98 seq:16
@ PRED: 17 [100.0%]  (fallthru,can_fallthru) 18 [91.0%]  (dfs_back,can_fallthru)
.L12:
	flds	s12, [r3, #-4]	@ D.7448, MEM[base: D.7874_375, offset: 4294967292B]
	flds	s15, [r4, #4]	@ D.7447, tw1_59->i
	flds	s13, [r4, #0]	@ D.7450, tw1_59->r
	flds	s11, [r3, #-8]	@ D.7451, MEM[base: D.7874_375, offset: 4294967288B]
	fmuls	s14, s12, s15	@ D.7445, D.7448, D.7447
	flds	s10, [r9, #-8]	@ MEM[base: D.7876_370, offset: 4294967288B], MEM[base: D.7876_370, offset: 4294967288B]
	fmscs	s14, s11, s13	@ D.7445, D.7451, D.7450
	fsubs	s10, s10, s14	@ tmp722, MEM[base: D.7876_370, offset: 4294967288B], D.7445
	fmuls	s15, s11, s15	@ D.7442, D.7451, D.7447
	fsts	s10, [r3, #-8]	@ tmp722, MEM[base: D.7874_375, offset: 4294967288B]
	fmacs	s15, s12, s13	@ D.7442, D.7448, D.7450
	flds	s13, [r9, #-4]	@ MEM[base: D.7876_370, offset: 4294967292B], MEM[base: D.7876_370, offset: 4294967292B]
	fsubs	s13, s13, s15	@ tmp724, MEM[base: D.7876_370, offset: 4294967292B], D.7442
	fsts	s13, [r3, #-4]	@ tmp724, MEM[base: D.7874_375, offset: 4294967292B]
	flds	s12, [r9, #-8]	@ MEM[base: D.7876_370, offset: 4294967288B], MEM[base: D.7876_370, offset: 4294967288B]
	flds	s13, [r9, #-4]	@ MEM[base: D.7876_370, offset: 4294967292B], MEM[base: D.7876_370, offset: 4294967292B]
	fadds	s14, s12, s14	@ tmp726, MEM[base: D.7876_370, offset: 4294967288B], D.7445
	fadds	s15, s13, s15	@ tmp728, MEM[base: D.7876_370, offset: 4294967292B], D.7442
	subs	r2, r2, #1	@ m, m,
	fsts	s14, [r9, #-8]	@ tmp726, MEM[base: D.7876_370, offset: 4294967288B]
	fsts	s15, [r9, #-4]	@ tmp728, MEM[base: D.7876_370, offset: 4294967292B]
	add	r4, r4, sl	@ tw1, tw1, pretmp.110
	add	r3, r3, #8	@ ivtmp.163, ivtmp.163,
	add	r9, r9, #8	@ ivtmp.164, ivtmp.164,
@ SUCC: 18 [91.0%]  (dfs_back,can_fallthru) 19 [9.0%]  (fallthru)
	bne	.L12	@,
@ BLOCK 19 freq:9 seq:17
@ PRED: 18 [9.0%]  (fallthru)
@ SUCC: 10 [100.0%] 
	b	.L1	@
@ BLOCK 20 freq:9 seq:18
@ PRED: 6 [20.0%] 
.L4:
	mov	r2, r5, asl #3	@, p,
	mov	r0, r2	@,
	str	r2, [sp, #32]	@, %sfp
	ldr	r6, [r4, #0]	@ Norig, st_26(D)->nfft
	bl	malloc	@
	ldr	r7, [sp, #16]	@, %sfp
	mov	r8, r0	@ scratch,
	cmp	r7, #0	@,
@ SUCC: 21 [91.0%]  (fallthru,can_fallthru) 32 [9.0%]  (can_fallthru)
	ble	.L23	@,
@ BLOCK 21 freq:8 seq:19
@ PRED: 20 [91.0%]  (fallthru,can_fallthru)
	mov	fp, r7	@,
	ldr	r7, [sp, #24]	@, %sfp
	ldr	r3, [sp, #32]	@, %sfp
	mul	r7, fp, r7	@,,
	mov	r2, #0	@,
	str	r7, [sp, #36]	@, %sfp
	str	r2, [sp, #12]	@, %sfp
	str	r2, [sp, #20]	@, %sfp
	mov	fp, fp, asl #3	@ D.7823,,
@ SUCC: 22 [100.0%]  (fallthru,can_fallthru)
	add	r7, r0, r3	@ D.7810, scratch,
@ BLOCK 22 freq:89 seq:20
@ PRED: 21 [100.0%]  (fallthru,can_fallthru) 31 [91.0%]  (dfs_back,can_fallthru)
.L32:
	cmp	r5, #0	@ p,
@ SUCC: 23 [91.0%]  (fallthru,can_fallthru) 31 [9.0%]  (can_fallthru)
	ble	.L27	@,
@ BLOCK 23 freq:81 seq:21
@ PRED: 22 [91.0%]  (fallthru,can_fallthru)
	mov	r3, #0	@ ivtmp.150,
	ldr	sl, [sp, #32]	@ D.7742, %sfp
@ SUCC: 24 [100.0%]  (fallthru,can_fallthru)
	mov	r2, r3	@ ivtmp.148, ivtmp.150
@ BLOCK 24 freq:900 seq:22
@ PRED: 23 [100.0%]  (fallthru,can_fallthru) 24 [91.0%]  (dfs_back,can_fallthru)
.L24:
	add	ip, r8, r3	@ tmp876, scratch, ivtmp.150
	add	r3, r3, #8	@ ivtmp.150, ivtmp.150,
	add	r1, r9, r2	@ tmp877, ivtmp.136, ivtmp.148
	cmp	r3, sl	@ ivtmp.150, D.7742
	ldmia	r1, {r0, r1}	@ tmp877,,
	add	r2, r2, fp	@ ivtmp.148, ivtmp.148, D.7823
	stmia	ip, {r0, r1}	@ tmp876,,
@ SUCC: 24 [91.0%]  (dfs_back,can_fallthru) 25 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L24	@,
@ BLOCK 25 freq:81 seq:23
@ PRED: 24 [9.0%]  (fallthru,can_fallthru,loop_exit)
	mov	r2, r9	@ ivtmp.136, ivtmp.136
	str	r9, [sp, #28]	@ ivtmp.136, %sfp
	ldr	ip, [sp, #12]	@ ivtmp.138, %sfp
	ldr	r9, [sp, #36]	@ D.7828, %sfp
@ SUCC: 26 [100.0%]  (fallthru,can_fallthru)
	mov	sl, #0	@ q1,
@ BLOCK 26 freq:900 seq:24
@ PRED: 25 [100.0%]  (fallthru,can_fallthru) 29 [91.0%]  (dfs_back,can_fallthru)
.L26:
	cmp	r5, #1	@ p,
	ldmia	r8, {r0, r1}	@ scratch,,
	stmia	r2, {r0, r1}	@ ivtmp.136,,
@ SUCC: 27 [91.0%]  (fallthru,can_fallthru) 29 [9.0%]  (can_fallthru)
	beq	.L31	@,
@ BLOCK 27 freq:819 seq:25
@ PRED: 26 [91.0%]  (fallthru,can_fallthru)
	flds	s12, [r2, #0]	@ prephitmp.103, MEM[base: D.7830_207, offset: 0B]
	flds	s13, [r2, #4]	@ prephitmp.103, MEM[base: D.7830_207, offset: 4B]
	add	r3, r8, #8	@ ivtmp.126, scratch,
@ SUCC: 28 [100.0%]  (fallthru,can_fallthru)
	mov	r1, #0	@ twidx,
@ BLOCK 28 freq:9100 seq:26
@ PRED: 28 [91.0%]  (dfs_back,can_fallthru) 27 [100.0%]  (fallthru,can_fallthru)
.L30:
	add	r1, ip, r1	@ D.7733, ivtmp.138, twidx
	rsb	r0, r6, r1	@ twidx, Norig, D.7733
	cmp	r6, r1	@ Norig, D.7733
	movle	r1, r0	@ twidx, twidx
	add	r0, r1, #33	@ tmp881, twidx,
	add	r0, r4, r0, asl #3	@, D.7728, st, tmp881,
	flds	s14, [r0, #4]	@ D.7724, D.7728_394->i
	flds	s9, [r3, #4]	@ D.7725, MEM[base: D.7805_24, offset: 4B]
	flds	s10, [r3, #0]	@ D.7729, MEM[base: D.7805_24, offset: 0B]
	flds	s11, [r0, #0]	@ D.7727, D.7728_394->r
	fmuls	s15, s9, s14	@ tmp885, D.7725, D.7724
	fmuls	s14, s10, s14	@ tmp888, D.7729, D.7724
	fmscs	s15, s10, s11	@ tmp885, D.7729, D.7727
	fmacs	s14, s9, s11	@ tmp888, D.7725, D.7727
	fadds	s12, s12, s15	@ prephitmp.103, prephitmp.103, tmp885
	fadds	s13, s13, s14	@ prephitmp.103, prephitmp.103, tmp888
	add	r3, r3, #8	@ ivtmp.126, ivtmp.126,
	cmp	r3, r7	@ ivtmp.126, D.7810
	fsts	s13, [r2, #4]	@ prephitmp.103, MEM[base: D.7830_207, offset: 4B]
	fsts	s12, [r2, #0]	@ prephitmp.103, MEM[base: D.7830_207, offset: 0B]
@ SUCC: 28 [91.0%]  (dfs_back,can_fallthru) 29 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L30	@,
@ BLOCK 29 freq:900 seq:27
@ PRED: 26 [9.0%]  (can_fallthru) 28 [9.0%]  (fallthru,can_fallthru,loop_exit)
.L31:
	add	sl, sl, #1	@ q1, q1,
	cmp	sl, r5	@ q1, p
	add	r2, r2, fp	@ ivtmp.136, ivtmp.136, D.7823
	add	ip, ip, r9	@ ivtmp.138, ivtmp.138, D.7828
@ SUCC: 26 [91.0%]  (dfs_back,can_fallthru) 30 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L26	@,
@ BLOCK 30 freq:81 seq:28
@ PRED: 29 [9.0%]  (fallthru,can_fallthru,loop_exit)
@ SUCC: 31 [100.0%]  (fallthru,can_fallthru)
	ldr	r9, [sp, #28]	@ ivtmp.136, %sfp
@ BLOCK 31 freq:89 seq:29
@ PRED: 30 [100.0%]  (fallthru,can_fallthru) 22 [9.0%]  (can_fallthru)
.L27:
	ldr	r2, [sp, #20]	@, %sfp
	ldr	r3, [sp, #16]	@, %sfp
	add	r2, r2, #1	@,,
	cmp	r2, r3	@,
	str	r2, [sp, #20]	@, %sfp
	ldr	r3, [sp, #24]	@, %sfp
	ldr	r2, [sp, #12]	@, %sfp
	add	r9, r9, #8	@ ivtmp.136, ivtmp.136,
	add	r2, r2, r3	@,,
	str	r2, [sp, #12]	@, %sfp
@ SUCC: 22 [91.0%]  (dfs_back,can_fallthru) 32 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L32	@,
@ BLOCK 32 freq:9 seq:30
@ PRED: 20 [9.0%]  (can_fallthru) 31 [9.0%]  (fallthru,can_fallthru,loop_exit)
.L23:
	mov	r0, r8	@, scratch
	add	sp, sp, #52	@,,
	fldmfdd	sp!, {d8, d9, d10, d11}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
@ SUCC: EXIT [100.0%]  (ab,sibcall)
	b	free	@
@ BLOCK 33 freq:12 seq:31
@ PRED: 2 [28.0%]  (can_fallthru)
.L45:
	mov	sl, r2, asl #3	@ pretmp.110, fstride,
	mul	r8, sl, r8	@ pretmp.122, pretmp.110, in_stride
@ SUCC: 34 [100.0%]  (fallthru,can_fallthru)
	mov	r3, r0	@ Fout, Fout
@ BLOCK 34 freq:88 seq:32
@ PRED: 33 [100.0%]  (fallthru,can_fallthru) 34 [86.0%]  (dfs_back,can_fallthru)
.L3:
	ldmia	r6, {r0, r1}	@ f,,
	stmia	r3, {r0, r1}	@ Fout,,
	add	r3, r3, #8	@ Fout, Fout,
	cmp	r3, r7	@ Fout, Fout_end
	add	r6, r6, r8	@ f, f, pretmp.122
@ SUCC: 34 [86.0%]  (dfs_back,can_fallthru) 35 [14.0%]  (fallthru)
	bne	.L3	@,
@ BLOCK 35 freq:12 seq:33
@ PRED: 34 [14.0%]  (fallthru)
@ SUCC: 6 [100.0%] 
	b	.L11	@
.L47:
	.align	3
.L46:
	.word	0
	.word	1071644672
	.size	kf_work, .-kf_work
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.align	2
	.global	kiss_fft_alloc
	.type	kiss_fft_alloc, %function
kiss_fft_alloc:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
@ BLOCK 2 freq:501 seq:0
@ PRED: ENTRY [100.0%]  (fallthru)
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}	@,
	fstmfdd	sp!, {d8, d9, d10}	@,
	mov	r5, r0	@ nfft, nfft
	cmp	r3, #0	@ lenmem
	add	r0, r0, #33	@ tmp185, nfft,
	sub	sp, sp, #28	@,,
	mov	r7, r2	@ mem, mem
	mov	r0, r0, asl #3	@ memneeded, tmp185,
@ SUCC: 23 [6.7%]  (can_fallthru) 3 [93.3%]  (fallthru,can_fallthru)
	beq	.L78	@,
@ BLOCK 3 freq:468 seq:1
@ PRED: 2 [93.3%]  (fallthru,can_fallthru)
	cmp	r2, #0	@ mem,
@ SUCC: 4 [85.0%]  (fallthru,can_fallthru) 5 [15.0%]  (can_fallthru)
	beq	.L51	@,
@ BLOCK 4 freq:397 seq:2
@ PRED: 3 [85.0%]  (fallthru,can_fallthru)
	ldr	r2, [r3, #0]	@ *lenmem_10(D), *lenmem_10(D)
	cmp	r0, r2	@ memneeded, *lenmem_10(D)
@ SUCC: 5 [100.0%]  (fallthru,can_fallthru)
	movhi	r7, #0	@ mem,
@ BLOCK 5 freq:468 seq:3
@ PRED: 3 [15.0%]  (can_fallthru) 4 [100.0%]  (fallthru,can_fallthru)
.L51:
@ SUCC: 6 [100.0%]  (fallthru,can_fallthru)
	str	r0, [r3, #0]	@ memneeded, *lenmem_10(D)
@ BLOCK 6 freq:501 seq:4
@ PRED: 5 [100.0%]  (fallthru,can_fallthru) 23 [100.0%] 
.L50:
	cmp	r7, #0	@ mem,
@ SUCC: 7 [89.9%]  (fallthru,can_fallthru) 14 [10.1%]  (can_fallthru)
	beq	.L76	@,
@ BLOCK 7 freq:451 seq:5
@ PRED: 6 [89.9%]  (fallthru,can_fallthru)
	cmp	r5, #0	@ nfft,
	str	r5, [r7, #0]	@ nfft, MEM[(struct kiss_fft_state *)mem_2].nfft
	str	r1, [r7, #4]	@ inverse_fft, MEM[(struct kiss_fft_state *)mem_2].inverse
@ SUCC: 8 [91.0%]  (fallthru,can_fallthru) 22 [9.0%]  (can_fallthru)
	ble	.L79	@,
@ BLOCK 8 freq:410 seq:6
@ PRED: 7 [91.0%]  (fallthru,can_fallthru)
	fmsr	s13, r5	@ int	@, nfft
	fldd	d9, .L80	@ tmp189,
	fsitod	d8, s13	@ prephitmp.276,
	fldd	d7, .L80+8	@ tmp222,
	fdivd	d9, d9, d8	@ reciptmp.282, tmp189, prephitmp.276
	cmp	r1, #0	@ inverse_fft,
	fmuld	d9, d9, d7	@ tmp223, reciptmp.282, tmp222
@ SUCC: 9 [50.0%]  (fallthru,can_fallthru) 15 [50.0%]  (can_fallthru)
	bne	.L55	@,
@ BLOCK 9 freq:205 seq:7
@ PRED: 8 [50.0%]  (fallthru,can_fallthru)
	mov	r6, r1	@ i, inverse_fft
	add	r4, r7, #264	@ ivtmp.285, mem,
	add	sl, sp, #16	@ tmp217,,
@ SUCC: 10 [100.0%]  (fallthru,can_fallthru)
	add	r8, sp, #8	@ tmp216,,
@ BLOCK 10 freq:2278 seq:8
@ PRED: 9 [100.0%]  (fallthru,can_fallthru) 10 [91.0%]  (dfs_back,can_fallthru)
.L56:
	fmsr	s14, r6	@ int	@, i
	fsitod	d0, s14	@ tmp194,
	mov	r0, sl	@, tmp217
	fmuld	d0, d9, d0	@, tmp223, tmp194
	mov	r1, r8	@, tmp216
	bl	sincos	@
	fldd	d6, [sp, #8]	@,
	fcvtsd	s14, d6	@ tmp196,
	fldd	d6, [sp, #16]	@,
	fcvtsd	s15, d6	@ tmp197,
	add	r6, r6, #1	@ i, i,
	cmp	r6, r5	@ i, nfft
	fsts	s14, [r4, #0]	@ tmp196, MEM[base: D.8106_96, offset: 0B]
	fsts	s15, [r4, #4]	@ tmp197, MEM[base: D.8106_96, offset: 4B]
	add	r4, r4, #8	@ ivtmp.285, ivtmp.285,
@ SUCC: 10 [91.0%]  (dfs_back,can_fallthru) 11 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bne	.L56	@,
@ BLOCK 11 freq:451 seq:9
@ PRED: 10 [9.0%]  (fallthru,can_fallthru,loop_exit) 17 [100.0%]  22 [100.0%] 
.L54:
	fsqrtd	d0, d8	@, prephitmp.276
	bl	trunc	@
	fcpyd	d8, d0	@ floor_sqrt,
	add	r6, r7, #8	@ facbuf, mem,
@ SUCC: 12 [100.0%]  (fallthru,can_fallthru)
	mov	r4, #4	@ nfft,
@ BLOCK 12 freq:10000 seq:10
@ PRED: 13 [91.0%]  (dfs_back,can_fallthru) 11 [100.0%]  (fallthru,can_fallthru) 20 [100.0%] 
.L75:
	mov	r0, r5	@, nfft
	mov	r1, r4	@, nfft
	bl	__aeabi_idivmod	@
	cmp	r1, #0	@,
	mov	r0, r5	@, nfft
	mov	r1, r4	@, nfft
@ SUCC: 18 [50.0%]  (can_fallthru) 13 [50.0%]  (fallthru,can_fallthru)
	bne	.L64	@,
@ BLOCK 13 freq:5000 seq:11
@ PRED: 12 [50.0%]  (fallthru,can_fallthru)
	bl	__aeabi_idiv	@
	mov	r5, r0	@ nfft,
	cmp	r0, #1	@ nfft,
	stmia	r6, {r4, r5}	@ facbuf,,
	add	r6, r6, #8	@ facbuf, facbuf,
@ SUCC: 12 [91.0%]  (dfs_back,can_fallthru) 14 [9.0%]  (fallthru,can_fallthru,loop_exit)
	bgt	.L75	@,
@ BLOCK 14 freq:1002 seq:12
@ PRED: 13 [9.0%]  (fallthru,can_fallthru,loop_exit) 6 [10.1%]  (can_fallthru)
.L76:
	mov	r0, r7	@, mem
@ SUCC: EXIT [100.0%] 
	add	sp, sp, #28	@,,
	fldmfdd	sp!, {d8, d9, d10}
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
@ BLOCK 15 freq:205 seq:13
@ PRED: 8 [50.0%]  (can_fallthru)
.L55:
	add	r6, r7, #264	@ ivtmp.291, mem,
	mov	r4, #0	@ i,
	add	sl, sp, #16	@ tmp217,,
@ SUCC: 16 [100.0%]  (fallthru,can_fallthru)
	add	r8, sp, #8	@ tmp216,,
@ BLOCK 16 freq:2278 seq:14
@ PRED: 16 [91.0%]  (dfs_back,can_fallthru) 15 [100.0%]  (fallthru,can_fallthru)
.L58:
	fmsr	s13, r4	@ int	@, i
	fsitod	d0, s13	@ tmp200,
	mov	r0, sl	@, tmp217
	fnmuld	d0, d0, d9	@, tmp200, tmp225
	mov	r1, r8	@, tmp216
	bl	sincos	@
	fldd	d6, [sp, #8]	@,
	fcvtsd	s14, d6	@ tmp204,
	fldd	d6, [sp, #16]	@,
	fcvtsd	s15, d6	@ tmp205,
	add	r4, r4, #1	@ i, i,
	cmp	r4, r5	@ i, nfft
	fsts	s14, [r6, #0]	@ tmp204, MEM[base: D.8115_101, offset: 0B]
	fsts	s15, [r6, #4]	@ tmp205, MEM[base: D.8115_101, offset: 4B]
	add	r6, r6, #8	@ ivtmp.291, ivtmp.291,
@ SUCC: 16 [91.0%]  (dfs_back,can_fallthru) 17 [9.0%]  (fallthru)
	bne	.L58	@,
@ BLOCK 17 freq:205 seq:15
@ PRED: 16 [9.0%]  (fallthru)
@ SUCC: 11 [100.0%] 
	b	.L54	@
@ BLOCK 18 freq:5000 seq:16
@ PRED: 12 [50.0%]  (can_fallthru)
.L64:
	cmp	r4, #2	@ nfft,
@ SUCC: 21 [29.0%]  (can_fallthru) 19 [71.0%]  (fallthru,can_fallthru)
	beq	.L66	@,
@ BLOCK 19 freq:3550 seq:17
@ PRED: 18 [71.0%]  (fallthru,can_fallthru)
	cmp	r4, #4	@ nfft,
	addne	r4, r4, #2	@ nfft, nfft,
	fmsrne	s13, r4	@ int	@, nfft
	flddeq	d7, .L80+16	@ prephitmp.276,
	fsitodne	d7, s13	@ prephitmp.276,
@ SUCC: 20 [100.0%]  (fallthru,can_fallthru)
	moveq	r4, #2	@ nfft,
@ BLOCK 20 freq:4999 seq:18
@ PRED: 19 [100.0%]  (fallthru,can_fallthru) 21 [100.0%] 
.L61:
	fcmpd	d8, d7	@ floor_sqrt, prephitmp.276
	fmstat
	movmi	r4, r5	@, nfft, nfft
@ SUCC: 12 [100.0%] 
	b	.L75	@
@ BLOCK 21 freq:1667 seq:19
@ PRED: 18 [29.0%]  (can_fallthru)
.L66:
	fldd	d7, .L80+24	@ prephitmp.276,
	mov	r4, #3	@ nfft,
@ SUCC: 20 [100.0%] 
	b	.L61	@
@ BLOCK 22 freq:41 seq:20
@ PRED: 7 [9.0%]  (can_fallthru)
.L79:
	fmsr	s12, r5	@ int	@, nfft
	fsitod	d8, s12	@ prephitmp.276,
@ SUCC: 11 [100.0%] 
	b	.L54	@
@ BLOCK 23 freq:34 seq:21
@ PRED: 2 [6.7%]  (can_fallthru)
.L78:
	str	r1, [sp, #4]	@,
	bl	malloc	@
	ldr	r1, [sp, #4]	@,
	mov	r7, r0	@ mem,
@ SUCC: 6 [100.0%] 
	b	.L50	@
.L81:
	.align	3
.L80:
	.word	0
	.word	1072693248
	.word	1413754136
	.word	-1072094725
	.word	0
	.word	1073741824
	.word	0
	.word	1074266112
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.align	2
	.global	kiss_fft_stride
	.type	kiss_fft_stride, %function
kiss_fft_stride:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ BLOCK 2 freq:10000 seq:0
@ PRED: ENTRY [100.0%]  (fallthru)
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}	@,
	cmp	r1, r2	@ fin, fout
	sub	sp, sp, #8	@,,
	mov	r5, r1	@ fin, fin
	mov	r4, r0	@ st, st
	mov	r6, r3	@ in_stride, in_stride
@ SUCC: 4 [10.1%]  (can_fallthru) 3 [89.9%]  (fallthru,can_fallthru)
	beq	.L84	@,
@ BLOCK 3 freq:8986 seq:1
@ PRED: 2 [89.9%]  (fallthru,can_fallthru)
	add	r0, r0, #8	@ tmp157, st,
	stmia	sp, {r0, r4}	@,,
	mov	r0, r2	@, fout
	mov	r2, #1	@,
	bl	kf_work	@
@ SUCC: EXIT [100.0%] 
	add	sp, sp, #8	@,,
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
@ BLOCK 4 freq:1014 seq:2
@ PRED: 2 [10.1%]  (can_fallthru)
.L84:
	mov	r7, r0	@ tmp150, st
	ldr	r0, [r7], #8	@ st_3(D)->nfft, st_3(D)->nfft
	mov	r0, r0, asl #3	@, st_3(D)->nfft,
	bl	malloc	@
	mov	r3, r6	@, in_stride
	mov	r1, r5	@, fin
	str	r7, [sp, #0]	@ tmp150,
	str	r4, [sp, #4]	@ st,
	mov	r2, #1	@,
	mov	r8, r0	@ tmp149,
	bl	kf_work	@
	ldr	r2, [r4, #0]	@ st_3(D)->nfft, st_3(D)->nfft
	mov	r0, r5	@, fin
	mov	r2, r2, asl #3	@, st_3(D)->nfft,
	mov	r1, r8	@, tmp149
	bl	memcpy	@
	mov	r0, r8	@, tmp149
	add	sp, sp, #8	@,,
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
@ SUCC: EXIT [100.0%]  (ab,sibcall)
	b	free	@
	.size	kiss_fft_stride, .-kiss_fft_stride
	.align	2
	.global	kiss_fft
	.type	kiss_fft, %function
kiss_fft:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ BLOCK 2 freq:10000 seq:0
@ PRED: ENTRY [100.0%]  (fallthru)
	stmfd	sp!, {r4, r5, r6, r7, lr}	@,
	cmp	r1, r2	@ fin, fout
	sub	sp, sp, #12	@,,
	mov	r3, r2	@ fout, fout
	mov	r5, r1	@ fin, fin
	mov	r4, r0	@ cfg, cfg
@ SUCC: 4 [10.1%]  (can_fallthru) 3 [89.9%]  (fallthru,can_fallthru)
	beq	.L87	@,
@ BLOCK 3 freq:8986 seq:1
@ PRED: 2 [89.9%]  (fallthru,can_fallthru)
	add	r0, r0, #8	@ tmp156, cfg,
	mov	r2, #1	@,
	stmia	sp, {r0, r4}	@,,
	mov	r0, r3	@, fout
	mov	r3, r2	@,
	bl	kf_work	@
@ SUCC: EXIT [100.0%] 
	add	sp, sp, #12	@,,
	ldmfd	sp!, {r4, r5, r6, r7, pc}
@ BLOCK 4 freq:1014 seq:2
@ PRED: 2 [10.1%]  (can_fallthru)
.L87:
	mov	r6, r0	@ tmp149, cfg
	ldr	r0, [r6], #8	@ cfg_1(D)->nfft, cfg_1(D)->nfft
	mov	r0, r0, asl #3	@, cfg_1(D)->nfft,
	bl	malloc	@
	mov	r2, #1	@,
	mov	r3, r2	@,
	mov	r1, r5	@, fin
	str	r6, [sp, #0]	@ tmp149,
	str	r4, [sp, #4]	@ cfg,
	mov	r7, r0	@ tmp148,
	bl	kf_work	@
	ldr	r2, [r4, #0]	@ cfg_1(D)->nfft, cfg_1(D)->nfft
	mov	r0, r5	@, fin
	mov	r2, r2, asl #3	@, cfg_1(D)->nfft,
	mov	r1, r7	@, tmp148
	bl	memcpy	@
	mov	r0, r7	@, tmp148
	add	sp, sp, #12	@,,
	ldmfd	sp!, {r4, r5, r6, r7, lr}
@ SUCC: EXIT [100.0%]  (ab,sibcall)
	b	free	@
	.size	kiss_fft, .-kiss_fft
	.align	2
	.global	kiss_fft_cleanup
	.type	kiss_fft_cleanup, %function
kiss_fft_cleanup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ BLOCK 2 freq:10000 seq:0
@ PRED: ENTRY [100.0%]  (fallthru)
@ SUCC: EXIT [100.0%] 
	bx	lr	@
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.align	2
	.global	kiss_fft_next_fast_size
	.type	kiss_fft_next_fast_size, %function
kiss_fft_next_fast_size:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ BLOCK 2 freq:81 seq:0
@ PRED: ENTRY [100.0%]  (fallthru)
	stmfd	sp!, {r4, r5}	@,
	ldr	ip, .L114	@ tmp209,
@ SUCC: 3 [100.0%]  (fallthru,can_fallthru)
	ldr	r4, .L114+4	@ tmp208,
@ BLOCK 3 freq:900 seq:1
@ PRED: 2 [100.0%]  (fallthru,can_fallthru) 11 [100.0%] 
.L97:
	tst	r0, #1	@ n,
	mov	r3, r0	@ n, n
@ SUCC: 4 [91.0%]  (fallthru,can_fallthru) 7 [9.0%]  (can_fallthru)
	bne	.L90	@,
@ BLOCK 4 freq:9100 seq:2
@ PRED: 3 [91.0%]  (fallthru,can_fallthru) 4 [91.0%]  (dfs_back,can_fallthru)
.L91:
	add	r3, r3, r3, lsr #31	@, tmp158, n, n,
	mov	r3, r3, asr #1	@ n, tmp158,
	tst	r3, #1	@ n,
@ SUCC: 4 [91.0%]  (dfs_back,can_fallthru) 5 [9.0%]  (fallthru)
	beq	.L91	@,
@ BLOCK 5 freq:819 seq:3
@ PRED: 4 [9.0%]  (fallthru)
@ SUCC: 7 [100.0%] 
	b	.L90	@
@ BLOCK 6 freq:9100 seq:4
@ PRED: 7 [91.0%]  (can_fallthru)
.L113:
	smull	r5, r3, r4, r3	@, tmp170, tmp208, n
@ SUCC: 7 [100.0%]  (fallthru,dfs_back,can_fallthru)
	rsb	r3, r2, r3	@ n, tmp205, tmp170
@ BLOCK 7 freq:10000 seq:5
@ PRED: 3 [9.0%]  (can_fallthru) 6 [100.0%]  (fallthru,dfs_back,can_fallthru) 5 [100.0%] 
.L90:
	smull	r2, r1, r4, r3	@, tmp162, tmp208, n
	mov	r2, r3, asr #31	@ tmp205, n,
	rsb	r1, r2, r1	@ tmp161, tmp205, tmp162
	add	r1, r1, r1, asl #1	@, tmp167, tmp161, tmp161,
	cmp	r3, r1	@ n, tmp167
@ SUCC: 6 [91.0%]  (can_fallthru) 8 [9.0%]  (fallthru,can_fallthru,loop_exit)
	beq	.L113	@,
@ BLOCK 8 freq:900 seq:6
@ PRED: 7 [9.0%]  (fallthru,can_fallthru,loop_exit)
	smull	r5, r1, ip, r3	@, tmp182, tmp209, n
	rsb	r1, r2, r1, asr #1	@, tmp181, tmp205, tmp182,
	add	r1, r1, r1, asl #2	@, tmp188, tmp181, tmp181,
	cmp	r3, r1	@ n, tmp188
@ SUCC: 9 [91.0%]  (fallthru,can_fallthru) 10 [9.0%]  (can_fallthru)
	bne	.L94	@,
@ BLOCK 9 freq:9100 seq:7
@ PRED: 8 [91.0%]  (fallthru,can_fallthru) 9 [91.0%]  (dfs_back,can_fallthru)
.L105:
	smull	r1, r3, ip, r3	@, tmp191, tmp209, n
	rsb	r3, r2, r3, asr #1	@, n, tmp205, tmp191,
	smull	r2, r1, ip, r3	@, tmp196, tmp209, n
	mov	r2, r3, asr #31	@ tmp205, n,
	rsb	r1, r2, r1, asr #1	@, tmp195, tmp205, tmp196,
	add	r1, r1, r1, asl #2	@, tmp202, tmp195, tmp195,
	cmp	r3, r1	@ n, tmp202
@ SUCC: 9 [91.0%]  (dfs_back,can_fallthru) 10 [9.0%]  (fallthru,can_fallthru,loop_exit)
	beq	.L105	@,
@ BLOCK 10 freq:900 seq:8
@ PRED: 9 [9.0%]  (fallthru,can_fallthru,loop_exit) 8 [9.0%]  (can_fallthru)
.L94:
	cmp	r3, #1	@ n,
@ SUCC: 12 [9.0%]  (can_fallthru,loop_exit) 11 [91.0%]  (fallthru,can_fallthru)
@ BLOCK 11 freq:819 seq:9
@ PRED: 10 [91.0%]  (fallthru,can_fallthru)
	addgt	r0, r0, #1	@ n, n,
@ SUCC: 3 [100.0%] 
	bgt	.L97	@
@ BLOCK 12 freq:81 seq:10
@ PRED: 10 [9.0%]  (can_fallthru,loop_exit)
.L96:
@ SUCC: EXIT [100.0%] 
	ldmfd	sp!, {r4, r5}
	bx	lr
.L115:
	.align	2
.L114:
	.word	1717986919
	.word	1431655766
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.ident	"GCC: (crosstool-NG 1.18.0) 4.7.3 20130102 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
