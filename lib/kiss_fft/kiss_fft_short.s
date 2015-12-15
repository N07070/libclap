	.file	"kiss_fft.c"
# GNU C (Debian 4.9.2-10) version 4.9.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.9.2, GMP version 6.0.0, MPFR version 3.1.2-p3, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D FIXED_POINT kiss_fft.c
# -mtune=generic -march=x86-64 -auxbase-strip kiss_fft_short.s -O3 -O3
# -fPIC -ffast-math -fomit-frame-pointer -fverbose-asm
# options enabled:  -fPIC -faggressive-loop-optimizations
# -fassociative-math -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments -fcommon
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fcx-limited-range -fdefer-pop -fdelete-null-pointer-checks
# -fdevirtualize -fdevirtualize-speculatively -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
# -fipa-pure-const -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2
# -fpredictive-commoning -fprefetch-loop-arrays -freciprocal-math -free
# -freg-struct-return -freorder-blocks -freorder-blocks-and-partition
# -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
# -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
# -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-distribute-patterns
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
# -funit-at-a-time -funsafe-math-optimizations -funswitch-loops
# -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mlong-double-80 -mmmx
# -mno-sse4 -mpush-args -mred-zone -msse -msse2 -mtls-direct-seg-refs
# -mvzeroupper

	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	kf_bfly_generic, @function
kf_bfly_generic:
.LFB49:
	.cfi_startproc
# BLOCK 2 freq:9 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r15d	# p, p
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12	# Fout, Fout
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%r8d, %rdi	# p,
	movl	%ecx, %r13d	# m, m
	salq	$2, %rdi	#, D.5594
	movq	%rsi, %rbx	# fstride, fstride
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
	leaq	264(%rdx), %r14	#, twiddles
	movl	(%rdx), %ebp	# st_13(D)->nfft, Norig
	movl	%r8d, 4(%rsp)	# p, %sfp
	call	malloc@PLT	#
	testl	%r13d, %r13d	# m
	movq	%rax, %rsi	#, scratch
	movq	%rax, 8(%rsp)	# scratch, %sfp
# SUCC: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	jle	.L2	#,
# BLOCK 3 freq:8 seq:1
# PRED: 2 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%r13), %eax	#, D.5596
	movq	%r12, 32(%rsp)	# ivtmp.109, %sfp
	movl	%ebx, 44(%rsp)	# fstride, %sfp
	movl	$0, 40(%rsp)	#, %sfp
	leaq	4(,%rax,4), %rax	#, D.5596
	addq	%r12, %rax	# ivtmp.109, D.5603
	movq	%rax, 48(%rsp)	# D.5603, %sfp
	movslq	%r13d, %rax	# m, D.5594
	salq	$2, %rax	#, D.5594
	movq	%rax, 16(%rsp)	# D.5594, %sfp
	movl	%r15d, %eax	# p, p
	subl	$1, %eax	#, D.5596
	leaq	4(,%rax,4), %rax	#, D.5596
	imull	%ebx, %r13d	# fstride, D.5595
	addq	%rsi, %rax	# scratch, D.5603
	movq	%rax, 56(%rsp)	# D.5603, %sfp
	movl	%r15d, %eax	# p, p
	subl	$2, %eax	#, D.5596
	movl	%r13d, 28(%rsp)	# D.5595, %sfp
	leaq	8(,%rax,4), %rax	#, D.5596
	leaq	(%rsi,%rax), %r15	#, D.5603
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 4 freq:89 seq:2
# PRED: 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L3:
	movl	4(%rsp), %ebx	# %sfp, p
	testl	%ebx, %ebx	# p
# SUCC: 5 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L7	#,
# BLOCK 5 freq:81 seq:3
# PRED: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$32767, %eax	#, tmp262
	movq	8(%rsp), %rsi	# %sfp, ivtmp.103
	movq	32(%rsp), %rdi	# %sfp, ivtmp.101
	cltd
	movq	16(%rsp), %r8	# %sfp, D.5594
	movq	56(%rsp), %r9	# %sfp, D.5603
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	idivl	%ebx	# p
# BLOCK 6 freq:900 seq:4
# PRED: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rdi), %edx	# MEM[base: _34, offset: 0B], MEM[base: _34, offset: 0B]
	addq	$4, %rsi	#, ivtmp.103
	addq	%r8, %rdi	# D.5594, ivtmp.101
	movswl	%dx, %ecx	# MEM[base: _34, offset: 0B], D.5598
	sarl	$16, %edx	#, D.5598
	imull	%eax, %ecx	# tmp262, D.5598
	imull	%eax, %edx	# tmp262, D.5598
	addl	$16384, %ecx	#, D.5598
	addl	$16384, %edx	#, D.5598
	sarl	$15, %ecx	#, D.5598
	sarl	$15, %edx	#, D.5598
	movw	%cx, -4(%rsi)	# D.5598, MEM[base: _213, offset: 0B]
	movw	%dx, -2(%rsi)	# D.5598, MEM[base: _213, offset: 2B]
	cmpq	%r9, %rsi	# D.5603, ivtmp.103
# SUCC: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 7 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L4	#,
# BLOCK 7 freq:81 seq:5
# PRED: 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movq	8(%rsp), %rax	# %sfp, scratch
	movl	40(%rsp), %r13d	# %sfp, ivtmp.92
	movq	32(%rsp), %rbx	# %sfp, ivtmp.90
	movl	$0, (%rsp)	#, %sfp
	movl	(%rax), %eax	# *scratch_21, *scratch_21
# SUCC: 8 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, 24(%rsp)	# *scratch_21, %sfp
# BLOCK 8 freq:900 seq:6
# PRED: 7 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L6:
	cmpl	$1, 4(%rsp)	#, %sfp
	movl	24(%rsp), %eax	# %sfp, *scratch_21
	movl	%eax, (%rbx)	# *scratch_21, MEM[base: _218, offset: 0B]
# SUCC: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [9.0%]  (CAN_FALLTHRU)
	je	.L9	#,
# BLOCK 9 freq:819 seq:7
# PRED: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	8(%rsp), %rax	# %sfp, scratch
	movzwl	(%rbx), %r11d	# MEM[base: _218, offset: 0B], D.5597
	movzwl	2(%rbx), %r10d	# MEM[base: _218, offset: 2B], D.5597
	leaq	4(%rax), %r9	#, ivtmp.79
# SUCC: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%eax, %eax	# twidx
# BLOCK 10 freq:9100 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L8:
	addl	%r13d, %eax	# ivtmp.92, D.5595
	movswl	(%r9), %r8d	# MEM[base: _240, offset: 0B], D.5598
	movswl	2(%r9), %ecx	# MEM[base: _240, offset: 2B], D.5598
	movl	%eax, %edx	# D.5595, twidx
	subl	%ebp, %edx	# Norig, twidx
	cmpl	%eax, %ebp	# D.5595, Norig
	cmovle	%edx, %eax	# twidx,, twidx
	addq	$4, %r9	#, ivtmp.79
	movslq	%eax, %rdx	# twidx, D.5594
	movl	%ecx, %r12d	# D.5598, D.5598
	leaq	(%r14,%rdx,4), %rdx	#, D.5600
	movswl	(%rdx), %edi	# _69->r, D.5598
	movswl	2(%rdx), %esi	# _69->i, D.5598
	movl	%r8d, %edx	# D.5598, D.5598
	imull	%esi, %r12d	# D.5598, D.5598
	imull	%edi, %edx	# D.5598, D.5598
	imull	%r8d, %esi	# D.5598, D.5598
	subl	%r12d, %edx	# D.5598, D.5598
	imull	%edi, %ecx	# D.5598, D.5598
	addl	$16384, %edx	#, D.5598
	sarl	$15, %edx	#, D.5598
	addl	%edx, %r11d	# D.5598, D.5597
	leal	16384(%rsi,%rcx), %edx	#, D.5598
	movw	%r11w, (%rbx)	# D.5597, MEM[base: _218, offset: 0B]
	sarl	$15, %edx	#, D.5598
	addl	%edx, %r10d	# D.5598, D.5597
	cmpq	%r15, %r9	# D.5603, ivtmp.79
	movw	%r10w, 2(%rbx)	# D.5597, MEM[base: _218, offset: 2B]
# SUCC: 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L8	#,
# BLOCK 11 freq:900 seq:9
# PRED: 8 [9.0%]  (CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
.L9:
	addl	$1, (%rsp)	#, %sfp
	addq	16(%rsp), %rbx	# %sfp, ivtmp.90
	movl	(%rsp), %eax	# %sfp, q1
	addl	28(%rsp), %r13d	# %sfp, ivtmp.92
	cmpl	4(%rsp), %eax	# %sfp, q1
# SUCC: 8 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L6	#,
# BLOCK 12 freq:89 seq:10
# PRED: 4 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
.L7:
	addq	$4, 32(%rsp)	#, %sfp
	movl	44(%rsp), %edi	# %sfp, D.5595
	movq	32(%rsp), %rax	# %sfp, ivtmp.109
	addl	%edi, 40(%rsp)	# D.5595, %sfp
	cmpq	48(%rsp), %rax	# %sfp, ivtmp.109
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L3	#,
# BLOCK 13 freq:9 seq:11
# PRED: 2 [9.0%]  (CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L2:
	movq	8(%rsp), %rdi	# %sfp,
	addq	$72, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free@PLT	#
	.cfi_endproc
.LFE49:
	.size	kf_bfly_generic, .-kf_bfly_generic
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	kf_work, @function
kf_work:
.LFB50:
	.cfi_startproc
# BLOCK 2 freq:1250 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r15	# f, f
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13	# Fout, Fout
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%ecx, %rbp	# in_stride,
	movq	%r9, %rbx	# st, st
	subq	$152, %rsp	#,
	.cfi_def_cfa_offset 208
	movl	(%r8), %eax	# *factors_11(D), p
	movl	4(%r8), %edi	# MEM[(int *)factors_11(D) + 4B], m
	movq	%rdx, 32(%rsp)	# fstride, %sfp
	movl	%eax, %edx	# p, D.5761
	movl	%eax, 24(%rsp)	# p, %sfp
	movl	%edi, 48(%rsp)	# m, %sfp
	imull	%edi, %edx	# m, D.5761
	cmpl	$1, %edi	#, m
	movslq	%edx, %rdx	# D.5761, D.5762
	leaq	0(%r13,%rdx,4), %r12	#, Fout_end
# SUCC: 22 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L41	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	32(%rsp), %rdi	# %sfp, fstride
	movslq	%ebp, %r14	# in_stride, D.5762
	movslq	48(%rsp), %rdx	# %sfp, D.5762
	movq	%r13, 56(%rsp)	# Fout, %sfp
	movq	%rdi, %rax	# fstride, fstride
	salq	$2, %rax	#, D.5762
	imulq	%rax, %r14	# D.5762, D.5762
	movq	%rax, 40(%rsp)	# D.5762, %sfp
	movslq	24(%rsp), %rax	# %sfp, D.5762
	imulq	%rdi, %rax	# fstride, D.5762
	movq	%r14, (%rsp)	# D.5762, %sfp
	movl	%ebp, %edi	# in_stride, in_stride
	movq	%r13, %r14	# Fout, Fout
	movq	%rsi, %r13	# f, f
	movq	%r14, %rbp	# Fout, Fout
	movl	%edi, %r14d	# in_stride, in_stride
	movq	%rax, 8(%rsp)	# D.5762, %sfp
	leaq	0(,%rdx,4), %rax	#, D.5762
	movq	%rax, 16(%rsp)	# D.5762, %sfp
	leaq	8(%r8), %rax	#, factors
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	8(%rsp), %rdx	# %sfp,
	movq	%r13, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r15, %r8	# factors,
	movl	%r14d, %ecx	# in_stride,
	call	kf_work	#
	addq	16(%rsp), %rbp	# %sfp, Fout
	addq	(%rsp), %r13	# %sfp, f
	cmpq	%r12, %rbp	# Fout_end, Fout
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L19	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 24(%rsp)	#, %sfp
	movq	56(%rsp), %r13	# %sfp, Fout
# SUCC: 25 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L21	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [80.0%]  (CAN_FALLTHRU)
.L44:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L42	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	24(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L24	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L20	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	48(%rsp), %r14d	# %sfp, m
	leaq	264(%rbx), %rax	#, twiddles
	movq	32(%rsp), %rdx	# %sfp, D.5762
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 120(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m,
	imulq	%rax, %rdx	# D.5762, D.5762
	salq	$2, %rax	#, D.5762
	leaq	0(%r13,%rax), %r8	#, Fout1
	movq	%r8, 8(%rsp)	# Fout1, %sfp
	addq	%rax, %r8	# D.5762, Fout2
	salq	$2, %rdx	#, D.5762
	movq	%r8, 16(%rsp)	# Fout2, %sfp
	addq	%rax, %r8	# D.5762, Fout3
	leaq	(%rbx,%rdx), %rsi	#, D.5768
	addq	%r8, %rax	# Fout3, Fout4
	movq	%rax, 24(%rsp)	# Fout4, %sfp
	addq	%rsi, %rdx	# D.5768, D.5768
	testl	%r14d, %r14d	# m
	movswl	(%rsi), %edi	# MEM[(struct kiss_fft_cpx *)_455],
	movzwl	2(%rsi), %ecx	# MEM[(struct kiss_fft_cpx *)_455 + 2B], ya$i
	movzwl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_459], yb$r
	movzwl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_459 + 2B], yb$i
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L15	#,
# BLOCK 10 freq:228 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%edi, 64(%rsp)	# D.5761, %sfp
	movswl	%si, %edi	# yb$r, D.5761
	movq	16(%rsp), %rsi	# %sfp, Fout2
	movl	%edi, 68(%rsp)	# D.5761, %sfp
	movswl	%cx, %edi	# ya$i, D.5761
	movq	%rbx, 48(%rsp)	# twiddles, %sfp
	movl	%edi, 72(%rsp)	# D.5761, %sfp
	movswl	%dx, %edi	# yb$i, D.5761
	movq	$0, 56(%rsp)	#, %sfp
	movl	%edi, 80(%rsp)	# D.5761, %sfp
	movq	40(%rsp), %rdi	# %sfp, D.5762
	movq	%r13, (%rsp)	# Fout, %sfp
	leaq	(%rdi,%rdi,2), %rdi	#, tmp990
	movq	%rdi, 136(%rsp)	# tmp990, %sfp
	movl	%r14d, %edi	# m, D.5763
	movq	%r8, %r14	# Fout3, Fout3
	subl	$1, %edi	#, D.5763
	leaq	4(,%rdi,4), %rax	#, D.5763
	addq	%r8, %rax	# Fout3, D.5768
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, 128(%rsp)	# D.5768, %sfp
# BLOCK 11 freq:2528 seq:9
# PRED: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L33:
	movq	(%rsp), %r15	# %sfp, Fout
	movq	8(%rsp), %rdi	# %sfp, Fout1
	movq	24(%rsp), %rbx	# %sfp, Fout4
	movq	120(%rsp), %r11	# %sfp, twiddles
	movswl	(%r15), %eax	# MEM[base: Fout_864, offset: 0B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, (%r15)	# D.5761, MEM[base: Fout_864, offset: 0B]
	movswl	2(%r15), %eax	# MEM[base: Fout_864, offset: 2B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%r15)	# D.5761, MEM[base: Fout_864, offset: 2B]
	movswl	(%rdi), %eax	# MEM[base: Fout1_863, offset: 0B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, (%rdi)	# D.5761, MEM[base: Fout1_863, offset: 0B]
	movswl	2(%rdi), %eax	# MEM[base: Fout1_863, offset: 2B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%rdi)	# D.5761, MEM[base: Fout1_863, offset: 2B]
	movswl	(%rsi), %eax	# MEM[base: Fout2_862, offset: 0B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, (%rsi)	# D.5761, MEM[base: Fout2_862, offset: 0B]
	movswl	2(%rsi), %eax	# MEM[base: Fout2_862, offset: 2B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%rsi)	# D.5761, MEM[base: Fout2_862, offset: 2B]
	movswl	(%r14), %eax	# MEM[base: Fout3_861, offset: 0B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, (%r14)	# D.5761, MEM[base: Fout3_861, offset: 0B]
	movswl	2(%r14), %eax	# MEM[base: Fout3_861, offset: 2B], D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%r14)	# D.5761, MEM[base: Fout3_861, offset: 2B]
	movswl	(%rbx), %edx	# MEM[base: Fout4_866, offset: 0B], D.5761
	movswl	2(%rbx), %eax	# MEM[base: Fout4_866, offset: 2B], D.5761
	imull	$6553, %edx, %edx	#, D.5761, D.5761
	imull	$6553, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %edx	#, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %edx	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%dx, (%rbx)	# D.5761, MEM[base: Fout4_866, offset: 0B]
	movw	%ax, 2(%rbx)	# D.5761, MEM[base: Fout4_866, offset: 2B]
	movzwl	2(%r15), %ecx	# MEM[base: Fout_864, offset: 2B], scratch$0$i
	movswl	(%rsi), %r12d	# MEM[base: Fout2_862, offset: 0B], D.5761
	movswl	(%rdi), %r8d	# MEM[base: Fout1_863, offset: 0B], D.5761
	movswl	2(%rdi), %ebx	# MEM[base: Fout1_863, offset: 2B], D.5761
	movw	%cx, 32(%rsp)	# scratch$0$i, %sfp
	movq	56(%rsp), %rcx	# %sfp, ivtmp.198
	movl	%r8d, %r15d	# D.5761, D.5761
	movswl	(%r11,%rcx,2), %r10d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 2, offset: 0B], D.5761
	movswl	(%r11,%rcx), %r13d	# MEM[base: twiddles_46, index: ivtmp.198_320, offset: 0B], D.5761
	movswl	2(%r11,%rcx), %ebp	# MEM[base: twiddles_46, index: ivtmp.198_320, offset: 2B], D.5761
	movl	%r10d, 108(%rsp)	# D.5761, %sfp
	movswl	(%r14), %r10d	# MEM[base: Fout3_861, offset: 0B], D.5761
	movswl	2(%r11,%rcx,2), %r9d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 2, offset: 2B], D.5761
	movl	%r15d, 104(%rsp)	# D.5761, %sfp
	movswl	2(%rsi), %r8d	# MEM[base: Fout2_862, offset: 2B], D.5761
	movswl	2(%r14), %esi	# MEM[base: Fout3_861, offset: 2B], D.5761
	movl	%r10d, 96(%rsp)	# D.5761, %sfp
	movq	48(%rsp), %r10	# %sfp, ivtmp.203
	movswl	(%r10), %edi	# MEM[base: _939, offset: 0B], D.5761
	movl	%edi, 88(%rsp)	# D.5761, %sfp
	movswl	2(%r10), %edi	# MEM[base: _939, offset: 2B], D.5761
	movswl	(%r11,%rcx,4), %r10d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 4, offset: 0B], D.5761
	movswl	2(%r11,%rcx,4), %r11d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 4, offset: 2B], D.5761
	movl	%r15d, %ecx	# D.5761, D.5761
	movl	%ebx, %r15d	# D.5761, D.5761
	imull	%ebp, %r15d	# D.5761, D.5761
	imull	%r13d, %ecx	# D.5761, D.5761
	subl	%r15d, %ecx	# D.5761, D.5761
	movl	%edx, %r15d	# D.5761, D.5761
	addl	$16384, %ecx	#, D.5761
	imull	104(%rsp), %ebp	# %sfp, D.5761
	imull	%r10d, %r15d	# D.5761, D.5761
	sarl	$15, %ecx	#, D.5761
	imull	%r13d, %ebx	# D.5761, D.5761
	movl	%ecx, 100(%rsp)	# D.5761, %sfp
	movl	%r15d, %ecx	# D.5761, D.5761
	movl	%eax, %r15d	# D.5761, D.5761
	imull	%r11d, %r15d	# D.5761, D.5761
	leal	16384(%rbp,%rbx), %ebx	#, D.5761
	imull	%r11d, %edx	# D.5761, D.5761
	movl	%ebx, %ebp	# D.5761, D.5761
	subl	%r15d, %ecx	# D.5761, D.5761
	imull	%r10d, %eax	# D.5761, D.5761
	sarl	$15, %ebp	#, D.5761
	addl	$16384, %ecx	#, D.5761
	movl	%ebp, 116(%rsp)	# D.5761, %sfp
	sarl	$15, %ecx	#, D.5761
	movl	%ecx, %r15d	# D.5761, D.5764
	addw	100(%rsp), %r15w	# %sfp, D.5764
	movl	%ecx, 112(%rsp)	# D.5761, %sfp
	leal	16384(%rdx,%rax), %ebx	#, D.5761
	movl	%ebp, %eax	# D.5761, tmp1356
	movl	108(%rsp), %ebp	# %sfp, D.5761
	sarl	$15, %ebx	#, D.5761
	movl	%ebp, %r11d	# D.5761, D.5761
	movl	%r15d, %ecx	# D.5764, D.5764
	movl	%r8d, %r15d	# D.5761, D.5761
	imull	%r12d, %r11d	# D.5761, D.5761
	addl	%ebx, %eax	# D.5761, D.5764
	imull	%r9d, %r15d	# D.5761, D.5761
	movl	%r11d, %edx	# D.5761, D.5761
	movl	96(%rsp), %r11d	# %sfp, D.5761
	imull	88(%rsp), %r11d	# %sfp, D.5761
	subl	%r15d, %edx	# D.5761, D.5761
	movl	%esi, %r15d	# D.5761, D.5761
	imull	%edi, %r15d	# D.5761, D.5761
	addl	$16384, %edx	#, D.5761
	movl	%edx, %r13d	# D.5761, D.5761
	sarl	$15, %r13d	#, D.5761
	movl	%r13d, 104(%rsp)	# D.5761, %sfp
	movl	%r11d, %edx	# D.5761, D.5761
	movl	68(%rsp), %r11d	# %sfp, D.5761
	subl	%r15d, %edx	# D.5761, D.5761
	addl	$16384, %edx	#, D.5761
	movl	%edx, %r15d	# D.5761, D.5761
	sarl	$15, %r15d	#, D.5761
	movl	%r15d, %r13d	# D.5761, D.5761
	movzwl	104(%rsp), %r15d	# %sfp, tmp1364
	imull	96(%rsp), %edi	# %sfp, D.5761
	imull	88(%rsp), %esi	# %sfp, D.5761
	imull	%r12d, %r9d	# D.5761, D.5761
	leal	0(%r13,%r15), %r10d	#, D.5764
	movq	(%rsp), %r15	# %sfp, Fout
	imull	%ebp, %r8d	# D.5761, D.5761
	movzwl	(%r15), %ebp	# MEM[base: Fout_864, offset: 0B], D.5764
	leal	16384(%rdi,%rsi), %edi	#, D.5761
	leal	16384(%r9,%r8), %edx	#, D.5761
	movzwl	32(%rsp), %r9d	# %sfp, scratch$0$i
	sarl	$15, %edi	#, D.5761
	sarl	$15, %edx	#, D.5761
	leal	(%r10,%rbp), %esi	#, D.5764
	leal	(%rdi,%rdx), %r8d	#, D.5764
	addl	%ecx, %esi	# D.5764, tmp1074
	movw	%si, (%r15)	# tmp1074, MEM[base: Fout_864, offset: 0B]
	leal	(%r8,%r9), %esi	#, D.5764
	movswl	%cx, %r9d	# D.5764, D.5761
	movswl	%r8w, %r8d	# D.5764, D.5761
	addl	%eax, %esi	# D.5764, tmp1076
	movw	%si, 2(%r15)	# tmp1076, MEM[base: Fout_864, offset: 2B]
	movl	%r9d, %esi	# D.5761, D.5761
	movswl	%r10w, %r9d	# D.5764, D.5761
	movl	%r11d, %r10d	# D.5761, D.5761
	movl	64(%rsp), %r15d	# %sfp, D.5761
	movl	%esi, 96(%rsp)	# D.5761, %sfp
	imull	%r9d, %r10d	# D.5761, D.5761
	subl	%edi, %edx	# D.5761, D.5764
	movswl	%dx, %edi	# D.5764, D.5761
	movl	%r10d, %r12d	# D.5761, D.5761
	movl	%r11d, %r10d	# D.5761, D.5761
	movl	%r15d, %r11d	# D.5761, D.5761
	addl	$16384, %r12d	#, D.5761
	sarl	$15, %r12d	#, D.5761
	imull	%r8d, %r10d	# D.5761, D.5761
	leal	0(%rbp,%r12), %ecx	#, D.5764
	movl	%esi, %r12d	# D.5761, D.5761
	movswl	%ax, %esi	# D.5764, D.5761
	movzwl	32(%rsp), %eax	# %sfp, scratch$0$i
	imull	%esi, %r11d	# D.5761, D.5761
	addl	$16384, %r10d	#, D.5761
	imull	%r15d, %r12d	# D.5761, D.5761
	movzwl	116(%rsp), %r15d	# %sfp, D.5764
	sarl	$15, %r10d	#, D.5761
	addl	%r10d, %eax	# D.5761, D.5764
	movl	72(%rsp), %edx	# %sfp, D.5761
	movl	%edi, 88(%rsp)	# D.5761, %sfp
	movl	%r11d, %r10d	# D.5761, D.5761
	addl	$16384, %r10d	#, D.5761
	addl	$16384, %r12d	#, D.5761
	subl	%ebx, %r15d	# D.5761, D.5764
	sarl	$15, %r10d	#, D.5761
	sarl	$15, %r12d	#, D.5761
	addl	%eax, %r10d	# D.5764, D.5764
	movswl	%r15w, %ebx	# D.5764,
	movl	%edx, %eax	# D.5761, D.5761
	imull	%ebx, %eax	# D.5761, D.5761
	addl	%ecx, %r12d	# D.5764, D.5764
	movl	%eax, %r11d	# D.5761, D.5761
	movl	80(%rsp), %eax	# %sfp, D.5761
	addl	$16384, %r11d	#, D.5761
	movl	%r11d, %r15d	# D.5761, D.5761
	imull	%edi, %eax	# D.5761, D.5761
	sarl	$15, %r15d	#, D.5761
	movl	%r15d, %ecx	# D.5761, D.5761
	movl	%eax, %r11d	# D.5761, D.5761
	addl	$16384, %r11d	#, D.5761
	movl	%r11d, %r15d	# D.5761, D.5761
	sarl	$15, %r15d	#, D.5761
	leal	(%rcx,%r15), %r11d	#, D.5764
	movzwl	100(%rsp), %r15d	# %sfp, D.5764
	subw	112(%rsp), %r15w	# %sfp, D.5764
	movswl	%r15w, %eax	# D.5764,
	movzwl	104(%rsp), %r15d	# %sfp, D.5764
	subl	%r13d, %r15d	# D.5761, D.5764
	movl	%edx, %r13d	# D.5761, D.5761
	movl	88(%rsp), %edx	# %sfp, D.5761
	imull	%eax, %r13d	# D.5761, D.5761
	movswl	%r15w, %edi	# D.5764,
	movl	%r13d, %ecx	# D.5761, D.5761
	addl	$16384, %ecx	#, D.5761
	movl	%ecx, %r15d	# D.5761, D.5761
	movl	80(%rsp), %ecx	# %sfp, D.5761
	sarl	$15, %r15d	#, D.5761
	imull	%edi, %ecx	# D.5761, D.5761
	addl	$16384, %ecx	#, D.5761
	sarl	$15, %ecx	#, D.5761
	addl	%r15d, %ecx	# D.5761, D.5764
	movl	%r12d, %r15d	# D.5764, tmp1107
	subl	%r11d, %r15d	# D.5764, tmp1107
	addl	%r12d, %r11d	# D.5764, tmp1109
	movq	24(%rsp), %r12	# %sfp, Fout4
	movl	%r15d, %r13d	# tmp1107, tmp1107
	movq	8(%rsp), %r15	# %sfp, Fout1
	movw	%r13w, (%r15)	# tmp1107, MEM[base: Fout1_863, offset: 0B]
	leal	(%r10,%rcx), %r13d	#, tmp1108
	subl	%ecx, %r10d	# D.5764, tmp1110
	movw	%r13w, 2(%r15)	# tmp1108, MEM[base: Fout1_863, offset: 2B]
	movw	%r11w, (%r12)	# tmp1109, MEM[base: Fout4_866, offset: 0B]
	movl	64(%rsp), %r11d	# %sfp, D.5761
	movw	%r10w, 2(%r12)	# tmp1110, MEM[base: Fout4_866, offset: 2B]
	movl	68(%rsp), %r10d	# %sfp, D.5761
	movl	72(%rsp), %r13d	# %sfp, D.5761
	imull	%r11d, %r9d	# D.5761, D.5761
	imull	%r11d, %r8d	# D.5761, D.5761
	addl	$16384, %r9d	#, D.5761
	sarl	$15, %r9d	#, D.5761
	addl	$16384, %r8d	#, D.5761
	addl	%r9d, %ebp	# D.5761, D.5764
	movl	96(%rsp), %r9d	# %sfp, D.5761
	sarl	$15, %r8d	#, D.5761
	imull	%r10d, %esi	# D.5761, D.5761
	addw	32(%rsp), %r8w	# %sfp, D.5764
	imull	%r13d, %edx	# D.5761, D.5761
	addl	$16384, %esi	#, D.5761
	imull	%r10d, %r9d	# D.5761, D.5761
	addl	$16384, %edx	#, D.5761
	sarl	$15, %esi	#, D.5761
	imull	%r13d, %edi	# D.5761, D.5761
	sarl	$15, %edx	#, D.5761
	addl	%esi, %r8d	# D.5761, D.5764
	movq	16(%rsp), %rsi	# %sfp, Fout2
	movl	%r9d, %ecx	# D.5761, D.5761
	movl	80(%rsp), %r9d	# %sfp, D.5761
	addl	$16384, %ecx	#, D.5761
	addl	$16384, %edi	#, D.5761
	sarl	$15, %ecx	#, D.5761
	sarl	$15, %edi	#, D.5761
	imull	%r9d, %ebx	# D.5761, D.5761
	addl	%ecx, %ebp	# D.5761, D.5764
	imull	%r9d, %eax	# D.5761, D.5761
	addl	$16384, %ebx	#, D.5761
	sarl	$15, %ebx	#, D.5761
	addl	$16384, %eax	#, D.5761
	subl	%ebx, %edx	# D.5761, D.5764
	sarl	$15, %eax	#, D.5761
	leal	0(%rbp,%rdx), %ecx	#, tmp1137
	subl	%edi, %eax	# D.5761, D.5764
	subl	%edx, %ebp	# D.5764, tmp1139
	movq	%r15, %rdx	# Fout1, Fout1
	movw	%cx, (%rsi)	# tmp1137, MEM[base: Fout2_862, offset: 0B]
	leal	(%r8,%rax), %ecx	#, tmp1138
	subl	%eax, %r8d	# D.5764, tmp1140
	addq	$4, %rdx	#, Fout1
	addq	$4, %rsi	#, Fout2
	addq	$4, %r12	#, Fout4
	movw	%cx, -2(%rsi)	# tmp1138, MEM[base: Fout2_862, offset: 2B]
	addq	$4, (%rsp)	#, %sfp
	addq	$4, %r14	#, Fout3
	movw	%bp, -4(%r14)	# tmp1139, MEM[base: Fout3_861, offset: 0B]
	movw	%r8w, -2(%r14)	# tmp1140, MEM[base: Fout3_861, offset: 2B]
	movq	40(%rsp), %rax	# %sfp, D.5762
	movq	%rdx, 8(%rsp)	# Fout1, %sfp
	movq	%rsi, 16(%rsp)	# Fout2, %sfp
	movq	%r12, 24(%rsp)	# Fout4, %sfp
	addq	%rax, 56(%rsp)	# D.5762, %sfp
	movq	136(%rsp), %rax	# %sfp, tmp990
	addq	%rax, 48(%rsp)	# tmp990, %sfp
	cmpq	128(%rsp), %r14	# %sfp, Fout3
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L33	#,
# BLOCK 12 freq:1000 seq:10
# PRED: 21 [100.0%]  (CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU) 15 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 27 [100.0%]  (CAN_FALLTHRU)
.L15:
	addq	$152, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 13 freq:250 seq:11
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	movslq	48(%rsp), %rax	# %sfp, k
	movq	%rax, %rsi	# k, k
	movq	%rax, 72(%rsp)	# k, %sfp
	leaq	264(%rbx), %rax	#, tw3
	movq	%rax, %rdi	# tw3, tw3
	movq	%rsi, %rax	# k, k
	movq	32(%rsp), %rsi	# %sfp, fstride
	salq	$2, %rax	#, D.5762
	movq	%rdi, (%rsp)	# tw3, %sfp
	leaq	0(%r13,%rax), %r11	#, ivtmp.169
	leaq	(%rsi,%rsi,2), %rdx	#, tmp899
	leaq	0(,%rsi,8), %rcx	#, D.5762
	leaq	(%r11,%rax), %rbp	#, ivtmp.171
	leaq	0(,%rdx,4), %rsi	#, tmp900
	movq	%rcx, 80(%rsp)	# D.5762, %sfp
	leaq	0(%rbp,%rax), %r8	#, ivtmp.173
	movq	%rsi, 88(%rsp)	# tmp900, %sfp
	movl	4(%rbx), %esi	# st_33(D)->inverse, D.5761
	movl	%esi, 96(%rsp)	# D.5761, %sfp
	movq	%rdi, %rsi	# tw3, tw3
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L32	#
# BLOCK 14 freq:1389 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L43:
	movzwl	68(%rsp), %edx	# %sfp, D.5764
	subl	%r9d, %eax	# D.5764, tmp979
	movw	%ax, (%r11)	# tmp979, MEM[base: _154, offset: 0B]
	movl	%edx, %eax	# D.5764, D.5764
	addl	%r12d, %eax	# D.5764, tmp980
	movw	%ax, 2(%r11)	# tmp980, MEM[base: _154, offset: 2B]
	movl	%ebx, %eax	# D.5764, D.5764
	addl	%eax, %r9d	# D.5764, tmp981
	movl	%edx, %eax	# D.5764, tmp982
	subl	%r12d, %eax	# D.5764, tmp982
	movw	%r9w, (%r8)	# tmp981, MEM[base: _960, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%ax, 2(%r8)	# tmp982, MEM[base: _960, offset: 2B]
# BLOCK 15 freq:2778 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%]  (CAN_FALLTHRU)
.L31:
	addq	$4, %r13	#, Fout
	addq	$4, %r11	#, ivtmp.169
	addq	$4, %rbp	#, ivtmp.171
	addq	$4, %r8	#, ivtmp.173
	subq	$1, 72(%rsp)	#, %sfp
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	je	.L15	#,
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%]  (CAN_FALLTHRU)
.L32:
	movswl	0(%r13), %edx	# MEM[base: Fout_278, offset: 0B], D.5761
	movl	%edx, %eax	# D.5761, tmp903
	sall	$13, %eax	#, tmp903
	subl	%edx, %eax	# D.5761, D.5761
	movswl	2(%r13), %edx	# MEM[base: Fout_278, offset: 2B], D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 0(%r13)	# D.5761, MEM[base: Fout_278, offset: 0B]
	movl	%edx, %eax	# D.5761, tmp909
	sall	$13, %eax	#, tmp909
	subl	%edx, %eax	# D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%r13)	# D.5761, MEM[base: Fout_278, offset: 2B]
	movswl	(%r11), %edx	# MEM[base: _154, offset: 0B], D.5761
	movl	%edx, %eax	# D.5761, tmp915
	sall	$13, %eax	#, tmp915
	subl	%edx, %eax	# D.5761, D.5761
	movswl	2(%r11), %edx	# MEM[base: _154, offset: 2B], D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, (%r11)	# D.5761, MEM[base: _154, offset: 0B]
	movl	%edx, %eax	# D.5761, tmp921
	sall	$13, %eax	#, tmp921
	subl	%edx, %eax	# D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%r11)	# D.5761, MEM[base: _154, offset: 2B]
	movswl	0(%rbp), %edx	# MEM[base: _981, offset: 0B], D.5761
	movl	%edx, %eax	# D.5761, tmp927
	sall	$13, %eax	#, tmp927
	subl	%edx, %eax	# D.5761, D.5761
	movswl	2(%rbp), %edx	# MEM[base: _981, offset: 2B], D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 0(%rbp)	# D.5761, MEM[base: _981, offset: 0B]
	movl	%edx, %eax	# D.5761, tmp933
	sall	$13, %eax	#, tmp933
	subl	%edx, %eax	# D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%rbp)	# D.5761, MEM[base: _981, offset: 2B]
	movswl	(%r8), %eax	# MEM[base: _960, offset: 0B], D.5761
	movl	%eax, %ecx	# D.5761, tmp939
	sall	$13, %ecx	#, tmp939
	subl	%eax, %ecx	# D.5761, D.5761
	movswl	2(%r8), %eax	# MEM[base: _960, offset: 2B], D.5761
	addl	$16384, %ecx	#, D.5761
	sarl	$15, %ecx	#, D.5761
	movw	%cx, (%r8)	# D.5761, MEM[base: _960, offset: 0B]
	movl	%eax, %edx	# D.5761, tmp944
	sall	$13, %edx	#, tmp944
	subl	%eax, %edx	# D.5761, D.5761
	addl	$16384, %edx	#, D.5761
	sarl	$15, %edx	#, D.5761
	movw	%dx, 2(%r8)	# D.5761, MEM[base: _960, offset: 2B]
	movswl	(%rsi), %ebx	# MEM[base: tw3_335, offset: 0B], D.5761
	movswl	(%r11), %eax	# MEM[base: _154, offset: 0B], D.5761
	movswl	2(%r11), %r15d	# MEM[base: _154, offset: 2B], D.5761
	movswl	0(%rbp), %r14d	# MEM[base: _981, offset: 0B], D.5761
	movswl	2(%rbp), %r10d	# MEM[base: _981, offset: 2B], D.5761
	movswl	(%rdi), %r12d	# MEM[base: tw3_356, offset: 0B], D.5761
	movl	%ebx, 16(%rsp)	# D.5761, %sfp
	movswl	2(%rsi), %ebx	# MEM[base: tw3_335, offset: 2B], D.5761
	movl	%eax, 8(%rsp)	# D.5761, %sfp
	movq	(%rsp), %rax	# %sfp, tw3
	movl	%r15d, 24(%rsp)	# D.5761, %sfp
	movl	%r10d, %r9d	# D.5761, D.5761
	movswl	(%rax), %r15d	# MEM[base: tw3_376, offset: 0B], D.5761
	movswl	2(%rax), %eax	# MEM[base: tw3_376, offset: 2B], D.5761
	movl	%ebx, 32(%rsp)	# D.5761, %sfp
	movswl	2(%rdi), %ebx	# MEM[base: tw3_356, offset: 2B], D.5761
	movl	%eax, 48(%rsp)	# D.5761, %sfp
	movl	%r14d, %eax	# D.5761, D.5761
	imull	%r12d, %eax	# D.5761, D.5761
	imull	%ebx, %r9d	# D.5761, D.5761
	subl	%r9d, %eax	# D.5761, D.5761
	movzwl	0(%r13), %r9d	# MEM[base: Fout_278, offset: 0B], D.5764
	addl	$16384, %eax	#, D.5761
	imull	%r14d, %ebx	# D.5761, D.5761
	sarl	$15, %eax	#, D.5761
	imull	%r12d, %r10d	# D.5761, D.5761
	subl	%eax, %r9d	# D.5761, D.5764
	movw	%r9w, 64(%rsp)	# D.5764, %sfp
	movzwl	2(%r13), %r9d	# MEM[base: Fout_278, offset: 2B], D.5764
	leal	16384(%rbx,%r10), %r10d	#, D.5761
	movl	8(%rsp), %r12d	# %sfp, D.5761
	movl	48(%rsp), %r14d	# %sfp, D.5761
	imull	16(%rsp), %r12d	# %sfp, D.5761
	sarl	$15, %r10d	#, D.5761
	movl	%r15d, %ebx	# D.5761, D.5761
	movl	%r15d, 56(%rsp)	# D.5761, %sfp
	subl	%r10d, %r9d	# D.5761, D.5764
	movl	24(%rsp), %r15d	# %sfp, D.5761
	addw	0(%r13), %ax	# MEM[base: Fout_278, offset: 0B], D.5764
	movw	%r9w, 68(%rsp)	# D.5764, %sfp
	movl	24(%rsp), %r9d	# %sfp, D.5761
	imull	32(%rsp), %r9d	# %sfp, D.5761
	imull	%edx, %r14d	# D.5761, D.5761
	addw	2(%r13), %r10w	# MEM[base: Fout_278, offset: 2B], D.5764
	addq	40(%rsp), %rsi	# %sfp, tw3
	imull	%ecx, %ebx	# D.5761, D.5761
	movw	%ax, 0(%r13)	# D.5764, MEM[base: Fout_278, offset: 0B]
	addq	80(%rsp), %rdi	# %sfp, tw3
	imull	48(%rsp), %ecx	# %sfp, D.5761
	imull	16(%rsp), %r15d	# %sfp, D.5761
	imull	56(%rsp), %edx	# %sfp, D.5761
	subl	%r9d, %r12d	# D.5761, D.5761
	movl	32(%rsp), %r9d	# %sfp, D.5761
	subl	%r14d, %ebx	# D.5761, D.5761
	imull	8(%rsp), %r9d	# %sfp, D.5761
	addl	$16384, %r12d	#, D.5761
	addl	$16384, %ebx	#, D.5761
	movw	%r10w, 2(%r13)	# D.5764, MEM[base: Fout_278, offset: 2B]
	sarl	$15, %ebx	#, D.5761
	sarl	$15, %r12d	#, D.5761
	leal	(%rbx,%r12), %r14d	#, D.5764
	subl	%ebx, %r12d	# D.5761, D.5764
	movq	88(%rsp), %rbx	# %sfp, tmp900
	leal	16384(%rcx,%rdx), %edx	#, D.5761
	subl	%r14d, %eax	# D.5764, tmp977
	leal	16384(%r9,%r15), %r9d	#, D.5761
	sarl	$15, %edx	#, D.5761
	movw	%ax, 0(%rbp)	# tmp977, MEM[base: _981, offset: 0B]
	sarl	$15, %r9d	#, D.5761
	leal	(%rdx,%r9), %ecx	#, D.5764
	subl	%edx, %r9d	# D.5761, D.5764
	movl	96(%rsp), %edx	# %sfp,
	subl	%ecx, %r10d	# D.5764, tmp978
	addq	%rbx, (%rsp)	# tmp900, %sfp
	movzwl	64(%rsp), %ebx	# %sfp, D.5764
	movw	%r10w, 2(%rbp)	# tmp978, MEM[base: _981, offset: 2B]
	addw	%r14w, 0(%r13)	# D.5764, MEM[base: Fout_278, offset: 0B]
	addw	%cx, 2(%r13)	# D.5764, MEM[base: Fout_278, offset: 2B]
	testl	%edx, %edx	#
	movl	%ebx, %eax	# D.5764, tmp979
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L43	#,
# BLOCK 17 freq:1389 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	%r9d, %eax	# D.5764, tmp983
	movzwl	68(%rsp), %edx	# %sfp, D.5764
	movw	%ax, (%r11)	# tmp983, MEM[base: _154, offset: 0B]
	movl	%edx, %eax	# D.5764, tmp984
	subl	%r12d, %eax	# D.5764, tmp984
	movw	%ax, 2(%r11)	# tmp984, MEM[base: _154, offset: 2B]
	movl	%ebx, %eax	# D.5764, tmp985
	subl	%r9d, %eax	# D.5764, tmp985
	movw	%ax, (%r8)	# tmp985, MEM[base: _960, offset: 0B]
	movl	%edx, %eax	# D.5764, D.5764
	addl	%eax, %r12d	# D.5764, tmp986
	movw	%r12w, 2(%r8)	# tmp986, MEM[base: _960, offset: 2B]
# SUCC: 15 [100.0%]  (CAN_FALLTHRU)
	jmp	.L31	#
# BLOCK 18 freq:375 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L42:
	cmpl	$2, 24(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L20	#,
# BLOCK 19 freq:250 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	48(%rsp), %edi	# %sfp, m
	movq	40(%rsp), %rcx	# %sfp, D.5762
	addq	$264, %rbx	#, tw1
	movslq	%edi, %rax	# m,
	leaq	0(%r13,%rax,4), %rsi	#, Fout2
	movl	%edi, %eax	# m, m
	subl	$1, %eax	#, D.5763
	leaq	4(,%rax,4), %rdi	#, D.5763
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%r13, %rdi	# Fout, D.5768
# BLOCK 20 freq:2778 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L26:
	movswl	0(%r13), %edx	# MEM[base: Fout_54, offset: 0B], D.5761
	addq	$4, %rsi	#, Fout2
	movl	%edx, %eax	# D.5761, tmp786
	sall	$14, %eax	#, tmp786
	subl	%edx, %eax	# D.5761, D.5761
	movswl	2(%r13), %edx	# MEM[base: Fout_54, offset: 2B], D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 0(%r13)	# D.5761, MEM[base: Fout_54, offset: 0B]
	movl	%edx, %eax	# D.5761, tmp792
	sall	$14, %eax	#, tmp792
	subl	%edx, %eax	# D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%r13)	# D.5761, MEM[base: Fout_54, offset: 2B]
	movswl	-4(%rsi), %eax	# MEM[base: Fout2_67, offset: 0B], D.5761
	movswl	-2(%rsi), %edx	# MEM[base: Fout2_67, offset: 2B], D.5761
	movl	%eax, %r8d	# D.5761, tmp798
	sall	$14, %r8d	#, tmp798
	subl	%eax, %r8d	# D.5761, D.5761
	movl	%edx, %eax	# D.5761, tmp803
	sall	$14, %eax	#, tmp803
	addl	$16384, %r8d	#, D.5761
	subl	%edx, %eax	# D.5761, D.5761
	sarl	$15, %r8d	#, D.5761
	addl	$16384, %eax	#, D.5761
	movw	%r8w, -4(%rsi)	# D.5761, MEM[base: Fout2_67, offset: 0B]
	movl	%r8d, %edx	# D.5761, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, -2(%rsi)	# D.5761, MEM[base: Fout2_67, offset: 2B]
	movswl	(%rbx), %r9d	# MEM[base: tw1_81, offset: 0B], D.5761
	movl	%eax, %r11d	# D.5761, D.5761
	movswl	2(%rbx), %r10d	# MEM[base: tw1_81, offset: 2B], D.5761
	addq	%rcx, %rbx	# D.5762, tw1
	imull	%r9d, %edx	# D.5761, D.5761
	imull	%r10d, %r11d	# D.5761, D.5761
	subl	%r11d, %edx	# D.5761, D.5761
	movzwl	0(%r13), %r11d	# MEM[base: Fout_54, offset: 0B], D.5764
	imull	%r10d, %r8d	# D.5761, D.5761
	addl	$16384, %edx	#, D.5761
	imull	%r9d, %eax	# D.5761, D.5761
	sarl	$15, %edx	#, D.5761
	subl	%edx, %r11d	# D.5761, D.5764
	movw	%r11w, -4(%rsi)	# D.5764, MEM[base: Fout2_67, offset: 0B]
	leal	16384(%r8,%rax), %eax	#, D.5761
	movzwl	2(%r13), %r8d	# MEM[base: Fout_54, offset: 2B], D.5764
	sarl	$15, %eax	#, D.5761
	subl	%eax, %r8d	# D.5761, D.5764
	movw	%r8w, -2(%rsi)	# D.5764, MEM[base: Fout2_67, offset: 2B]
	addw	%dx, 0(%r13)	# D.5761, MEM[base: Fout_54, offset: 0B]
	addw	%ax, 2(%r13)	# D.5761, MEM[base: Fout_54, offset: 2B]
	addq	$4, %r13	#, Fout
	cmpq	%rdi, %r13	# D.5768, Fout
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU)
	jne	.L26	#,
# BLOCK 21 freq:250 seq:19
# PRED: 20 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L15	#
# BLOCK 22 freq:350 seq:20
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L41:
	movq	32(%rsp), %rax	# %sfp, fstride
	movq	%r13, %rdx	# Fout, Fout
	salq	$2, %rax	#, D.5762
	imulq	%rax, %rbp	# D.5762, D.5762
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, 40(%rsp)	# D.5762, %sfp
# BLOCK 23 freq:3889 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%r15), %eax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	$4, %rdx	#, Fout
	addq	%rbp, %r15	# D.5762, f
	movl	%eax, -4(%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	cmpq	%r12, %rdx	# Fout_end, Fout
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L17	#,
# BLOCK 24 freq:350 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$3, 24(%rsp)	#, %sfp
# SUCC: 25 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L44	#,
# BLOCK 25 freq:250 seq:23
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 24 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L21:
	movslq	48(%rsp), %rax	# %sfp, m
	leaq	264(%rbx), %rbp	#, tw2
	movq	%rbp, %r15	# tw2, tw2
	movq	%rax, %rdi	# m, m
	movq	%rax, 8(%rsp)	# m, %sfp
	movq	32(%rsp), %rax	# %sfp, fstride
	leaq	0(%r13,%rdi,4), %rdx	#, ivtmp.145
	leaq	0(%r13,%rdi,8), %r10	#, ivtmp.147
	leaq	0(,%rax,8), %rsi	#, D.5762
	imulq	%rdi, %rax	# m, D.5762
	movq	%rsi, 16(%rsp)	# D.5762, %sfp
	movswl	266(%rbx,%rax,4), %eax	# MEM[(struct  *)_124 + 2B], D.5761
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, 24(%rsp)	# D.5761, %sfp
# BLOCK 26 freq:2778 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L28:
	movswl	0(%r13), %eax	# MEM[base: Fout_127, offset: 0B], D.5761
	imull	$10922, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 0(%r13)	# D.5761, MEM[base: Fout_127, offset: 0B]
	movswl	2(%r13), %eax	# MEM[base: Fout_127, offset: 2B], D.5761
	imull	$10922, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%r13)	# D.5761, MEM[base: Fout_127, offset: 2B]
	movswl	(%rdx), %eax	# MEM[base: _36, offset: 0B], D.5761
	imull	$10922, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, (%rdx)	# D.5761, MEM[base: _36, offset: 0B]
	movswl	2(%rdx), %eax	# MEM[base: _36, offset: 2B], D.5761
	imull	$10922, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%ax, 2(%rdx)	# D.5761, MEM[base: _36, offset: 2B]
	movswl	(%r10), %ecx	# MEM[base: _679, offset: 0B], D.5761
	movswl	2(%r10), %eax	# MEM[base: _679, offset: 2B], D.5761
	imull	$10922, %ecx, %ecx	#, D.5761, D.5761
	imull	$10922, %eax, %eax	#, D.5761, D.5761
	addl	$16384, %ecx	#, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %ecx	#, D.5761
	sarl	$15, %eax	#, D.5761
	movw	%cx, (%r10)	# D.5761, MEM[base: _679, offset: 0B]
	movw	%ax, 2(%r10)	# D.5761, MEM[base: _679, offset: 2B]
	movswl	(%rdx), %r12d	# MEM[base: _36, offset: 0B], D.5761
	movswl	2(%rdx), %r9d	# MEM[base: _36, offset: 2B], D.5761
	movswl	0(%rbp), %ebx	# MEM[base: tw2_170, offset: 0B], D.5761
	movswl	2(%rbp), %r11d	# MEM[base: tw2_170, offset: 2B], D.5761
	movswl	(%r15), %edi	# MEM[base: tw2_190, offset: 0B], D.5761
	movswl	2(%r15), %r8d	# MEM[base: tw2_190, offset: 2B], D.5761
	movl	%r12d, %esi	# D.5761, D.5761
	movl	%r9d, %r14d	# D.5761, D.5761
	imull	%r11d, %r14d	# D.5761, D.5761
	imull	%ebx, %esi	# D.5761, D.5761
	subl	%r14d, %esi	# D.5761, D.5761
	movl	%eax, %r14d	# D.5761, D.5761
	addl	$16384, %esi	#, D.5761
	sarl	$15, %esi	#, D.5761
	movl	%esi, (%rsp)	# D.5761, %sfp
	movl	%ecx, %esi	# D.5761, D.5761
	imull	%edi, %esi	# D.5761, D.5761
	imull	%r8d, %r14d	# D.5761, D.5761
	imull	%ebx, %r9d	# D.5761, D.5761
	subl	%r14d, %esi	# D.5761, D.5761
	movzwl	(%rsp), %r14d	# %sfp, tmp1222
	imull	%r12d, %r11d	# D.5761, D.5761
	addl	$16384, %esi	#, D.5761
	movzwl	0(%r13), %ebx	# MEM[base: Fout_127, offset: 0B], D.5764
	sarl	$15, %esi	#, D.5761
	leal	16384(%r11,%r9), %r9d	#, D.5761
	addl	%esi, %r14d	# D.5761, D.5764
	imull	%r8d, %ecx	# D.5761, D.5761
	sarl	$15, %r9d	#, D.5761
	imull	%edi, %eax	# D.5761, D.5761
	addq	40(%rsp), %rbp	# %sfp, tw2
	addq	16(%rsp), %r15	# %sfp, tw2
	addq	$4, %r10	#, ivtmp.147
	leal	16384(%rcx,%rax), %eax	#, D.5761
	movl	%r14d, %ecx	# D.5764, D.5767
	sarw	%cx	# D.5767
	sarl	$15, %eax	#, D.5761
	subl	%ecx, %ebx	# D.5767, D.5764
	movw	%bx, (%rdx)	# D.5764, MEM[base: _36, offset: 0B]
	leal	(%rax,%r9), %edi	#, D.5764
	movzwl	2(%r13), %ebx	# MEM[base: Fout_127, offset: 2B], D.5764
	subl	%eax, %r9d	# D.5761, D.5764
	movl	%edi, %ecx	# D.5764, D.5767
	movswl	%r9w, %r9d	# D.5764, D.5761
	sarw	%cx	# D.5767
	subl	%ecx, %ebx	# D.5767, D.5764
	movw	%bx, 2(%rdx)	# D.5764, MEM[base: _36, offset: 2B]
	addw	%di, 2(%r13)	# D.5764, MEM[base: Fout_127, offset: 2B]
	movl	24(%rsp), %edi	# %sfp, D.5761
	addw	%r14w, 0(%r13)	# D.5764, MEM[base: Fout_127, offset: 0B]
	addq	$4, %r13	#, Fout
	imull	%edi, %r9d	# D.5761, D.5761
	addl	$16384, %r9d	#, D.5761
	sarl	$15, %r9d	#, D.5761
	movl	%r9d, %eax	# D.5761, D.5764
	addw	(%rdx), %ax	# MEM[base: _36, offset: 0B], D.5764
	movw	%ax, -4(%r10)	# D.5764, MEM[base: _679, offset: 0B]
	movzwl	(%rsp), %eax	# %sfp, D.5764
	movzwl	2(%rdx), %ecx	# MEM[base: _36, offset: 2B], D.5764
	subl	%esi, %eax	# D.5761, D.5764
	cwtl
	imull	%edi, %eax	# D.5761, D.5761
	addl	$16384, %eax	#, D.5761
	sarl	$15, %eax	#, D.5761
	subl	%eax, %ecx	# D.5761, D.5764
	movw	%cx, -2(%r10)	# D.5764, MEM[base: _679, offset: 2B]
	subw	%r9w, (%rdx)	# D.5761, MEM[base: _36, offset: 0B]
	addw	%ax, 2(%rdx)	# D.5761, MEM[base: _36, offset: 2B]
	addq	$4, %rdx	#, ivtmp.145
	subq	$1, 8(%rsp)	#, %sfp
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU)
	jne	.L28	#,
# BLOCK 27 freq:250 seq:25
# PRED: 26 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L15	#
# BLOCK 28 freq:250 seq:26
# PRED: 18 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L20:
	movl	24(%rsp), %r8d	# %sfp,
	movl	48(%rsp), %ecx	# %sfp,
	movq	%rbx, %rdx	# st,
	movq	32(%rsp), %rsi	# %sfp,
	addq	$152, %rsp	#,
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi	# Fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
	.cfi_endproc
.LFE50:
	.size	kf_work, .-kf_work
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.type	kf_work.constprop.1, @function
kf_work.constprop.1:
.LFB58:
	.cfi_startproc
# BLOCK 2 freq:1250 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d	# in_stride, in_stride
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r15	# f, f
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp	# Fout, Fout
	movq	%r8, %rbx	# st, st
	subq	$120, %rsp	#,
	.cfi_def_cfa_offset 176
	movl	4(%rcx), %edx	# MEM[(int *)factors_1(D) + 4B], m
	movl	(%rcx), %eax	# *factors_1(D), p
	movl	%edx, %esi	# m, m
	movl	%edx, 32(%rsp)	# m, %sfp
	movl	%eax, %edx	# p, D.5923
	imull	%esi, %edx	# m, D.5923
	cmpl	$1, %esi	#, m
	movl	%eax, 24(%rsp)	# p, %sfp
	movslq	%edx, %rdx	# D.5923, D.5924
	leaq	(%rdi,%rdx,4), %r12	#, Fout_end
# SUCC: 22 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L71	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	%r14d, %r13	# in_stride, D.5924
	movslq	32(%rsp), %rdx	# %sfp, D.5924
	movq	%rdi, 40(%rsp)	# Fout, %sfp
	leaq	0(,%r13,4), %rax	#, D.5924
	movq	%rdi, %rbp	# Fout, Fout
	movq	%r15, %r13	# f, f
	movq	%rax, (%rsp)	# D.5924, %sfp
	movslq	24(%rsp), %rax	# %sfp, D.5924
	movq	%rax, 8(%rsp)	# D.5924, %sfp
	leaq	0(,%rdx,4), %rax	#, D.5924
	movq	%rax, 16(%rsp)	# D.5924, %sfp
	leaq	8(%rcx), %rax	#, factors
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L54:
	movq	8(%rsp), %rdx	# %sfp,
	movq	%r13, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r15, %r8	# factors,
	movl	%r14d, %ecx	# in_stride,
	call	kf_work	#
	addq	16(%rsp), %rbp	# %sfp, Fout
	addq	(%rsp), %r13	# %sfp, f
	cmpq	%rbp, %r12	# Fout, Fout_end
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L54	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 24(%rsp)	#, %sfp
	movq	40(%rsp), %rbp	# %sfp, Fout
# SUCC: 25 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L49	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [80.0%]  (CAN_FALLTHRU)
.L74:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L72	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	24(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L52	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L48	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %r14d	# %sfp, m
	leaq	264(%rbx), %rax	#, twiddles
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 96(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m,
	salq	$2, %rax	#, D.5924
	leaq	0(%rbp,%rax), %r8	#, Fout1
	leaq	(%rbx,%rax), %rdx	#, D.5928
	leaq	(%r8,%rax), %r9	#, Fout2
	movswl	(%rdx), %edi	# MEM[(struct kiss_fft_cpx *)_454],
	movzwl	2(%rdx), %ecx	# MEM[(struct kiss_fft_cpx *)_454 + 2B], ya$i
	addq	%rax, %rdx	# D.5924, D.5928
	movq	%r9, 8(%rsp)	# Fout2, %sfp
	addq	%rax, %r9	# D.5924, Fout3
	movswl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_458],
	addq	%r9, %rax	# Fout3, Fout4
	testl	%r14d, %r14d	# m
	movswl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_458 + 2B],
	movq	%rax, (%rsp)	# Fout4, %sfp
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L45	#,
# BLOCK 10 freq:228 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rbx, 24(%rsp)	# twiddles, %sfp
	movl	%r14d, %ebx	# m, D.5925
	movl	%edi, 40(%rsp)	# D.5923, %sfp
	subl	$1, %ebx	#, D.5925
	movq	8(%rsp), %rdi	# %sfp, Fout2
	movl	%esi, 48(%rsp)	# D.5923, %sfp
	leaq	4(,%rbx,4), %rax	#, D.5925
	movswl	%cx, %esi	# ya$i, D.5923
	movl	%edx, 56(%rsp)	# D.5923, %sfp
	movl	%esi, 52(%rsp)	# D.5923, %sfp
	movq	$0, 32(%rsp)	#, %sfp
	movq	%r8, %rdx	# Fout1, Fout1
	addq	%r9, %rax	# Fout3, D.5928
	movq	%rax, 104(%rsp)	# D.5928, %sfp
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r9, %rax	# Fout3, Fout3
# BLOCK 11 freq:2528 seq:9
# PRED: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L63:
	movswl	0(%rbp), %ecx	# MEM[base: Fout_421, offset: 0B], D.5923
	movq	(%rsp), %rbx	# %sfp, Fout4
	movq	32(%rsp), %r15	# %sfp, ivtmp.291
	movq	96(%rsp), %r11	# %sfp, twiddles
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, 0(%rbp)	# D.5923, MEM[base: Fout_421, offset: 0B]
	movswl	2(%rbp), %ecx	# MEM[base: Fout_421, offset: 2B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, 2(%rbp)	# D.5923, MEM[base: Fout_421, offset: 2B]
	movswl	(%rdx), %ecx	# MEM[base: Fout1_419, offset: 0B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, (%rdx)	# D.5923, MEM[base: Fout1_419, offset: 0B]
	movswl	2(%rdx), %ecx	# MEM[base: Fout1_419, offset: 2B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, 2(%rdx)	# D.5923, MEM[base: Fout1_419, offset: 2B]
	movswl	(%rdi), %ecx	# MEM[base: Fout2_417, offset: 0B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, (%rdi)	# D.5923, MEM[base: Fout2_417, offset: 0B]
	movswl	2(%rdi), %ecx	# MEM[base: Fout2_417, offset: 2B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, 2(%rdi)	# D.5923, MEM[base: Fout2_417, offset: 2B]
	movswl	(%rax), %ecx	# MEM[base: Fout3_14, offset: 0B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, (%rax)	# D.5923, MEM[base: Fout3_14, offset: 0B]
	movswl	2(%rax), %ecx	# MEM[base: Fout3_14, offset: 2B], D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%cx, 2(%rax)	# D.5923, MEM[base: Fout3_14, offset: 2B]
	movswl	(%rbx), %esi	# MEM[base: Fout4_221, offset: 0B], D.5923
	movswl	2(%rbx), %ecx	# MEM[base: Fout4_221, offset: 2B], D.5923
	imull	$6553, %esi, %esi	#, D.5923, D.5923
	imull	$6553, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %esi	#, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %esi	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%si, (%rbx)	# D.5923, MEM[base: Fout4_221, offset: 0B]
	movw	%cx, 2(%rbx)	# D.5923, MEM[base: Fout4_221, offset: 2B]
	movzwl	2(%rbp), %r9d	# MEM[base: Fout_421, offset: 2B], scratch$0$i
	movswl	(%r11,%r15,2), %r10d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 2, offset: 0B], D.5923
	movswl	(%rdi), %r8d	# MEM[base: Fout2_417, offset: 0B], D.5923
	movswl	(%rdx), %r14d	# MEM[base: Fout1_419, offset: 0B], D.5923
	movswl	(%r11,%r15), %r13d	# MEM[base: twiddles_46, index: ivtmp.291_449, offset: 0B], D.5923
	movswl	2(%rdx), %ebx	# MEM[base: Fout1_419, offset: 2B], D.5923
	movswl	2(%r11,%r15), %r12d	# MEM[base: twiddles_46, index: ivtmp.291_449, offset: 2B], D.5923
	movw	%r9w, 16(%rsp)	# scratch$0$i, %sfp
	movl	%r8d, 76(%rsp)	# D.5923, %sfp
	movl	%r10d, 80(%rsp)	# D.5923, %sfp
	movswl	2(%rdi), %r9d	# MEM[base: Fout2_417, offset: 2B], D.5923
	movswl	(%rax), %r8d	# MEM[base: Fout3_14, offset: 0B], D.5923
	movl	%r14d, %edi	# D.5923, D.5923
	imull	%r13d, %edi	# D.5923, D.5923
	movl	%r8d, 88(%rsp)	# D.5923, %sfp
	movq	24(%rsp), %r8	# %sfp, ivtmp.312
	movl	%r9d, 84(%rsp)	# D.5923, %sfp
	movswl	2(%r11,%r15,2), %r9d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 2, offset: 2B], D.5923
	movswl	(%r8), %r10d	# MEM[base: _418, offset: 0B], D.5923
	movswl	2(%r8), %r8d	# MEM[base: _418, offset: 2B], D.5923
	movl	%r10d, 64(%rsp)	# D.5923, %sfp
	movswl	2(%rax), %r10d	# MEM[base: Fout3_14, offset: 2B], D.5923
	movl	%r10d, 68(%rsp)	# D.5923, %sfp
	movswl	(%r11,%r15,4), %r10d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 4, offset: 0B], D.5923
	movswl	2(%r11,%r15,4), %r11d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 4, offset: 2B], D.5923
	movl	%ebx, %r15d	# D.5923, D.5923
	imull	%r12d, %r15d	# D.5923, D.5923
	subl	%r15d, %edi	# D.5923, D.5923
	movl	%esi, %r15d	# D.5923, D.5923
	addl	$16384, %edi	#, D.5923
	imull	%r10d, %r15d	# D.5923, D.5923
	sarl	$15, %edi	#, D.5923
	imull	%r14d, %r12d	# D.5923, D.5923
	movl	%edi, 72(%rsp)	# D.5923, %sfp
	movl	%r15d, %edi	# D.5923, D.5923
	movl	%ecx, %r15d	# D.5923, D.5923
	imull	%r11d, %esi	# D.5923, D.5923
	imull	%r13d, %ebx	# D.5923, D.5923
	movl	76(%rsp), %r13d	# %sfp, D.5923
	imull	%r10d, %ecx	# D.5923, D.5923
	leal	16384(%r12,%rbx), %ebx	#, D.5923
	movl	80(%rsp), %r12d	# %sfp, D.5923
	imull	%r11d, %r15d	# D.5923, D.5923
	movl	84(%rsp), %r11d	# %sfp, D.5923
	sarl	$15, %ebx	#, D.5923
	leal	16384(%rsi,%rcx), %ecx	#, D.5923
	movl	%r11d, %r10d	# D.5923, D.5923
	subl	%r15d, %edi	# D.5923, D.5923
	sarl	$15, %ecx	#, D.5923
	addl	$16384, %edi	#, D.5923
	leal	(%rcx,%rbx), %esi	#, D.5926
	movl	%ecx, %r14d	# D.5923, D.5923
	movl	%r13d, %ecx	# D.5923, D.5923
	imull	%r9d, %r10d	# D.5923, D.5923
	movl	%edi, %r15d	# D.5923, D.5923
	imull	%r12d, %ecx	# D.5923, D.5923
	sarl	$15, %r15d	#, D.5923
	movl	%r15d, 92(%rsp)	# D.5923, %sfp
	movl	%r15d, %edi	# D.5923, D.5926
	movl	88(%rsp), %r15d	# %sfp, D.5923
	addw	72(%rsp), %di	# %sfp, D.5926
	subl	%r10d, %ecx	# D.5923, D.5923
	leal	16384(%rcx), %r10d	#, D.5923
	imull	%r13d, %r9d	# D.5923, D.5923
	movl	%r10d, %ecx	# D.5923, D.5923
	movl	68(%rsp), %r10d	# %sfp, D.5923
	sarl	$15, %ecx	#, D.5923
	movl	%ecx, 76(%rsp)	# D.5923, %sfp
	movl	64(%rsp), %ecx	# %sfp, D.5923
	imull	%r8d, %r10d	# D.5923, D.5923
	imull	%r15d, %r8d	# D.5923, D.5923
	imull	%r15d, %ecx	# D.5923, D.5923
	subl	%r10d, %ecx	# D.5923, D.5923
	movl	%r12d, %r10d	# D.5923, D.5923
	movzwl	0(%rbp), %r12d	# MEM[base: Fout_421, offset: 0B], D.5926
	imull	%r11d, %r10d	# D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movl	%ecx, 80(%rsp)	# D.5923, %sfp
	addw	76(%rsp), %cx	# %sfp, D.5926
	leal	16384(%r9,%r10), %r9d	#, D.5923
	movl	64(%rsp), %r10d	# %sfp, D.5923
	movl	%r12d, %r15d	# D.5926, D.5926
	imull	68(%rsp), %r10d	# %sfp, D.5923
	sarl	$15, %r9d	#, D.5923
	movw	%r15w, 64(%rsp)	# D.5926, %sfp
	leal	(%rcx,%r12), %r11d	#, D.5926
	movswl	%cx, %ecx	# D.5926, D.5923
	addl	%edi, %r11d	# D.5926, tmp1055
	movw	%r11w, 0(%rbp)	# tmp1055, MEM[base: Fout_421, offset: 0B]
	movzwl	16(%rsp), %r11d	# %sfp, scratch$0$i
	leal	16384(%r8,%r10), %r8d	#, D.5923
	sarl	$15, %r8d	#, D.5923
	leal	(%r8,%r9), %r10d	#, D.5926
	addl	%r10d, %r11d	# D.5926, D.5926
	addl	%esi, %r11d	# D.5926, tmp1057
	movw	%r11w, 2(%rbp)	# tmp1057, MEM[base: Fout_421, offset: 2B]
	movswl	%di, %r11d	# D.5926, D.5923
	movl	%r15d, %edi	# D.5926, D.5926
	movl	%r11d, %r12d	# D.5923, D.5923
	movl	48(%rsp), %r11d	# %sfp, D.5923
	movl	%r12d, 68(%rsp)	# D.5923, %sfp
	movl	40(%rsp), %r15d	# %sfp, D.5923
	movl	%r11d, %r13d	# D.5923, D.5923
	imull	%ecx, %r13d	# D.5923, D.5923
	subl	%r14d, %ebx	# D.5923, D.5926
	movl	52(%rsp), %r14d	# %sfp, D.5923
	imull	%r15d, %r12d	# D.5923, D.5923
	subl	%r8d, %r9d	# D.5923, D.5926
	movswl	%r9w, %r9d	# D.5926, D.5923
	addl	$16384, %r13d	#, D.5923
	movl	%r14d, %r8d	# D.5923, D.5923
	sarl	$15, %r13d	#, D.5923
	addl	%r13d, %edi	# D.5923, D.5926
	movl	%r12d, %r13d	# D.5923, D.5923
	addl	$16384, %r13d	#, D.5923
	sarl	$15, %r13d	#, D.5923
	addl	%edi, %r13d	# D.5926, D.5926
	movl	%r13d, %r12d	# D.5926, D.5926
	movswl	%si, %r13d	# D.5926, D.5923
	movswl	%r10w, %esi	# D.5926, D.5923
	imull	%esi, %r11d	# D.5923, D.5923
	movzwl	16(%rsp), %r10d	# %sfp, scratch$0$i
	addl	$16384, %r11d	#, D.5923
	sarl	$15, %r11d	#, D.5923
	leal	(%r10,%r11), %edi	#, D.5926
	movl	%r15d, %r10d	# D.5923, D.5923
	movswl	%bx, %r15d	# D.5926, D.5923
	imull	%r15d, %r8d	# D.5923, D.5923
	imull	%r13d, %r10d	# D.5923, D.5923
	movl	%r8d, %ebx	# D.5923, D.5923
	addl	$16384, %ebx	#, D.5923
	movl	%r10d, %r11d	# D.5923, D.5923
	movl	%ebx, %r10d	# D.5923, D.5923
	addl	$16384, %r11d	#, D.5923
	sarl	$15, %r10d	#, D.5923
	sarl	$15, %r11d	#, D.5923
	movl	%r10d, %r8d	# D.5923, D.5923
	movl	56(%rsp), %r10d	# %sfp, D.5923
	addl	%edi, %r11d	# D.5926, D.5926
	imull	%r9d, %r10d	# D.5923, D.5923
	movl	%r10d, %ebx	# D.5923, D.5923
	addl	$16384, %ebx	#, D.5923
	movl	%ebx, %r10d	# D.5923, D.5923
	sarl	$15, %r10d	#, D.5923
	leal	(%r8,%r10), %ebx	#, D.5926
	movzwl	72(%rsp), %r10d	# %sfp, D.5926
	movw	%r12w, 72(%rsp)	# D.5926, %sfp
	subw	92(%rsp), %r10w	# %sfp, D.5926
	subl	%ebx, %r12d	# D.5926, tmp1088
	movw	%r12w, (%rdx)	# tmp1088, MEM[base: Fout1_419, offset: 0B]
	movzwl	64(%rsp), %r12d	# %sfp, D.5926
	movswl	%r10w, %r8d	# D.5926,
	movzwl	76(%rsp), %r10d	# %sfp, D.5926
	imull	%r8d, %r14d	# D.5923, D.5923
	subw	80(%rsp), %r10w	# %sfp, D.5926
	movl	%r14d, %edi	# D.5923, D.5923
	addl	$16384, %edi	#, D.5923
	movswl	%r10w, %r10d	# D.5926, D.5923
	movl	%edi, %r14d	# D.5923, D.5923
	movl	56(%rsp), %edi	# %sfp, D.5923
	sarl	$15, %r14d	#, D.5923
	imull	%r10d, %edi	# D.5923, D.5923
	addl	$16384, %edi	#, D.5923
	sarl	$15, %edi	#, D.5923
	addl	%r14d, %edi	# D.5923, D.5926
	addw	72(%rsp), %bx	# %sfp, tmp1090
	leal	(%r11,%rdi), %r14d	#, tmp1089
	subl	%edi, %r11d	# D.5926, tmp1091
	movw	%r14w, 2(%rdx)	# tmp1089, MEM[base: Fout1_419, offset: 2B]
	movq	(%rsp), %r14	# %sfp, Fout4
	movw	%bx, (%r14)	# tmp1090, MEM[base: Fout4_221, offset: 0B]
	movl	40(%rsp), %ebx	# %sfp, D.5923
	movw	%r11w, 2(%r14)	# tmp1091, MEM[base: Fout4_221, offset: 2B]
	movl	48(%rsp), %r11d	# %sfp, D.5923
	imull	%ebx, %ecx	# D.5923, D.5923
	imull	%ebx, %esi	# D.5923, D.5923
	movzwl	16(%rsp), %ebx	# %sfp, scratch$0$i
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	addl	$16384, %esi	#, D.5923
	addl	%ecx, %r12d	# D.5923, D.5926
	movl	68(%rsp), %ecx	# %sfp, D.5923
	sarl	$15, %esi	#, D.5923
	imull	%r11d, %ecx	# D.5923, D.5923
	movl	%ecx, %edi	# D.5923, D.5923
	leal	(%rbx,%rsi), %ecx	#, D.5926
	movl	%r13d, %esi	# D.5923, D.5923
	imull	%r11d, %esi	# D.5923, D.5923
	movl	56(%rsp), %r11d	# %sfp, D.5923
	addl	$16384, %edi	#, D.5923
	sarl	$15, %edi	#, D.5923
	addl	%edi, %r12d	# D.5923, D.5926
	movq	8(%rsp), %rdi	# %sfp, Fout2
	addl	$16384, %esi	#, D.5923
	sarl	$15, %esi	#, D.5923
	addl	%ecx, %esi	# D.5926, D.5926
	movl	52(%rsp), %ecx	# %sfp, D.5923
	imull	%r11d, %r15d	# D.5923, D.5923
	imull	%r11d, %r8d	# D.5923, D.5923
	addl	$16384, %r15d	#, D.5923
	imull	%ecx, %r9d	# D.5923, D.5923
	sarl	$15, %r15d	#, D.5923
	addl	$16384, %r8d	#, D.5923
	imull	%ecx, %r10d	# D.5923, D.5923
	sarl	$15, %r8d	#, D.5923
	addl	$16384, %r9d	#, D.5923
	sarl	$15, %r9d	#, D.5923
	addl	$16384, %r10d	#, D.5923
	subl	%r15d, %r9d	# D.5923, D.5926
	sarl	$15, %r10d	#, D.5923
	leal	(%r12,%r9), %ecx	#, tmp1118
	subl	%r10d, %r8d	# D.5923, D.5926
	subl	%r9d, %r12d	# D.5926, tmp1120
	movw	%cx, (%rdi)	# tmp1118, MEM[base: Fout2_417, offset: 0B]
	leal	(%rsi,%r8), %ecx	#, tmp1119
	subl	%r8d, %esi	# D.5926, tmp1121
	addq	$4, %rbp	#, Fout
	addq	$4, %rdi	#, Fout2
	addq	$4, %r14	#, Fout4
	movw	%cx, -2(%rdi)	# tmp1119, MEM[base: Fout2_417, offset: 2B]
	addq	$4, 32(%rsp)	#, %sfp
	addq	$4, %rdx	#, Fout1
	movw	%r12w, (%rax)	# tmp1120, MEM[base: Fout3_14, offset: 0B]
	movw	%si, 2(%rax)	# tmp1121, MEM[base: Fout3_14, offset: 2B]
	addq	$4, %rax	#, Fout3
	movq	%rdi, 8(%rsp)	# Fout2, %sfp
	movq	%r14, (%rsp)	# Fout4, %sfp
	addq	$12, 24(%rsp)	#, %sfp
	cmpq	104(%rsp), %rax	# %sfp, Fout3
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L63	#,
# BLOCK 12 freq:500 seq:10
# PRED: 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU) 15 [9.0%]  (CAN_FALLTHRU)
.L45:
	addq	$120, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 13 freq:250 seq:11
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movslq	32(%rsp), %rax	# %sfp, k
	leaq	264(%rbx), %rdx	#, tw3
	movl	4(%rbx), %ebx	# st_22(D)->inverse, D.5923
	xorl	%r8d, %r8d	# ivtmp.263
	movq	%rdx, %r14	# tw3, tw3
	movq	%rdx, (%rsp)	# tw3, %sfp
	movl	%ebx, 64(%rsp)	# D.5923, %sfp
	movq	%rax, 56(%rsp)	# k, %sfp
	salq	$2, %rax	#, D.5924
	leaq	0(%rbp,%rax), %r9	#, ivtmp.279
	leaq	(%r9,%rax), %rbx	#, ivtmp.281
	leaq	(%rbx,%rax), %r11	#, ivtmp.283
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L62	#
# BLOCK 14 freq:1389 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L73:
	movzwl	52(%rsp), %edi	# %sfp, D.5926
	subl	%r12d, %eax	# D.5926, tmp963
	movw	%ax, (%r9)	# tmp963, MEM[base: _979, offset: 0B]
	movl	%edi, %eax	# D.5926, D.5926
	addl	%edx, %eax	# D.5926, tmp964
	movw	%ax, 2(%r9)	# tmp964, MEM[base: _979, offset: 2B]
	movl	%esi, %eax	# D.5926, D.5926
	addl	%eax, %r12d	# D.5926, tmp965
	movl	%edi, %eax	# D.5926, tmp966
	subl	%edx, %eax	# D.5926, tmp966
	movw	%r12w, (%r11)	# tmp965, MEM[base: _932, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%ax, 2(%r11)	# tmp966, MEM[base: _932, offset: 2B]
# BLOCK 15 freq:2778 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%]  (CAN_FALLTHRU)
.L61:
	addq	$4, %rbp	#, Fout
	addq	$1, %r8	#, ivtmp.263
	addq	$4, %r9	#, ivtmp.279
	addq	$4, %rbx	#, ivtmp.281
	addq	$4, %r11	#, ivtmp.283
	cmpq	%r8, 56(%rsp)	# ivtmp.263, %sfp
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	je	.L45	#,
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%]  (CAN_FALLTHRU)
.L62:
	movswl	0(%rbp), %edx	# MEM[base: Fout_277, offset: 0B], D.5923
	movl	%edx, %eax	# D.5923, tmp887
	sall	$13, %eax	#, tmp887
	subl	%edx, %eax	# D.5923, D.5923
	movswl	2(%rbp), %edx	# MEM[base: Fout_277, offset: 2B], D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 0(%rbp)	# D.5923, MEM[base: Fout_277, offset: 0B]
	movl	%edx, %eax	# D.5923, tmp893
	sall	$13, %eax	#, tmp893
	subl	%edx, %eax	# D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 2(%rbp)	# D.5923, MEM[base: Fout_277, offset: 2B]
	movswl	(%r9), %edx	# MEM[base: _979, offset: 0B], D.5923
	movl	%edx, %eax	# D.5923, tmp899
	sall	$13, %eax	#, tmp899
	subl	%edx, %eax	# D.5923, D.5923
	movswl	2(%r9), %edx	# MEM[base: _979, offset: 2B], D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, (%r9)	# D.5923, MEM[base: _979, offset: 0B]
	movl	%edx, %eax	# D.5923, tmp905
	sall	$13, %eax	#, tmp905
	subl	%edx, %eax	# D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 2(%r9)	# D.5923, MEM[base: _979, offset: 2B]
	movswl	(%rbx), %edx	# MEM[base: _936, offset: 0B], D.5923
	movl	%edx, %eax	# D.5923, tmp911
	sall	$13, %eax	#, tmp911
	subl	%edx, %eax	# D.5923, D.5923
	movswl	2(%rbx), %edx	# MEM[base: _936, offset: 2B], D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, (%rbx)	# D.5923, MEM[base: _936, offset: 0B]
	movl	%edx, %eax	# D.5923, tmp917
	sall	$13, %eax	#, tmp917
	subl	%edx, %eax	# D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 2(%rbx)	# D.5923, MEM[base: _936, offset: 2B]
	movswl	(%r11), %eax	# MEM[base: _932, offset: 0B], D.5923
	movl	%eax, %edi	# D.5923, tmp923
	sall	$13, %edi	#, tmp923
	subl	%eax, %edi	# D.5923, D.5923
	movswl	2(%r11), %eax	# MEM[base: _932, offset: 2B], D.5923
	addl	$16384, %edi	#, D.5923
	sarl	$15, %edi	#, D.5923
	movw	%di, (%r11)	# D.5923, MEM[base: _932, offset: 0B]
	movl	%eax, %esi	# D.5923, tmp928
	sall	$13, %esi	#, tmp928
	subl	%eax, %esi	# D.5923, D.5923
	addl	$16384, %esi	#, D.5923
	sarl	$15, %esi	#, D.5923
	movw	%si, 2(%r11)	# D.5923, MEM[base: _932, offset: 2B]
	movswl	(%r9), %eax	# MEM[base: _979, offset: 0B], D.5923
	movswl	2(%r9), %edx	# MEM[base: _979, offset: 2B], D.5923
	movswl	2(%r14,%r8,4), %ecx	# MEM[base: tw3_276, index: ivtmp.263_273, step: 4, offset: 2B], D.5923
	movswl	(%rbx), %r12d	# MEM[base: _936, offset: 0B], D.5923
	movswl	(%r14,%r8,8), %r10d	# MEM[base: tw3_276, index: ivtmp.263_273, step: 8, offset: 0B], D.5923
	movl	%eax, %r15d	# D.5923, D.5923
	movswl	(%r14,%r8,4), %eax	# MEM[base: tw3_276, index: ivtmp.263_273, step: 4, offset: 0B], D.5923
	movl	%edx, 16(%rsp)	# D.5923, %sfp
	movswl	2(%rbx), %edx	# MEM[base: _936, offset: 2B], D.5923
	movl	%ecx, 24(%rsp)	# D.5923, %sfp
	movswl	2(%r14,%r8,8), %ecx	# MEM[base: tw3_276, index: ivtmp.263_273, step: 8, offset: 2B], D.5923
	movl	%eax, 8(%rsp)	# D.5923, %sfp
	movq	(%rsp), %rax	# %sfp, tw3
	movswl	(%rax), %r13d	# MEM[base: tw3_375, offset: 0B], D.5923
	movswl	2(%rax), %eax	# MEM[base: tw3_375, offset: 2B], D.5923
	movl	%r13d, 32(%rsp)	# D.5923, %sfp
	movl	%eax, 40(%rsp)	# D.5923, %sfp
	movl	%edx, %r13d	# D.5923, D.5923
	movl	%r12d, %eax	# D.5923, D.5923
	imull	%r10d, %eax	# D.5923, D.5923
	imull	%ecx, %r13d	# D.5923, D.5923
	subl	%r13d, %eax	# D.5923, D.5923
	movzwl	0(%rbp), %r13d	# MEM[base: Fout_277, offset: 0B], D.5926
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	imull	%r10d, %edx	# D.5923, D.5923
	subl	%eax, %r13d	# D.5923, D.5926
	movw	%r13w, 48(%rsp)	# D.5926, %sfp
	movzwl	2(%rbp), %r13d	# MEM[base: Fout_277, offset: 2B], D.5926
	imull	%r12d, %ecx	# D.5923, D.5923
	movl	16(%rsp), %r10d	# %sfp, D.5923
	addw	0(%rbp), %ax	# MEM[base: Fout_277, offset: 0B], D.5926
	imull	24(%rsp), %r10d	# %sfp, D.5923
	addq	$12, (%rsp)	#, %sfp
	leal	16384(%rcx,%rdx), %ecx	#, D.5923
	movl	%r13d, %r12d	# D.5926, D.5926
	movl	8(%rsp), %edx	# %sfp, D.5923
	movw	%ax, 0(%rbp)	# D.5926, MEM[base: Fout_277, offset: 0B]
	sarl	$15, %ecx	#, D.5923
	subl	%ecx, %r12d	# D.5923, D.5926
	addl	%r13d, %ecx	# D.5926, D.5926
	movl	32(%rsp), %r13d	# %sfp, D.5923
	movw	%r12w, 52(%rsp)	# D.5926, %sfp
	movl	40(%rsp), %r12d	# %sfp, D.5923
	imull	%r15d, %edx	# D.5923, D.5923
	movw	%cx, 2(%rbp)	# D.5926, MEM[base: Fout_277, offset: 2B]
	imull	%edi, %r13d	# D.5923, D.5923
	imull	40(%rsp), %edi	# %sfp, D.5923
	subl	%r10d, %edx	# D.5923, D.5923
	imull	%esi, %r12d	# D.5923, D.5923
	movl	%r13d, %r10d	# D.5923, D.5923
	addl	$16384, %edx	#, D.5923
	imull	32(%rsp), %esi	# %sfp, D.5923
	sarl	$15, %edx	#, D.5923
	subl	%r12d, %r10d	# D.5923, D.5923
	movl	24(%rsp), %r12d	# %sfp, D.5923
	addl	$16384, %r10d	#, D.5923
	sarl	$15, %r10d	#, D.5923
	imull	%r15d, %r12d	# D.5923, D.5923
	leal	(%r10,%rdx), %r13d	#, D.5926
	subl	%r10d, %edx	# D.5923, D.5926
	leal	16384(%rdi,%rsi), %esi	#, D.5923
	subl	%r13d, %eax	# D.5926, tmp961
	movl	%r12d, %r15d	# D.5923, D.5923
	movl	8(%rsp), %r12d	# %sfp, D.5923
	sarl	$15, %esi	#, D.5923
	imull	16(%rsp), %r12d	# %sfp, D.5923
	movw	%ax, (%rbx)	# tmp961, MEM[base: _936, offset: 0B]
	leal	16384(%r15,%r12), %r12d	#, D.5923
	sarl	$15, %r12d	#, D.5923
	leal	(%rsi,%r12), %edi	#, D.5926
	subl	%esi, %r12d	# D.5923, D.5926
	movzwl	48(%rsp), %esi	# %sfp, D.5926
	subl	%edi, %ecx	# D.5926, tmp962
	movw	%cx, 2(%rbx)	# tmp962, MEM[base: _936, offset: 2B]
	movl	64(%rsp), %ecx	# %sfp,
	addw	%r13w, 0(%rbp)	# D.5926, MEM[base: Fout_277, offset: 0B]
	addw	%di, 2(%rbp)	# D.5926, MEM[base: Fout_277, offset: 2B]
	movl	%esi, %eax	# D.5926, tmp963
	testl	%ecx, %ecx	#
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L73	#,
# BLOCK 17 freq:1389 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	%r12d, %eax	# D.5926, tmp967
	movzwl	52(%rsp), %edi	# %sfp, D.5926
	movw	%ax, (%r9)	# tmp967, MEM[base: _979, offset: 0B]
	movl	%edi, %eax	# D.5926, tmp968
	subl	%edx, %eax	# D.5926, tmp968
	movw	%ax, 2(%r9)	# tmp968, MEM[base: _979, offset: 2B]
	movl	%esi, %eax	# D.5926, tmp969
	subl	%r12d, %eax	# D.5926, tmp969
	movw	%ax, (%r11)	# tmp969, MEM[base: _932, offset: 0B]
	movl	%edi, %eax	# D.5926, D.5926
	addl	%eax, %edx	# D.5926, tmp970
	movw	%dx, 2(%r11)	# tmp970, MEM[base: _932, offset: 2B]
# SUCC: 15 [100.0%]  (CAN_FALLTHRU)
	jmp	.L61	#
# BLOCK 18 freq:375 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L72:
	cmpl	$2, 24(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L48	#,
# BLOCK 19 freq:250 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %edx	# %sfp, m
	addq	$264, %rbx	#, tw1
	movslq	%edx, %rax	# m,
	leaq	0(%rbp,%rax,4), %rdi	#, Fout2
	movl	%edx, %eax	# m, m
	subl	$1, %eax	#, D.5925
	leaq	4(,%rax,4), %r8	#, D.5925
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rbp, %r8	# Fout, D.5928
# BLOCK 20 freq:2778 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L56:
	movswl	0(%rbp), %edx	# MEM[base: Fout_53, offset: 0B], D.5923
	addq	$4, %rbx	#, tw1
	addq	$4, %rdi	#, Fout2
	movl	%edx, %eax	# D.5923, tmp775
	sall	$14, %eax	#, tmp775
	subl	%edx, %eax	# D.5923, D.5923
	movswl	2(%rbp), %edx	# MEM[base: Fout_53, offset: 2B], D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 0(%rbp)	# D.5923, MEM[base: Fout_53, offset: 0B]
	movl	%edx, %eax	# D.5923, tmp781
	sall	$14, %eax	#, tmp781
	subl	%edx, %eax	# D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 2(%rbp)	# D.5923, MEM[base: Fout_53, offset: 2B]
	movswl	-4(%rdi), %eax	# MEM[base: Fout2_66, offset: 0B], D.5923
	movswl	-2(%rdi), %ecx	# MEM[base: Fout2_66, offset: 2B], D.5923
	movl	%eax, %edx	# D.5923, tmp787
	sall	$14, %edx	#, tmp787
	subl	%eax, %edx	# D.5923, D.5923
	movl	%ecx, %eax	# D.5923, tmp792
	sall	$14, %eax	#, tmp792
	addl	$16384, %edx	#, D.5923
	subl	%ecx, %eax	# D.5923, D.5923
	sarl	$15, %edx	#, D.5923
	addl	$16384, %eax	#, D.5923
	movw	%dx, -4(%rdi)	# D.5923, MEM[base: Fout2_66, offset: 0B]
	movl	%edx, %ecx	# D.5923, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, -2(%rdi)	# D.5923, MEM[base: Fout2_66, offset: 2B]
	movswl	-4(%rbx), %esi	# MEM[base: tw1_80, offset: 0B], D.5923
	movl	%eax, %r10d	# D.5923, D.5923
	movswl	-2(%rbx), %r9d	# MEM[base: tw1_80, offset: 2B], D.5923
	imull	%esi, %ecx	# D.5923, D.5923
	imull	%r9d, %r10d	# D.5923, D.5923
	subl	%r10d, %ecx	# D.5923, D.5923
	movzwl	0(%rbp), %r10d	# MEM[base: Fout_53, offset: 0B], D.5926
	imull	%r9d, %edx	# D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	imull	%esi, %eax	# D.5923, D.5923
	sarl	$15, %ecx	#, D.5923
	subl	%ecx, %r10d	# D.5923, D.5926
	movw	%r10w, -4(%rdi)	# D.5926, MEM[base: Fout2_66, offset: 0B]
	leal	16384(%rdx,%rax), %eax	#, D.5923
	movzwl	2(%rbp), %edx	# MEM[base: Fout_53, offset: 2B], D.5926
	sarl	$15, %eax	#, D.5923
	subl	%eax, %edx	# D.5923, D.5926
	movw	%dx, -2(%rdi)	# D.5926, MEM[base: Fout2_66, offset: 2B]
	addw	%cx, 0(%rbp)	# D.5923, MEM[base: Fout_53, offset: 0B]
	addw	%ax, 2(%rbp)	# D.5923, MEM[base: Fout_53, offset: 2B]
	addq	$4, %rbp	#, Fout
	cmpq	%r8, %rbp	# D.5928, Fout
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L56	#,
# BLOCK 21 freq:250 seq:19
# PRED: 20 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$120, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 22 freq:350 seq:20
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L71:
	.cfi_restore_state
	movslq	%r14d, %rax	# in_stride, D.5924
	movq	%rdi, %rdx	# Fout, Fout
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	salq	$2, %rax	#, D.5924
# BLOCK 23 freq:3889 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L47:
	movl	(%r15), %ecx	# MEM[base: f_10, offset: 0B], MEM[base: f_10, offset: 0B]
	addq	$4, %rdx	#, Fout
	addq	%rax, %r15	# D.5924, f
	movl	%ecx, -4(%rdx)	# MEM[base: f_10, offset: 0B], MEM[base: Fout_11, offset: 0B]
	cmpq	%rdx, %r12	# Fout, Fout_end
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L47	#,
# BLOCK 24 freq:350 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 24(%rsp)	#, %sfp
# SUCC: 25 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L74	#,
# BLOCK 25 freq:250 seq:23
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 24 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L49:
	movslq	32(%rsp), %rax	# %sfp, m
	leaq	264(%rbx), %r13	#, tw2
	xorl	%r14d, %r14d	# ivtmp.243
	movswl	266(%rbx,%rax,4), %ebx	# MEM[(struct  *)_123 + 2B], D.5923
	leaq	0(%rbp,%rax,4), %rdx	#, ivtmp.256
	leaq	0(%rbp,%rax,8), %r10	#, ivtmp.258
	movq	%rax, 8(%rsp)	# m, %sfp
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, 16(%rsp)	# D.5923, %sfp
# BLOCK 26 freq:2778 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L58:
	movswl	0(%rbp), %eax	# MEM[base: Fout_126, offset: 0B], D.5923
	imull	$10922, %eax, %eax	#, D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 0(%rbp)	# D.5923, MEM[base: Fout_126, offset: 0B]
	movswl	2(%rbp), %eax	# MEM[base: Fout_126, offset: 2B], D.5923
	imull	$10922, %eax, %eax	#, D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 2(%rbp)	# D.5923, MEM[base: Fout_126, offset: 2B]
	movswl	(%rdx), %eax	# MEM[base: _976, offset: 0B], D.5923
	imull	$10922, %eax, %eax	#, D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, (%rdx)	# D.5923, MEM[base: _976, offset: 0B]
	movswl	2(%rdx), %eax	# MEM[base: _976, offset: 2B], D.5923
	imull	$10922, %eax, %eax	#, D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	sarl	$15, %eax	#, D.5923
	movw	%ax, 2(%rdx)	# D.5923, MEM[base: _976, offset: 2B]
	movswl	(%r10), %esi	# MEM[base: _969, offset: 0B], D.5923
	movswl	2(%r10), %ecx	# MEM[base: _969, offset: 2B], D.5923
	imull	$10922, %esi, %esi	#, D.5923, D.5923
	imull	$10922, %ecx, %ecx	#, D.5923, D.5923
	addl	$16384, %esi	#, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %esi	#, D.5923
	sarl	$15, %ecx	#, D.5923
	movw	%si, (%r10)	# D.5923, MEM[base: _969, offset: 0B]
	movw	%cx, 2(%r10)	# D.5923, MEM[base: _969, offset: 2B]
	movswl	(%rdx), %r12d	# MEM[base: _976, offset: 0B], D.5923
	movswl	2(%rdx), %r9d	# MEM[base: _976, offset: 2B], D.5923
	movswl	0(%r13,%r14,8), %eax	# MEM[base: tw2_125, index: ivtmp.243_120, step: 8, offset: 0B], D.5923
	movswl	0(%r13,%r14,4), %ebx	# MEM[base: tw2_125, index: ivtmp.243_120, step: 4, offset: 0B], D.5923
	movswl	2(%r13,%r14,4), %r11d	# MEM[base: tw2_125, index: ivtmp.243_120, step: 4, offset: 2B], D.5923
	movswl	2(%r13,%r14,8), %r8d	# MEM[base: tw2_125, index: ivtmp.243_120, step: 8, offset: 2B], D.5923
	movl	%eax, %r15d	# D.5923, D.5923
	movl	%r9d, %edi	# D.5923, D.5923
	movl	%r12d, %eax	# D.5923, D.5923
	imull	%r11d, %edi	# D.5923, D.5923
	movl	%r15d, (%rsp)	# D.5923, %sfp
	imull	%ebx, %eax	# D.5923, D.5923
	subl	%edi, %eax	# D.5923, D.5923
	movl	%r15d, %edi	# D.5923, D.5923
	movl	%ecx, %r15d	# D.5923, D.5923
	imull	%r8d, %r15d	# D.5923, D.5923
	addl	$16384, %eax	#, D.5923
	imull	%esi, %edi	# D.5923, D.5923
	sarl	$15, %eax	#, D.5923
	imull	(%rsp), %ecx	# %sfp, D.5923
	subl	%r15d, %edi	# D.5923, D.5923
	addl	$16384, %edi	#, D.5923
	imull	%r8d, %esi	# D.5923, D.5923
	sarl	$15, %edi	#, D.5923
	imull	%ebx, %r9d	# D.5923, D.5923
	leal	(%rdi,%rax), %r15d	#, D.5926
	movzwl	0(%rbp), %ebx	# MEM[base: Fout_126, offset: 0B], D.5926
	leal	16384(%rsi,%rcx), %ecx	#, D.5923
	movl	%r15d, %esi	# D.5926, D.5927
	imull	%r12d, %r11d	# D.5923, D.5923
	leal	16384(%r11,%r9), %r9d	#, D.5923
	sarl	$15, %r9d	#, D.5923
	sarl	$15, %ecx	#, D.5923
	sarw	%si	# D.5927
	subl	%esi, %ebx	# D.5927, D.5926
	leal	(%rcx,%r9), %r8d	#, D.5926
	subl	%ecx, %r9d	# D.5923, D.5926
	movw	%bx, (%rdx)	# D.5926, MEM[base: _976, offset: 0B]
	movzwl	2(%rbp), %ebx	# MEM[base: Fout_126, offset: 2B], D.5926
	movswl	%r9w, %ecx	# D.5926, D.5923
	movl	%r8d, %esi	# D.5926, D.5927
	subl	%edi, %eax	# D.5923, D.5926
	addq	$1, %r14	#, ivtmp.243
	sarw	%si	# D.5927
	cwtl
	addq	$4, %r10	#, ivtmp.258
	subl	%esi, %ebx	# D.5927, D.5926
	movw	%bx, 2(%rdx)	# D.5926, MEM[base: _976, offset: 2B]
	movl	16(%rsp), %ebx	# %sfp, D.5923
	addw	%r15w, 0(%rbp)	# D.5926, MEM[base: Fout_126, offset: 0B]
	addw	%r8w, 2(%rbp)	# D.5926, MEM[base: Fout_126, offset: 2B]
	addq	$4, %rbp	#, Fout
	imull	%ebx, %ecx	# D.5923, D.5923
	imull	%ebx, %eax	# D.5923, D.5923
	addl	$16384, %ecx	#, D.5923
	sarl	$15, %ecx	#, D.5923
	addl	$16384, %eax	#, D.5923
	movl	%ecx, %esi	# D.5923, D.5926
	addw	(%rdx), %si	# MEM[base: _976, offset: 0B], D.5926
	sarl	$15, %eax	#, D.5923
	movw	%si, -4(%r10)	# D.5926, MEM[base: _969, offset: 0B]
	movzwl	2(%rdx), %esi	# MEM[base: _976, offset: 2B], D.5926
	subl	%eax, %esi	# D.5923, D.5926
	movw	%si, -2(%r10)	# D.5926, MEM[base: _969, offset: 2B]
	subw	%cx, (%rdx)	# D.5923, MEM[base: _976, offset: 0B]
	addw	%ax, 2(%rdx)	# D.5923, MEM[base: _976, offset: 2B]
	addq	$4, %rdx	#, ivtmp.256
	cmpq	%r14, 8(%rsp)	# ivtmp.243, %sfp
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L58	#,
# BLOCK 27 freq:250 seq:25
# PRED: 26 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$120, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 28 freq:250 seq:26
# PRED: 18 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	movl	24(%rsp), %r8d	# %sfp,
	movl	32(%rsp), %ecx	# %sfp,
	addq	$120, %rsp	#,
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdx	# st,
	movq	%rbp, %rdi	# Fout,
	movl	$1, %esi	#,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
	.cfi_endproc
.LFE58:
	.size	kf_work.constprop.1, .-kf_work.constprop.1
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.globl	kiss_fft_alloc
	.type	kiss_fft_alloc, @function
kiss_fft_alloc:
.LFB52:
	.cfi_startproc
# BLOCK 2 freq:501 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%rdi), %eax	#, D.5962
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	cltq
	movl	%edi, %ebx	# nfft, nfft
	leaq	268(,%rax,4), %rdi	#, memneeded
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	testq	%rcx, %rcx	# lenmem
# SUCC: 26 [6.7%]  (CAN_FALLTHRU) 3 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L111	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	testq	%rdx, %rdx	# mem
	movq	%rdx, %rbp	# mem, mem
# SUCC: 4 [85.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [15.0%]  (CAN_FALLTHRU)
	je	.L78	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpq	(%rcx), %rdi	# *lenmem_13(D), memneeded
	movl	$0, %eax	#, tmp215
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmova	%rax, %rbp	# mem,, tmp215, mem
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (CAN_FALLTHRU) 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L78:
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_13(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [100.0%]  (CAN_FALLTHRU)
.L77:
	testq	%rbp, %rbp	# mem
# SUCC: 7 [89.9%]  (FALLTHRU,CAN_FALLTHRU) 23 [10.1%]  (CAN_FALLTHRU)
	je	.L107	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	testl	%ebx, %ebx	# nfft
	movl	%ebx, 0(%rbp)	# nfft, MEM[(struct kiss_fft_state *)mem_2].nfft
	movl	%esi, 4(%rbp)	# inverse_fft, MEM[(struct kiss_fft_state *)mem_2].inverse
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [9.0%]  (CAN_FALLTHRU)
	jle	.L112	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	pxor	%xmm3, %xmm3	# D.5964
	xorl	%r14d, %r14d	# i
	testl	%esi, %esi	# inverse_fft
	movsd	.LC7(%rip), %xmm0	#, tmp157
	leaq	264(%rbp), %r15	#, ivtmp.339
	movsd	.LC9(%rip), %xmm4	#, tmp212
	leaq	40(%rsp), %r13	#, tmp214
	cvtsi2sd	%ebx, %xmm3	# nfft, D.5964
	leaq	32(%rsp), %r12	#, tmp210
	movsd	%xmm4, 8(%rsp)	# tmp212, %sfp
	movsd	.LC10(%rip), %xmm4	#, tmp208
	movsd	%xmm4, (%rsp)	# tmp208, %sfp
	divsd	%xmm3, %xmm0	# D.5964, D.5964
	movsd	%xmm3, 24(%rsp)	# D.5964, %sfp
	mulsd	.LC8(%rip), %xmm0	#, D.5964
	movsd	%xmm0, 16(%rsp)	# D.5964, %sfp
# SUCC: 9 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 19 [50.0%]  (CAN_FALLTHRU)
	jne	.L90	#,
# BLOCK 9 freq:2278 seq:7
# PRED: 8 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L86:
	pxor	%xmm0, %xmm0	# D.5964
	movq	%r12, %rsi	# tmp210,
	movq	%r13, %rdi	# tmp214,
	cvtsi2sd	%r14d, %xmm0	# i, D.5964
	mulsd	16(%rsp), %xmm0	# %sfp, phase
	call	sincos@PLT	#
	movsd	32(%rsp), %xmm1	#, D.5964
	movsd	8(%rsp), %xmm3	# %sfp, tmp212
	movsd	(%rsp), %xmm5	# %sfp, tmp208
	mulsd	%xmm3, %xmm1	# tmp212, D.5964
	pxor	%xmm2, %xmm2	# tmp170
	movsd	40(%rsp), %xmm0	#, D.5961
	addsd	%xmm5, %xmm1	# tmp208, D.5964
	mulsd	%xmm3, %xmm0	# tmp212, D.5964
	cvttsd2si	%xmm1, %eax	# D.5964, tmp169
	addsd	%xmm5, %xmm0	# tmp208, D.5964
	cvtsi2sd	%eax, %xmm2	# tmp169, tmp170
	leal	-1(%rax), %edx	#, tmp220
	comisd	%xmm1, %xmm2	# D.5964, tmp170
	pxor	%xmm1, %xmm1	# tmp178
	cmova	%edx, %eax	# tmp169,, tmp220, tmp169
	movw	%ax, (%r15)	# tmp169, MEM[base: _88, offset: 0B]
	cvttsd2si	%xmm0, %eax	# D.5964, tmp177
	cvtsi2sd	%eax, %xmm1	# tmp177, tmp178
	leal	-1(%rax), %edx	#, tmp222
	comisd	%xmm0, %xmm1	# D.5964, tmp178
	cmova	%edx, %eax	# tmp177,, tmp222, tmp177
	addl	$1, %r14d	#, i
	addq	$4, %r15	#, ivtmp.339
	movw	%ax, -2(%r15)	# tmp177, MEM[base: _88, offset: 2B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L86	#,
# BLOCK 10 freq:451 seq:8
# PRED: 20 [100.0%]  (CAN_FALLTHRU) 9 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [100.0%]  (CAN_FALLTHRU)
.L87:
	movsd	.LC6(%rip), %xmm0	#, tmp154
	sqrtsd	24(%rsp), %xmm1	# %sfp, D.5964
	leaq	8(%rbp), %rsi	#, facbuf
	movsd	.LC5(%rip), %xmm2	#, tmp150
	andpd	%xmm1, %xmm0	# D.5964, tmp152
	comisd	%xmm0, %xmm2	# tmp152, tmp150
# SUCC: 11 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [50.0%]  (CAN_FALLTHRU)
	ja	.L113	#,
# BLOCK 11 freq:452 seq:9
# PRED: 10 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [100.0%]  (CAN_FALLTHRU)
.L81:
	movl	$4, %ecx	#, nfft
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 12 freq:5450 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 18 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L82:
	movl	%ebx, %eax	# nfft, tmp205
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.5962
# SUCC: 15 [50.0%]  (CAN_FALLTHRU) 13 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L96	#,
# BLOCK 13 freq:5000 seq:11
# PRED: 12 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [50.0%]  (CAN_FALLTHRU)
.L114:
	movl	%eax, %ebx	# tmp205, nfft
	movl	%ecx, (%rsi)	# nfft, *facbuf_54
	leaq	8(%rsi), %rax	#, facbuf
	cmpl	$1, %ebx	#, nfft
	movl	%ebx, 4(%rsi)	# nfft, MEM[(int *)facbuf_54 + 4B]
# SUCC: 14 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L107	#,
# BLOCK 14 freq:4550 seq:12
# PRED: 13 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %rsi	# facbuf, facbuf
	movl	%ebx, %eax	# nfft, tmp205
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.5962
# SUCC: 15 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [50.0%]  (CAN_FALLTHRU)
	je	.L114	#,
# BLOCK 15 freq:5000 seq:13
# PRED: 12 [50.0%]  (CAN_FALLTHRU) 14 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
.L96:
	cmpl	$2, %ecx	#, nfft
# SUCC: 21 [33.3%]  (CAN_FALLTHRU) 16 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L92	#,
# BLOCK 16 freq:3334 seq:14
# PRED: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %ecx	#, nfft
# SUCC: 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 22 [50.0%]  (CAN_FALLTHRU)
	jne	.L115	#,
# BLOCK 17 freq:1667 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	.LC3(%rip), %xmm0	#, D.5964
# SUCC: 18 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$2, %ecx	#, nfft
# BLOCK 18 freq:4999 seq:16
# PRED: 17 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 21 [100.0%]  (CAN_FALLTHRU) 22 [100.0%]  (CAN_FALLTHRU)
.L93:
	comisd	%xmm1, %xmm0	# D.5964, D.5964
	cmova	%ebx, %ecx	# nfft,, nfft, nfft
# SUCC: 12 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L82	#
# BLOCK 19 freq:2278 seq:17
# PRED: 8 [50.0%]  (CAN_FALLTHRU) 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L90:
	pxor	%xmm0, %xmm0	# D.5964
	movq	%r12, %rsi	# tmp210,
	movq	%r13, %rdi	# tmp214,
	cvtsi2sd	%r14d, %xmm0	# i, D.5964
	mulsd	16(%rsp), %xmm0	# %sfp, phase
	xorpd	.LC11(%rip), %xmm0	#, phase
	call	sincos@PLT	#
	movsd	32(%rsp), %xmm1	#, D.5964
	movsd	8(%rsp), %xmm4	# %sfp, tmp212
	movsd	(%rsp), %xmm6	# %sfp, tmp208
	mulsd	%xmm4, %xmm1	# tmp212, D.5964
	pxor	%xmm2, %xmm2	# tmp193
	movsd	40(%rsp), %xmm0	#, D.5961
	addsd	%xmm6, %xmm1	# tmp208, D.5964
	mulsd	%xmm4, %xmm0	# tmp212, D.5964
	cvttsd2si	%xmm1, %eax	# D.5964, tmp192
	addsd	%xmm6, %xmm0	# tmp208, D.5964
	cvtsi2sd	%eax, %xmm2	# tmp192, tmp193
	leal	-1(%rax), %edx	#, tmp221
	comisd	%xmm1, %xmm2	# D.5964, tmp193
	pxor	%xmm1, %xmm1	# tmp201
	cmova	%edx, %eax	# tmp192,, tmp221, tmp192
	movw	%ax, (%r15)	# tmp192, MEM[base: _81, offset: 0B]
	cvttsd2si	%xmm0, %eax	# D.5964, tmp200
	cvtsi2sd	%eax, %xmm1	# tmp200, tmp201
	leal	-1(%rax), %edx	#, tmp223
	comisd	%xmm0, %xmm1	# D.5964, tmp201
	cmova	%edx, %eax	# tmp200,, tmp223, tmp200
	addl	$1, %r14d	#, i
	addq	$4, %r15	#, ivtmp.346
	movw	%ax, -2(%r15)	# tmp200, MEM[base: _81, offset: 2B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 20 [9.0%]  (FALLTHRU)
	jne	.L90	#,
# BLOCK 20 freq:205 seq:18
# PRED: 19 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L87	#
# BLOCK 21 freq:1667 seq:19
# PRED: 15 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L92:
	movsd	.LC4(%rip), %xmm0	#, D.5964
	movl	$3, %ecx	#, nfft
# SUCC: 18 [100.0%]  (CAN_FALLTHRU)
	jmp	.L93	#
# BLOCK 22 freq:1666 seq:20
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L115:
	pxor	%xmm0, %xmm0	# D.5964
	addl	$2, %ecx	#, nfft
	cvtsi2sd	%ecx, %xmm0	# nfft, D.5964
# SUCC: 18 [100.0%]  (CAN_FALLTHRU)
	jmp	.L93	#
# BLOCK 23 freq:501 seq:21
# PRED: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 6 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L107:
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax	# mem,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 24 freq:226 seq:22
# PRED: 10 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L113:
	.cfi_restore_state
	cvttsd2siq	%xmm1, %rax	# D.5964, tmp155
	pxor	%xmm1, %xmm1	# D.5964
	cvtsi2sdq	%rax, %xmm1	# tmp155, D.5964
# SUCC: 11 [100.0%]  (CAN_FALLTHRU)
	jmp	.L81	#
# BLOCK 25 freq:41 seq:23
# PRED: 7 [9.0%]  (CAN_FALLTHRU)
.L112:
	pxor	%xmm7, %xmm7	# D.5964
	cvtsi2sd	%ebx, %xmm7	# nfft, D.5964
	movsd	%xmm7, 24(%rsp)	# D.5964, %sfp
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L87	#
# BLOCK 26 freq:34 seq:24
# PRED: 2 [6.7%]  (CAN_FALLTHRU)
.L111:
	movl	%esi, (%rsp)	# inverse_fft, %sfp
	call	malloc@PLT	#
	movl	(%rsp), %esi	# %sfp, inverse_fft
	movq	%rax, %rbp	#, mem
# SUCC: 6 [100.0%]  (CAN_FALLTHRU)
	jmp	.L77	#
	.cfi_endproc
.LFE52:
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.globl	kiss_fft_stride
	.type	kiss_fft_stride, @function
kiss_fft_stride:
.LFB53:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movq	%rdi, %r8	# st, st
	movq	%rdx, %rdi	# fout, fout
	movl	%ecx, %edx	# in_stride, in_stride
	cmpq	%rdi, %rsi	# fout, fin
# SUCC: 4 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L119	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%r8), %rcx	#, D.5985
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_work.constprop.1	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L119:
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%ecx, %r12d	# in_stride, in_stride
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rbx	# st, st
	movq	%rsi, %rbp	# fin, fin
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	movslq	(%r8), %rdi	# st_4(D)->nfft, D.5987
	salq	$2, %rdi	#, D.5987
	call	malloc@PLT	#
	leaq	8(%rbx), %rcx	#, D.5985
	movq	%rbx, %r8	# st,
	movl	%r12d, %edx	# in_stride,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp99,
	movq	%rax, %r13	#, tmp99
	call	kf_work.constprop.1	#
	movslq	(%rbx), %rdx	# st_4(D)->nfft, D.5987
	movq	%rbp, %rdi	# fin,
	movq	%r13, %rsi	# tmp99,
	salq	$2, %rdx	#, D.5987
	call	memcpy@PLT	#
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	movq	%r13, %rdi	# tmp99,
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free@PLT	#
	.cfi_endproc
.LFE53:
	.size	kiss_fft_stride, .-kiss_fft_stride
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	kiss_fft
	.type	kiss_fft, @function
kiss_fft:
.LFB54:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movl	$1, %ecx	#,
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kiss_fft_stride@PLT	#
	.cfi_endproc
.LFE54:
	.size	kiss_fft, .-kiss_fft
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	kiss_fft_cleanup
	.type	kiss_fft_cleanup, @function
kiss_fft_cleanup:
.LFB55:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
# SUCC: EXIT [100.0%] 
	rep ret
	.cfi_endproc
.LFE55:
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	kiss_fft_next_fast_size
	.type	kiss_fft_next_fast_size, @function
kiss_fft_next_fast_size:
.LFB56:
	.cfi_startproc
# BLOCK 2 freq:81 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movl	$1431655766, %r8d	#, tmp150
# SUCC: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$1717986919, %esi	#, tmp151
# BLOCK 3 freq:900 seq:1
# PRED: 2 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L130:
	testb	$1, %dil	#, n
	movl	%edi, %ecx	# n, n
# SUCC: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [9.0%]  (CAN_FALLTHRU)
	jne	.L123	#,
# BLOCK 4 freq:9100 seq:2
# PRED: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L124:
	movl	%ecx, %edx	# n, tmp100
	shrl	$31, %edx	#, tmp100
	addl	%edx, %ecx	# tmp100, tmp101
	sarl	%ecx	# n
	testb	$1, %cl	#, n
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU)
	je	.L124	#,
# BLOCK 5 freq:819 seq:3
# PRED: 4 [9.0%]  (FALLTHRU)
# SUCC: 7 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L123	#
# BLOCK 6 freq:9100 seq:4
# PRED: 7 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L138:
	movl	%ecx, %eax	# n, tmp153
	sarl	$31, %ecx	#, tmp115
	imull	%r8d	# tmp150
	subl	%ecx, %edx	# tmp115, n
# SUCC: 7 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 7 freq:10000 seq:5
# PRED: 3 [9.0%]  (CAN_FALLTHRU) 6 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L123:
	movl	%ecx, %eax	# n, tmp152
	imull	%r8d	# tmp150
	movl	%ecx, %eax	# n, tmp107
	sarl	$31, %eax	#, tmp107
	subl	%eax, %edx	# tmp107, tmp104
	leal	(%rdx,%rdx,2), %eax	#, tmp110
	cmpl	%eax, %ecx	# tmp110, n
# SUCC: 6 [91.0%]  (CAN_FALLTHRU) 8 [9.0%]  (FALLTHRU)
	je	.L138	#,
# BLOCK 8 freq:900 seq:6
# PRED: 7 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L125	#
# BLOCK 9 freq:9100 seq:7
# PRED: 10 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L139:
	movl	%ecx, %eax	# n, tmp156
	sarl	$31, %ecx	#, tmp137
	imull	%esi	# tmp151
	sarl	%edx	# tmp136
	subl	%ecx, %edx	# tmp137, n
# SUCC: 10 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 10 freq:10000 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 8 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L125:
	movl	%ecx, %eax	# n, tmp155
	imull	%esi	# tmp151
	movl	%ecx, %eax	# n, tmp128
	sarl	$31, %eax	#, tmp128
	sarl	%edx	# tmp127
	subl	%eax, %edx	# tmp128, tmp124
	leal	(%rdx,%rdx,4), %eax	#, tmp131
	cmpl	%eax, %ecx	# tmp131, n
# SUCC: 9 [91.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L139	#,
# BLOCK 11 freq:900 seq:9
# PRED: 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$1, %ecx	#, n
# SUCC: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 12 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	jle	.L129	#,
# BLOCK 12 freq:819 seq:10
# PRED: 11 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$1, %edi	#, n
# SUCC: 3 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L130	#
# BLOCK 13 freq:81 seq:11
# PRED: 11 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L129:
	movl	%edi, %eax	# n,
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE56:
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1074266112
	.align 8
.LC5:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	1072693248
	.align 8
.LC8:
	.long	1413754136
	.long	-1072094725
	.align 8
.LC9:
	.long	0
	.long	1088421824
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.section	.rodata.cst16
	.align 16
.LC11:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
