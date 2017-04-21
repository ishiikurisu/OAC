	.file	1 "sortc.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	oddspreg
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.ascii	"%d\011\000"
	.text
	.align	2
	.globl	show
	.set	nomips16
	.set	nomicromips
	.ent	show
	.type	show, @function
show:
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$18,28($sp)
	lui	$18,%hi(.LC0)
	sw	$16,20($sp)
	move	$16,$0
	addiu	$18,$18,%lo(.LC0)
	sw	$19,32($sp)
	sw	$17,24($sp)
	move	$19,$5
	sw	$31,36($sp)
	move	$17,$4
	slt	$2,$16,$19
.L7:
	beq	$2,$0,.L6
	move	$4,$18

	lw	$5,0($17)
	addiu	$16,$16,1
	jal	printf
	addiu	$17,$17,4

	b	.L7
	slt	$2,$16,$19

.L6:
	lw	$31,36($sp)
	li	$4,10			# 0xa
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	j	putchar
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	show
	.size	show, .-show
	.align	2
	.globl	swap
	.set	nomips16
	.set	nomicromips
	.ent	swap
	.type	swap, @function
swap:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$5,$5,2
	addu	$2,$4,$5
	addiu	$5,$5,4
	addu	$4,$4,$5
	lw	$3,0($2)
	lw	$5,0($4)
	sw	$5,0($2)
	j	$31
	sw	$3,0($4)

	.set	macro
	.set	reorder
	.end	swap
	.size	swap, .-swap
	.align	2
	.globl	sort
	.set	nomips16
	.set	nomicromips
	.ent	sort
	.type	sort, @function
sort:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	move	$7,$0
	sw	$31,20($sp)
	move	$9,$4
	move	$10,$5
.L10:
	slt	$2,$7,$10
	beq	$2,$0,.L16
	sll	$6,$7,2

	addiu	$8,$7,-1
	addu	$6,$9,$6
.L11:
	bltzl	$8,.L10
	addiu	$7,$7,1

	lw	$2,-4($6)
	addiu	$6,$6,-4
	lw	$3,4($6)
	slt	$2,$3,$2
	beq	$2,$0,.L12
	move	$5,$8

	jal	swap
	move	$4,$9

	b	.L11
	addiu	$8,$8,-1

.L12:
	b	.L10
	addiu	$7,$7,1

.L16:
	lw	$31,20($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	sort
	.size	sort, .-sort
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	li	$5,10			# 0xa
	sw	$16,16($sp)
	lui	$16,%hi(v)
	sw	$31,20($sp)
	jal	show
	addiu	$4,$16,%lo(v)

	addiu	$4,$16,%lo(v)
	jal	sort
	li	$5,10			# 0xa

	addiu	$4,$16,%lo(v)
	lw	$31,20($sp)
	li	$5,10			# 0xa
	lw	$16,16($sp)
	j	show
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.globl	v
	.data
	.align	2
	.type	v, @object
	.size	v, 40
v:
	.word	5
	.word	8
	.word	3
	.word	4
	.word	7
	.word	6
	.word	8
	.word	0
	.word	1
	.word	9
	.ident	"GCC: (Sourcery CodeBench Lite 2016.05-7) 5.3.0"
