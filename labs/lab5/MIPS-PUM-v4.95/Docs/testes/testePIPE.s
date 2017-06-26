# Teste para verificacao da simulacao por forma de onda no Quartus-II
# onde colocar nops para corrigir O hazard ?
.data
	NUM: .word 5
.text
INICIO:	ori $t0,$zero,1		
	add $t0,$t0,$t0		# hazard de dado $t0
	add $t0,$t0,-1		# hazard de dado $t0
	beq $t0,$zero,ERRO	# hazard de dado $t0 e controle
	la $t1,NUM		# hazard de dado $at
	lw $t0,0($t1)		# hazard de dado $t1
	add $t0,$t0,$t0		# hazard de dado $t0
	sw $t0,4($t1)		# hazard de dado $t0
	lw $t0,4($t1)		# hazard de dado ???
	bne $t0,0xA,ERRO	# hazard de dado $at e controle
	lui $t0,0xCCCC
#FIM: 	j FIM			# hazard de controle
ERRO:	lui $t0,0xEEEE
#FIM1:	j FIM1			# hazard de controle
	lui $t0,0x0000	

