	.file	1 "teste8.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.gnu_attribute 4, 1
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.ascii	"Digite um numero:\000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.align	2
.LC2:
	.ascii	"Fora dos Limites\000"
	.align	2
.LC3:
	.ascii	"Dentro dos Limites\000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,32,$31		# vars= 8, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$4,%hi(.LC0)
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	jal	printf
	addiu	$4,$4,%lo(.LC0)

	lui	$4,%hi(.LC1)
	addiu	$4,$4,%lo(.LC1)
	jal	scanf
	addiu	$5,$sp,16

	lbu	$2,16($sp)
	sltu	$2,$2,100
	bnel	$2,$0,.L2
	lui	$4,%hi(.LC3)

	lui	$4,%hi(.LC2)
	j	.L5
	addiu	$4,$4,%lo(.LC2)

.L2:
	addiu	$4,$4,%lo(.LC3)
.L5:
	jal	puts
	nop

	lw	$31,28($sp)
	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Sourcery CodeBench Lite 2013.11-37) 4.8.1"
