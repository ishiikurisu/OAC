.text

	la $s0,0xFFFF0500  	#IRDA_CONTROL_ADDRESS
	la $s1,0xFFFF0504	#IRDA_READ_ADDRESS
	la $s2,0xFFFF0508 	#IRDA_WRITE_ADDRESS

LOOP:	lw $a0,0($s0)
	bne $a0, $zero, LOOP 
	li $a1, 0xFF0000FF
	li $a2, 0x00000001
	sw $a1, 0($s2)
	sw $a2, 0($s0)
	
	lw $s3, 0($s1)
	j LOOP
