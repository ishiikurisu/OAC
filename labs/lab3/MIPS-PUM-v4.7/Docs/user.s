.data
	DADO: .word 0x0F
.text
	li $t0,0
	la $s0,DADO
	lw $t1,0($s0)
LOOP:	beq $t0,$t1,FIM
	addi $t0,$t0,1
	j LOOP
FIM:	li $t0,0xF0CAF0FA
FIM1:	j FIM1