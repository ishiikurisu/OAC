	.file	1 "sortc.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	oddspreg
.LC0:
	.text
	.globl	show
	.set	nomips16
	.set	nomicromips
	.ent	show
show:
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$5,.L11
	nop

	la	$19, .LCO
	sw	$17,24($sp)
	move	$17,$0
	sw	$18,28($sp)
	sw	$16,20($sp)
	move	$18,$5
	sw	$31,36($sp)
	move	$16,$4
.L3:
	lw	$5,0($16)
	addiu	$17,$17,1
	move	$4,$19
	jal	printf
	addiu	$16,$16,4

	bne	$18,$17,.L3
	lw	$31,36($sp)

	li	$4,10			# 0xa
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	j	putchar
	addiu	$sp,$sp,40

.L11:
	j	putchar
	li	$4,10			# 0xa

	.set	macro
	.set	reorder
	.end	show
	.size	show, .-show
	.globl	swap
	.set	nomips16
	.set	nomicromips
	.ent	swap
swap:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$5,$5,2
	addiu	$2,$5,4
	addu	$5,$4,$5
	addu	$4,$4,$2
	lw	$2,0($5)
	lw	$3,0($4)
	sw	$3,0($5)
	jr	$31
	sw	$2,0($4)

	.set	macro
	.set	reorder
	.end	swap
	.size	swap, .-swap
	.globl	sort
	.set	nomips16
	.set	nomicromips
	.ent	sort
sort:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$5,.L28
	move	$10,$0

	addiu	$12,$5,-1
	li	$9,-1			# 0xffffffffffffffff
	beq	$10,$12,.L28
	move	$3,$10

.L19:
	bltz	$10,.L27
	addiu	$11,$4,4

	lw	$5,0($4)
	lw	$6,4($4)
	slt	$2,$6,$5
	beq	$2,$0,.L24
	nop

	move	$2,$4
	b	.L18
	move	$7,$11

.L25:
	lw	$5,-4($2)
	addiu	$7,$7,-4
	lw	$6,0($2)
	slt	$8,$6,$5
	beq	$8,$0,.L17
	addiu	$2,$2,-4

.L18:
	addiu	$3,$3,-1
	sw	$6,0($4)
	sw	$5,0($7)
	bne	$3,$9,.L25
	addiu	$4,$4,-4

.L17:
	addiu	$10,$10,1
	move	$4,$11
.L26:
	bne	$10,$12,.L19
	move	$3,$10

.L28:
	jr	$31
	nop

.L24:
.L27:
	addiu	$10,$10,1
	b	.L26
	move	$4,$11

	.set	macro
	.set	reorder
	.end	sort
	.size	sort, .-sort
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
main:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	li	$5,10			# 0xa
	sw	$16,16($sp)
	la	$16, v
	sw	$31,20($sp)
	jal	show

	jal	sort
	li	$5,10			# 0xa

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
