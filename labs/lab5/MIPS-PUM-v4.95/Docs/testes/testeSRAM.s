# ####################################### #
# #  Teste da interface SRAM  		# #
# #   Enderecos de Acesso:		# #
# #   SRAM: 0x10012000 a 0x10211FFF 	# #
# ####################################### #
# Obs.: N�o funciona no Mars nem na Waveform pois n�o tem SRAM

.text
BYTE:	la $s0, 0x10012000  # Primeiro endereco
	la $s1, 0x10211FFF
	la $t0, 0x00000012
loop1:	sb $t0,0($s0)
	lb $t1,0($s0)
	lbu $t2,0($s0)
	bne $t0,$t1,ERRO
	bne $t0,$t2,ERRO
	addi $s0,$s0,1
	bne $s1,$s0,loop1

HALF: 	la $s0, 0x10012000  # Primeiro endereco
	la $s1, 0x10211FFE  #ultimo endereco
	la $t0, 0x00001234
loop2:	sh $t0,0($s0)
	lh $t1,0($s0)
	lhu $t2,0($s0)
	bne $t0,$t1,ERRO
	bne $t0,$t2,ERRO
	addi $s0,$s0,2
	bne $s1,$s0,loop2

WORD: 	la $s0, 0x10012000  # Primeiro endereco
	la $s1, 0x10211FFC  #ultimo endereco
	la $t0, 0x12345678
loop3:	sw $t0,0($s0)
	lw $t1,0($s0)
	bne $t0,$t1,ERRO
	addi $s0,$s0,4
	bne $s1,$s0,loop3
	
OK:	la $t8,0xCCCCCCCC
	j fim
ERRO:   la $t8,0xEEEEEEEE
fim:	j fim
