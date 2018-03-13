.data
	in1: 	.word 1
	in2: 	.word 2
	in3: 	.float 1.5
	in4: 	.float 4.0
	in5: 	.float 2.0
	in6: 	.float -2.0
	cpmuls: .float 6.0
	cpadds: .float 5.5
	cpsubs: .float 2.5
	estate: .word  0
.text
li $s7,0
li $s6,0
li $sp,0x10011ffc

j main
nop
nop

acertor:	li $v0,1
	jr $ra
	nop
	nop

error: 	li $v0,-1
	jr $ra
	nop
	nop

	
soma: 	
	lw $t0,in1
	lw $t1,in2
	li $t2,3
	li $a0,1
	add $t0,$t0,$t1
	nop
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

		
multiplicacao:



	lw $t0,in1
	lw $t1,in2
	li $t2,2
	li $a0,2
	
	mult $t0,$t1
	nop
	nop
	mflo $t0
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
subtracao:	

	lw $t0,in1
	lw $t1,in2
	li $t2,-1
	li $a0,3
	
	sub $t0,$t0,$t1
	nop
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_and:
	lw $t0,in1
	lw $t1,in2
	li $t2,0
	li $a0,4
	
	and $t0,$t0,$t1
	nop
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_or:	
	
	lw $t0,in1
	lw $t1,in2
	li $t2,3
	
	or $t0,$t0,$t1
	nop
	nop
	nop
	li $a0,5
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
mfhi_mflo:	
	addi $sp,$sp,-4
	lw $t0,in1
	lw $t1,in2

	li $t2,2
	sw $ra,0($sp)
	mult $t0,$t1
	li $a0,6
	nop
	nop
	mflo $t0	
	
	bne $t0,$t2,mfhi_mflo_chama_error
	nop
	nop
	nop

	j try	
	nop
	nop

	
	mfhi_mflo_chama_error: j error
	nop
	nop

	try:
	jal acertor
	nop
	nop

	lw $ra,0($sp)		# sem hazard, pois nao altera sp
	move $t2,$zero
	mfhi $t0
	li $a0,7
	addi $sp,$sp,4
	
	#sw $zero,0($zero)
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_sll:
	lw $t0,in1
	lw $t1,in2
	li $t2,4
	li $a0,8
	
	sll $t0,$t0,2
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_srl:
	lw $t0,in2
	li $t2,1
	li $a0,9
	nop
	srl $t0,$t0,1
	nop
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_slt:
	lw $t0,in1
	li $t1,-1
	li $t2,0
	slt $t0,$t0,$t1
	nop
	nop
	nop
	li $a0,10
	nop	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra
	nop
	nop

op_sgt:
	lw $t0,in1
	lw $t1,in2
	li $t2,1
	li $a0,11
	nop
	sgt $t0,$t1,$t0
	nop
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_sra:
	li $t0,32
	li $t2,8
	li $a0,12
	nop
	sra $t0,$t0,2
	nop
	nop
	nop
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_srav:
	li $t0,32
	li $t1,2
	li $t2,8
	li $a0,13
	
	srav $t0,$t0,$t1
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_sllv:
	li $t0,2
	li $t1,2
	li $t2,8
	li $a0,14
	
	sllv $t0,$t0,$t1
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_srlv:
	li $t0,32
	li $t1,1
	li $t2,16
	li $a0,15
	
	srlv $t0,$t0,$t1
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_xor:
	li $t0,2
	li $t1,3
	li $t2,1
	li $a0,16
	
	xor $t0,$t0,$t1
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_nor:
	li $t0,0
	li $t1,0
	li $t2,-1
	li $a0,17
	
	nor $t0,$t0,$t1
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_sltu:
	lw $t0,in1
	li $t1,-1
	li $t2,1
	li $a0,18
	
	sltu $t0,$t0,$t1
	nop
	nop
	nop
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra			
	nop
	nop

	
op_lui:
	lui $t0,0xFFFF
	la $t2,0xFFFF0000
	li $a0,19	
	
	bne $t0,$t2,error
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_div:
	addi $sp,$sp,-4
	sw $ra,0($sp)

	li $t0,31
	li $t1,2
	li $t2,15
	li $a0,20
		
	div $t0,$t1
	mflo $t0
	
	bne $t0,$t2,error	
	nop
	nop
	nop

	jal acertor
	nop
	nop

	
	li $t0,0
	sw $zero,0($zero)
	
	mfhi $t0
	li $t2,1
	li $a0,21
	bne $t0,$t2,error
	nop
	nop
	nop

	
	lw $ra,0($sp)
	addi $sp,$sp,4
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_mthi_mtlo:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	li $t0,2
	li $a0,22
	li $t2,2
	
	mthi $t0
	mfhi $t1
	
	bne $t1,$t2,chamaerror
	nop
	nop
	nop

	jal acertor
	nop
	nop

	j try2
	nop
	nop

	chamaerror: j error
	nop
	nop

	li $t0,0
	try2:
	lw $ra,0($sp)
	nop	
	addi $sp,$sp,4
	
	sw $zero,0($zero)
	li $a0,23
	mtlo $t0
	mflo $t1
	
	bne $t1,$t0,error 			#	?????? era $t1, $t2
	nop
	nop
	nop

	j acertor
	nop
	nop

	jr $ra	
	nop
	nop

	
op_muls: 
	l.s $f0,in3																																																					
	l.s $f1,in4	
	l.s $f2,cpmuls		#f2 = 6
	li $a0,24
	
	mul.s $f0,$f0,$f1
	
	c.eq.s $f0,$f2
	bc1f error
	j acertor
	nop
	nop

	
	jr $ra	
	nop
	nop

	
op_adds:
	l.s $f0,in3																																																					
	l.s $f1,in4	
	l.s $f2,cpadds	
	li $a0,25
	
	add.s $f0,$f0,$f1
	
	c.eq.s $f0,$f2
	bc1f error
	j acertor
	nop
	nop

	
	jr $ra			
	nop
	nop


op_subs:
	l.s $f0,in3
	l.s $f1,in4
	l.s $f2,cpsubs
	li $a0,26
	
	sub.s $f0,$f1,$f0
	
	c.eq.s $f0,$f2
	bc1f error
	j acertor
	nop
	nop

	
	jr $ra
	nop
	nop


op_divs:
	l.s $f0,in5
	l.s $f1,in4
	li $a0,27
	
	div.s $f1,$f1,$f0
	
	c.eq.s $f0,$f1
	bc1f error
	j acertor
	nop
	nop

	
	jr $ra
	nop
	nop


op_sqrt:
	l.s $f0,in5
	l.s $f1,in4
	li $a0,28
	
	sqrt.s $f1,$f1
	
	c.eq.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	
	jr $ra
	nop
	nop


op_abs:
	l.s $f0,in5
	l.s $f1,in6
	li $a0,29
	
	abs.s $f1,$f1
	
	c.eq.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_neg:
	l.s $f0,in5
	l.s $f1,in6
	li $a0,30
	
	neg.s $f0,$f0
	
	c.eq.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_ceq:
	l.s $f0,in5
	l.s $f1,in5
	li $a0,31

	c.eq.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_clt:
	l.s $f0,in4
	l.s $f1,in5
	li $a0,32

	c.lt.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	jr $ra
	nop
	nop


op_cle:
	l.s $f0,in4
	l.s $f1,in5
	li $a0,33

	c.le.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
op_cvtsw:
	l.s $f0,in5
	lw $t0,in2
	cvt.w.s $f1,$f0
	mfc1 $t1,$f1
	li $a0,34

	beq $t1,$t0,sai
	j error 
	nop
	nop

sai:
	j acertor
	nop
	nop

	jr $ra
	nop
	nop


op_cvtws:
	lw $t0,in2
	mtc1 $t0,$f1
	cvt.s.w $f1,$f1
	l.s $f0,in5
	li $a0,35

	c.eq.s $f1,$f0
	bc1f error
	j acertor
	nop
	nop

	jr $ra
	nop
	nop

	
		
main: 
	#ULA			#codigo de erro
	jal soma 		#1
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal multiplicacao 	#2
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal subtracao 		#3
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_and		#4
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_or		#5
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal mfhi_mflo		#6/7
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	#jal op_sll		#8
	nop
	nop

	li $t0,0
	#sw $zero,0($t0)
	#jal op_srl		#9
	nop
	nop

	li $t0,0
	#sw $zero,0($t0)
	jal op_slt		#10
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_sgt		#11
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	#jal op_sra		#12
	nop
	nop

	li $t0,0
	#sw $zero,0($t0)
	jal op_srav		#13
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_sllv		#14
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_srlv		#15
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_xor		#16
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_nor		#17	
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_sltu		#18
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_lui		#19
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_div		#20/21
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_mthi_mtlo	#22/23
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	
	#FPULA
	jal op_muls		#24
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_adds		#25
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_subs		#26
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_divs		#27
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_sqrt		#28
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_abs		#29
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_neg		#30
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_ceq		#31
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_clt		#32
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_cle		#33
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_cvtsw		#34
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
	jal op_cvtws		#35
	nop
	nop

	li $t0,0
	sw $zero,0($t0)
