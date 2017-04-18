	.file	1 "teste3.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.gnu_attribute 4, 1
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	j	$31
	lwc1	$f0,%gp_rel(.LC0)($28)

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.section	.sdata,"aw",@progbits
	.align	2
.LC0:
	.word	1081081856
	.ident	"GCC: (Sourcery CodeBench Lite 2013.11-37) 4.8.1"
