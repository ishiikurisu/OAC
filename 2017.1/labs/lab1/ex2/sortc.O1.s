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
	sw	$31,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	blez	$5,.L2
	sw	$16,20($sp)

	move	$19,$5
	move	$16,$4
	move	$17,$0
	lui	$18,%hi(.LC0)
	addiu	$18,$18,%lo(.LC0)
.L3:
	lw	$5,0($16)
	jal	printf
	move	$4,$18

	addiu	$17,$17,1
	bne	$19,$17,.L3
	addiu	$16,$16,4

.L2:
	jal	putchar
	li	$4,10			# 0xa

	lw	$31,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	j	$31
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
	lw	$3,0($2)
	addiu	$5,$5,4
	addu	$4,$4,$5
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
	.frame	$sp,48,$31		# vars= 0, regs= 8/0, args= 16, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$5,.L16
	nop

	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$22,40($sp)
	sw	$21,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$18,$4
	move	$20,$4
	addiu	$22,$5,-1
	move	$21,$0
	b	.L9
	li	$19,-1			# 0xffffffffffffffff

.L12:
	bltz	$16,.L10
	nop

	lw	$2,0($20)
	lw	$3,4($20)
	slt	$2,$3,$2
	beq	$2,$0,.L10
	move	$5,$16

	move	$17,$20
.L17:
	jal	swap
	move	$4,$18

	addiu	$16,$16,-1
	beq	$16,$19,.L10
	nop

	lw	$2,-4($17)
	addiu	$17,$17,-4
	lw	$3,4($17)
	slt	$2,$3,$2
	bne	$2,$0,.L17
	move	$5,$16

.L10:
	addiu	$21,$21,1
	addiu	$20,$20,4
.L9:
	bne	$22,$21,.L12
	move	$16,$21

	lw	$31,44($sp)
	lw	$22,40($sp)
	lw	$21,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	addiu	$sp,$sp,48
.L16:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	sort
	.size	sort, .-sort
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
	sw	$31,20($sp)
	sw	$16,16($sp)
	li	$5,10			# 0xa
	lui	$16,%hi(v)
	jal	show
	addiu	$4,$16,%lo(v)

	li	$5,10			# 0xa
	jal	sort
	addiu	$4,$16,%lo(v)

	li	$5,10			# 0xa
	jal	show
	addiu	$4,$16,%lo(v)

	lw	$31,20($sp)
	lw	$16,16($sp)
	j	$31
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
