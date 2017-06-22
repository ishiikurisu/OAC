# Universidade de Brasilia
# Instituto de Ciencias Exatas
# Departamento de Ciencia da Computacao
# Introdu��o a Sistemas Computacionais � 1/2016
# Aluno(a): Jo�o Victor Bohrer Munhoz - Arthur da Silveira Couto - Caio Albuquerque Brand�o
# Matricula: 16/0071101 - 16/0002575 - 16/0003636

.data
INICIO: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0,60,61,62,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 AUX:  .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0,60,61,62,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 
 HP: .byte 3
 
 DIFFIC: .byte 2
 
 SCORE: .byte 0,0,0,0,0
  
 .text
# Leitura do teclado e echo na tela
#la $t1,0xFF100000
#li $t0,2
#sw $t0,0($t1)   # Habilita interrup��o do teclado
 
 li $v0, 30
 syscall
 add $t0, $a1, $zero
 add $a1, $a0, $zero
 add $a0, $t0, $zero
 li $v0, 40
 syscall
 add $s5, $zero, $a0 
 REINC:
 li $v1,100
 la $t0, INICIO
 la $a1, 0xff000000
 li $t2, 1200
 addi $s2, $t0, 83	#$s2 cabeca
 addi $s3, $t0, 81 	#$s3 rabo
 
 PUTAPUTALOOP:
 addi $t4, $zero, 40
 LOOP: 
 lb $a0, 0($t0)
 bne $a0,46,NOTGRASS
 addi $sp,$sp,-4
 sw $t4,0($sp)
 jal PRINTGRAMA
 lw $t4,0($sp)
 addi $sp,$sp,4
 j GOON
 NOTGRASS:
 bne $a0,0,NOTWALL
 addi $sp,$sp,-4
 sw $t4,0($sp)
 jal PRINTWALL
 lw $t4,0($sp)
 addi $sp,$sp,4
 j GOON
 NOTWALL:
 bne $a0,62,NOTHEAD
 addi $sp,$sp,-4
 sw $t4,0($sp)
 jal PRINTGRAMA
 lw $t4,0($sp)
 addi $sp,$sp,4
 jal PRINTCABECA
 j GOON
 NOTHEAD:
 bne $a0,60,NOTTAIL
 addi $sp,$sp,-4
 sw $t4,0($sp)
 jal PRINTGRAMA
 lw $t4,0($sp)
 addi $sp,$sp,4
 jal PRINTCABECA
 j GOON
 NOTTAIL:
 addi $sp,$sp,-4
 sw $t4,0($sp)
 jal PRINTGRAMA
 lw $t4,0($sp)
 addi $sp,$sp,4
 jal PRINTCABECA
 GOON:
 addi $t0, $t0, 1
 addi $a1, $a1, 8
 addi $t2, $t2, -1
 addi $t4, $t4, -1
 bne $t4, 0, LOOP
 addi $a1, $a1, 2240
 bne $t2, 0, PUTAPUTALOOP
 
 la $a1 0xff000000
 la $t0 HP
 lb $t0,0($t0)
 HEARTS:
 jal PRINTHEART
 addi $a1,$a1,10
 addi $t0,$t0,-1
 bne $t0,0,HEARTS
 jal PRINTSCORE
   
 j JOGO
 
 QUADRADINHO_DE_OITO:
 add $t1, $zero, $a1
 addi $t8, $zero, 8
 QDO_LOOP: 
 sb $a0, 0($t1)
 sb $a0, 1($t1)
 sb $a0, 2($t1)
 sb $a0, 3($t1)
 sb $a0, 4($t1)
 sb $a0, 5($t1)
 sb $a0, 6($t1)
 sb $a0, 7($t1)
 addi $t8, $t8, -1
 addi $t1, $t1, 320
 bne $t8, 0, QDO_LOOP
 jr $ra
 
 PRINTRATO:
 add $t1, $zero, $a1
 li $t8,0x5c
 li $t7,0x53
 li $t9,0
 sb $t9,4($a1)
 addi $a1,$a1,320
 sb $t9,2($a1)
 sb $t9,3($a1)
 sb $t8,4($a1)
 sb $t9,5($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t9,2($a1)
 sb $t9,3($a1)
 sb $t9,4($a1)
 sb $t7,5($a1)
 sb $t9,6($a1)
 sb $t9,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t9,2($a1)
 sb $t9,3($a1)
 sb $t9,4($a1)
 sb $t9,5($a1)
 sb $t9,6($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t9,2($a1)
 sb $t9,4($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 addi $a1,$a1,320
 sb $t8,1($a1)
 add $a1, $zero, $t1
 jr $ra
 
 JOGO:
 li $a3, 0
 li $s6, 985
 addi $s4, $sp, -4 
 addi $sp, $sp, -12
 li $t4, 68
 sw $t4, 8($sp)
 sw $t4, 4($sp)
 addi $sp,$sp,-20
 sw $a0,0($sp)
 sw $a1,4($sp)
 sw $a2,8($sp)
 sw $a3,12($sp)
 sw $v0,16($sp)
 li $v0,31
 li $a0,70
 li $a1,500
 li $a2,4
 li $a3,40
 syscall
 li $v0,32
 li $a0,1000
 syscall
 li $v0,31
 li $a0,70
 syscall
 li $v0,32
 li $a0,1000
 syscall
 li $v0,31
 li $a0,70
 syscall
 li $v0,32
 li $a0,1000
 syscall
 li $v0,31
 li $a0,80
 li $a1,1000
 syscall
 la $a0,0xFF100000
 li $a1,100
 sw $a1,4($a0)
 lw $a0,0($sp)
 lw $a1,4($sp)
 lw $a2,8($sp)
 lw $a3,12($sp)
 lw $v0,16($sp)
 addi $sp,$sp,20
 j GERARATO
 LOOP_JOGO:
 jal WAITTIME
 jal ECHO
 add $v0,$v1,$zero
 add $s7,$v0,$zero
 sw $v0, 0($sp)
 
 beq $v0, 65, C_A
 beq $v0, 97, C_A
  
 beq $v0, 83, C_S
 beq $v0, 115, C_S
 
 beq $v0, 68, C_D
 beq $v0, 100, C_D	
  
 beq $v0, 87, C_W
 beq $v0, 119, C_W
 j EXECUTA_RABO
 
 C_A:
 add $t0, $s2, $zero
 lb $t0, -1($t0)
 beq $t0, 61, END
 bne $t0, 38, EXECUTA_RABO
 jal INCSCORE
 addi $sp,$sp,-20
 sw $a0,0($sp)
 sw $a1,4($sp)
 sw $a2,8($sp)
 sw $a3,12($sp)
 sw $v0,16($sp)
 li $v0,31
 li $a0,90
 li $a1,500
 li $a2,0
 li $a3,40
 syscall
 lw $a0,0($sp)
 lw $a1,4($sp)
 lw $a2,8($sp)
 lw $a3,12($sp)
 lw $v0,16($sp)
 addi $sp,$sp,20
 addi $sp, $sp, -4
 li $a3, 1
 j EXC_CAB
 
 C_S:
 add $t0, $zero, $s2
 lb $t0, 40($t0)
 beq $t0, 61, END
 bne $t0, 38, EXECUTA_RABO
 jal INCSCORE
 addi $sp,$sp,-20
 sw $a0,0($sp)
 sw $a1,4($sp)
 sw $a2,8($sp)
 sw $a3,12($sp)
 sw $v0,16($sp)
 li $v0,31
 li $a0,90
 li $a1,500
 li $a2,0
 li $a3,40
 syscall
 lw $a0,0($sp)
 lw $a1,4($sp)
 lw $a2,8($sp)
 lw $a3,12($sp)
 lw $v0,16($sp)
 addi $sp,$sp,20
 addi $sp, $sp, -4
 li $a3, 1
 j EXC_CAB
 
 C_D:
 add $t0, $zero, $s2
 lb $t0, 1($t0)
 beq $t0, 61, END
 bne $t0, 38, EXECUTA_RABO
 jal INCSCORE
 addi $sp,$sp,-20
 sw $a0,0($sp)
 sw $a1,4($sp)
 sw $a2,8($sp)
 sw $a3,12($sp)
 sw $v0,16($sp)
 li $v0,31
 li $a0,90
 li $a1,500
 li $a2,0
 li $a3,40
 syscall
 lw $a0,0($sp)
 lw $a1,4($sp)
 lw $a2,8($sp)
 lw $a3,12($sp)
 lw $v0,16($sp)
 addi $sp,$sp,20
 addi $sp, $sp, -4
 li $a3, 1
 j EXC_CAB
 
 C_W:
 add $t0, $zero, $s2
 lb $t0, -40($t0)
 beq $t0, 61, END
 bne $t0, 38, EXECUTA_RABO
 jal INCSCORE
 addi $sp,$sp,-20
 sw $a0,0($sp)
 sw $a1,4($sp)
 sw $a2,8($sp)
 sw $a3,12($sp)
 sw $v0,16($sp)
 li $v0,31
 li $a0,90
 li $a1,500
 li $a2,0
 li $a3,40
 syscall
 lw $a0,0($sp)
 lw $a1,4($sp)
 lw $a2,8($sp)
 lw $a3,12($sp)
 lw $v0,16($sp)
 addi $sp,$sp,20
 addi $sp, $sp, -4
 li $a3, 1
 j EXC_CAB
 
 EXECUTA_RABO:
 lb $v0, 0($s4)
 
 beq $v0, 65, LABEL_A_RABO
 beq $v0, 97, LABEL_A_RABO
  
 beq $v0, 83, LABEL_S_RABO
 beq $v0, 115, LABEL_S_RABO
 
 beq $v0, 68, LABEL_D_RABO
 beq $v0, 100, LABEL_D_RABO	
  
 beq $v0, 87, LABEL_W_RABO
 beq $v0, 119, LABEL_W_RABO
  
 EXECUTA_CABECA:
 jal SHIFTPILE
 EXC_CAB:
 lw $v0, 4($sp)
 beq $v0, 65, LABEL_A_CABECA
 beq $v0, 97, LABEL_A_CABECA
  
 beq $v0, 83, LABEL_S_CABECA
 beq $v0, 115, LABEL_S_CABECA
 
 beq $v0, 68, LABEL_D_CABECA
 beq $v0, 100, LABEL_D_CABECA
 
 beq $v0, 87, LABEL_W_CABECA
 beq $v0, 119, LABEL_W_CABECA
 j EXANY
 
 LABEL_A_RABO:
 li $a0, 46
 sb $a0, 0($s3)
 la $t8,INICIO
 sub $t9, $s3, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 addi $s3, $s3, -1
 addi $t9, $t9, -8
 li $a0, 60
 sb $a0, 0($s3)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTRABO
 j EXECUTA_CABECA
                               
 LABEL_A_CABECA:
 li $a0, 61
 sb $a0, 0($s2)
 la $t8,INICIO
 sub $t9, $s2, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 lw $t8,8($sp)
 bne $t8,115,HEADNOTAS
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADASOMETHING
 HEADNOTAS:
 bne $t8,119,HEADNOTAW
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADASOMETHING
 HEADNOTAW:
 bne $t8,97,HEADNOTAA
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADASOMETHING
 HEADNOTAA:
 jal QUADRADINHO_DE_OITO
 HEADASOMETHING:
 li $s7,97
 addi $s2, $s2, -1
 addi $t9, $t9, -8
 li $a0, 62
 sb $a0, 0($s2)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 jal PRINTCABECA
 beq $a3, 1, GERARATO
 j LOOP_JOGO
 
 LABEL_S_RABO:
 li $a0, 46
 sb $a0, 0($s3)
 la $t8,INICIO
 sub $t9, $s3, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 addi $s3, $s3, 40
 addi $t9, $t9, 2560
 li $a0, 60
 sb $a0, 0($s3)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTRABO
 j EXECUTA_CABECA
 
 LABEL_S_CABECA:
 li $a0, 61
 sb $a0, 0($s2)
 la $t8,INICIO
 sub $t9, $s2, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 lw $t8,8($sp)
 bne $t8,97,HEADNOTSA
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADSSOMETHING
 HEADNOTSA:
 bne $t8,115,HEADNOTSS
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADSSOMETHING
 HEADNOTSS:
 bne $t8,100,HEADNOTSD
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADSSOMETHING
 HEADNOTSD:
 jal QUADRADINHO_DE_OITO
 HEADSSOMETHING:
 li $s7,115
 addi $s2, $s2, 40
 addi $t9, $t9, 2560
 li $a0, 62
 sb $a0, 0($s2)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 jal PRINTCABECA
 beq $a3, 1, GERARATO
 j LOOP_JOGO
 
 LABEL_D_RABO:
 li $a0, 46
 sb $a0, 0($s3)
 la $t8,INICIO
 sub $t9, $s3, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 addi $s3, $s3, 1
 addi $t9, $t9, 8
 li $a0, 60
 sb $a0, 0($s3)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTRABO
 j EXECUTA_CABECA
 
 LABEL_D_CABECA:
 li $a0, 61
 sb $a0, 0($s2)
 la $t8,INICIO
 sub $t9, $s2, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8
 la $t8,0xff000000 
 add $a1, $t8, $t9
 lw $t8,8($sp)
 bne $t8,115,HEADNOTDS
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADDSOMETHING
 HEADNOTDS:
 bne $t8,119,HEADNOTDW
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADDSOMETHING
 HEADNOTDW:
 bne $t8,100,HEADNOTDD
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADDSOMETHING
 HEADNOTDD:
 jal PRINTGRAMA
 jal PRINTCABECA
 HEADDSOMETHING:
 li $s7,100
 addi $s2, $s2, 1
 addi $t9, $t9, 8
 li $a0, 62
 sb $a0, 0($s2)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 jal PRINTCABECA
 beq $a3, 1, GERARATO
 j LOOP_JOGO
 
 LABEL_W_RABO:
 li $a0, 46
 sb $a0, 0($s3)
 la $t8,INICIO
 sub $t9, $s3, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 addi $s3, $s3, -40
 addi $t9, $t9, -2560
 li $a0, 60
 sb $a0, 0($s3)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTRABO
 j EXECUTA_CABECA
 
 LABEL_W_CABECA:
 li $a0, 61
 sb $a0, 0($s2)
 la $t8,INICIO
 sub $t9, $s2, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 lw $t8,8($sp)
 bne $t8,97,HEADNOTWA
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADWSOMETHING
 HEADNOTWA:
 bne $t8,119,HEADNOTWW
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADWSOMETHING
 HEADNOTWW:
 bne $t8,100,HEADNOTWD
 jal PRINTGRAMA
 jal PRINTCABECA
 j HEADWSOMETHING
 HEADNOTWD:
 jal QUADRADINHO_DE_OITO
 HEADWSOMETHING:
 li $s7,119
 addi $s2, $s2, -40
 addi $t9, $t9, -2560
 li $a0, 62
 sb $a0, 0($s2)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGRAMA
 jal PRINTCABECA
 beq $a3, 1, GERARATO  
 j LOOP_JOGO
      
 SHIFTPILE:
 add $t5, $zero, $s4
 LOOP2:
 addi $t5, $t5, -4
 lw $t6, 0($t5)
 sw $t6, 4($t5)
 bne $t5, $sp, LOOP2
 jr $ra        
 
 EXANY:
 add $v0,$s7,$zero
 sw $v0,4($sp)
 beq $v0, 65, LABEL_A_CABECA
 beq $v0, 97, LABEL_A_CABECA
  
 beq $v0, 83, LABEL_S_CABECA
 beq $v0, 115, LABEL_S_CABECA
 
 beq $v0, 68, LABEL_D_CABECA
 beq $v0, 100, LABEL_D_CABECA
 
 beq $v0, 87, LABEL_W_CABECA
 beq $v0, 119, LABEL_W_CABECA

 GERARATO:
 li $a3, 0
 li $v0, 42
 add $a0, $s5, $zero
 add $a1, $s6, $zero
 syscall
 addi $s6, $s6, -1
 addi $t0, $a0, 1
 li $t9, 81
 
 
 COLOCARATO:
 la $t8,INICIO
 add $a1, $t9, $t8
 lb $t8, 0($a1)
 addi $t9, $t9, 1
 bne $t8, 46, COLOCARATO
 addi $t0, $t0, -1
 bne $t0, 0, COLOCARATO
 addi $t9, $t9, -1
 li $t7, 38
 la $t8,INICIO
 add $a1, $t9, $t8
 sb $t7, 0($a1)
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTRATO
 j LOOP_JOGO
 
 PRINTGRAMA:
 add $t1, $zero, $a1
 li $t8,0x10
 li $t7,0x18
 li $t6,0x20
 li $t5,0x28
 li $t4,0
 sb $t8,0($a1)
 sb $t7,1($a1)
 sb $t5,2($a1)
 sb $t5,3($a1)
 sb $t6,4($a1)
 sb $t8,5($a1)
 sb $t5,6($a1)
 sb $t6,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t5,1($a1)
 sb $t6,2($a1)
 sb $t8,3($a1)
 sb $t5,4($a1)
 sb $t7,5($a1)
 sb $t6,6($a1)
 sb $t7,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t7,1($a1)
 sb $t8,2($a1)
 sb $t6,3($a1)
 sb $t6,4($a1)
 sb $t5,5($a1)
 sb $t7,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t5,0($a1)
 sb $t6,1($a1)
 sb $t5,2($a1)
 sb $t6,3($a1)
 sb $t7,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t7,0($a1)
 sb $t5,1($a1)
 sb $t6,2($a1)
 sb $t5,3($a1)
 sb $t8,4($a1)
 sb $t5,5($a1)
 sb $t6,6($a1)
 sb $t6,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t6,1($a1)
 sb $t7,2($a1)
 sb $t5,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t8,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t5,0($a1)
 sb $t8,1($a1)
 sb $t5,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t5,5($a1)
 sb $t7,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t7,0($a1)
 sb $t5,1($a1)
 sb $t6,2($a1)
 sb $t6,3($a1)
 sb $t5,4($a1)
 sb $t8,5($a1)
 sb $t5,6($a1)
 sb $t7,7($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINTCABECA:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 li $a0,62
 jal QUADRADINHO_DE_OITO
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 PRINTRABO:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 li $a0,60
 jal QUADRADINHO_DE_OITO
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 PRINTCORPO:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 li $a0,61
 jal QUADRADINHO_DE_OITO
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINTWALL:
 add $t1, $zero, $a1
 li $t8,0x02
 li $t7,0x04
 li $t6,0x0b
 li $t5,0x16
 li $t4,0
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t7,3($a1)
 sb $t7,4($a1)
 sb $t7,5($a1)
 sb $t7,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t6,1($a1)
 sb $t6,2($a1)
 sb $t7,3($a1)
 sb $t7,4($a1)
 sb $t7,5($a1)
 sb $t7,6($a1)
 sb $t6,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t6,1($a1)
 sb $t6,2($a1)
 sb $t5,3($a1)
 sb $t5,4($a1)
 sb $t5,5($a1)
 sb $t5,6($a1)
 sb $t6,7($a1)
 addi $a1,$a1,320
 sb $t7,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t5,3($a1)
 sb $t5,4($a1)
 sb $t5,5($a1)
 sb $t5,6($a1)
 sb $t7,7($a1)
 addi $a1,$a1,320
 sb $t7,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t7,7($a1)
 addi $a1,$a1,320
 sb $t5,0($a1)
 sb $t5,1($a1)
 sb $t5,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t5,0($a1)
 sb $t5,1($a1)
 sb $t5,2($a1)
 sb $t6,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t6,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t6,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t6,6($a1)
 sb $t8,7($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT9:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT8:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT7:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT6:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT5:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT4:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT3:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT2:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 
 PRINT1:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT0:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINTHEART:
 add $t1, $zero, $a1
 li $t8,0xc5
 li $t7,0xd5
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 addi $a1,$a1,320
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 addi $a1,$a1,320
 sb $t8,3($a1)
 sb $t8,4($a1)
 add $a1, $zero, $t1
 jr $ra
 
 WAITTIME:
 la $v0,DIFFIC
 lb $a0,0($v0)
 bne $a0,1,DN1
 li $v0,32
 li $a0,250
 syscall
 DN1:
 bne $a0,2,DN2
 li $v0,32
 li $a0,150
 syscall
 DN2:
 bne $a0,3,DN3
 li $v0,32
 li $a0,50
 syscall
 DN3:
 jr $ra
 
 INCSCORE:
 addi $sp,$sp,-32
 sw $t0,0($sp)
 sw $t1,4($sp)
 sw $t2,8($sp)
 sw $t3,12($sp)
 sw $t4,16($sp)
 sw $t5,20($sp)
 sw $t6,24($sp)
 sw $ra,28($sp)
 la $t0,SCORE
 lb $t1,0($t0)
 addi $t1,$t1,1
 div $t1,$t1,10
 mfhi $t1
 sb $t1,0($t0)
 la $a1,0xff000000
 addi $a1,$a1,80
 bne $t1,0,FN0
 jal PRINT0
 j FGO
 FN0:
 bne $t1,1,FN1
 jal PRINT1
 j FGO
 FN1:
 bne $t1,2,FN2
 jal PRINT2
 j FGO
 FN2:
 bne $t1,3,FN3
 jal PRINT3
 j FGO
 FN3:
 bne $t1,4,FN4
 jal PRINT4
 j FGO
 FN4:
 bne $t1,5,FN5
 jal PRINT5
 j FGO
 FN5:
 bne $t1,6,FN6
 jal PRINT6
 j FGO
 FN6:
 bne $t1,7,FN7
 jal PRINT7
 j FGO
 FN7:
 bne $t1,8,FN8
 jal PRINT8
 j FGO
 FN8:
 bne $t1,9,FN9
 jal PRINT9
 j FGO
 FN9:
 FGO:
 mflo $t6
 lb $t1,1($t0)
 add $t1,$t1,$t6
 div $t1,$t1,10
 mfhi $t1
 sb $t1,1($t0)
 la $a1,0xff000000
 addi $a1,$a1,72
 bne $t1,0,SN0
 jal PRINT0
 j SGO
 SN0:
 bne $t1,1,SN1
 jal PRINT1
 j SGO
 SN1:
 bne $t1,2,SN2
 jal PRINT2
 j SGO
 SN2:
 bne $t1,3,SN3
 jal PRINT3
 j SGO
 SN3:
 bne $t1,4,SN4
 jal PRINT4
 j SGO
 SN4:
 bne $t1,5,SN5
 jal PRINT5
 j SGO
 SN5:
 bne $t1,6,SN6
 jal PRINT6
 j SGO
 SN6:
 bne $t1,7,SN7
 jal PRINT7
 j SGO
 SN7:
 bne $t1,8,SN8
 jal PRINT8
 j SGO
 SN8:
 bne $t1,9,SN9
 jal PRINT9
 j SGO
 SN9:
 SGO:
 mflo $t6
 lb $t1,2($t0)
 add $t1,$t1,$t6
 div $t1,$t1,10
 mfhi $t1
 sb $t1,2($t0)
 la $a1,0xff000000
 addi $a1,$a1,64
 bne $t1,0,TN0
 jal PRINT0
 j TGO
 TN0:
 bne $t1,1,TN1
 jal PRINT1
 j TGO
 TN1:
 bne $t1,2,TN2
 jal PRINT2
 j TGO
 TN2:
 bne $t1,3,TN3
 jal PRINT3
 j TGO
 TN3:
 bne $t1,4,TN4
 jal PRINT4
 j TGO
 TN4:
 bne $t1,5,TN5
 jal PRINT5
 j TGO
 TN5:
 bne $t1,6,TN6
 jal PRINT6
 j TGO
 TN6:
 bne $t1,7,TN7
 jal PRINT7
 j TGO
 TN7:
 bne $t1,8,TN8
 jal PRINT8
 j TGO
 TN8:
 bne $t1,9,TN9
 jal PRINT9
 j TGO
 TN9:
 TGO:
 mflo $t6
 lb $t1,3($t0)
 add $t1,$t1,$t6
 div $t1,$t1,10
 mfhi $t1
 sb $t1,3($t0)
 la $a1,0xff000000
 addi $a1,$a1,56
 bne $t1,0,FON0
 jal PRINT0
 j FOGO
 FON0:
 bne $t1,1,FON1
 jal PRINT1
 j FOGO
 FON1:
 bne $t1,2,FON2
 jal PRINT2
 j FOGO
 FON2:
 bne $t1,3,FON3
 jal PRINT3
 j FOGO
 FON3:
 bne $t1,4,FON4
 jal PRINT4
 j FOGO
 FON4:
 bne $t1,5,FON5
 jal PRINT5
 j FOGO
 FON5:
 bne $t1,6,FON6
 jal PRINT6
 j FOGO
 FON6:
 bne $t1,7,FON7
 jal PRINT7
 j FOGO
 FON7:
 bne $t1,8,FON8
 jal PRINT8
 j FOGO
 FON8:
 bne $t1,9,FON9
 jal PRINT9
 j FOGO
 FON9:
 FOGO:
 mflo $t6
 lb $t1,4($t0)
 add $t1,$t1,$t6
 div $t1,$t1,10
 mfhi $t1
 sb $t1,4($t0)
 la $a1,0xff000000
 addi $a1,$a1,48
 bne $t1,0,FIN0
 jal PRINT0
 j FIGO
 FIN0:
 bne $t1,1,FIN1
 jal PRINT1
 j FIGO
 FIN1:
 bne $t1,2,FIN2
 jal PRINT2
 j FIGO
 FIN2:
 bne $t1,3,FIN3
 jal PRINT3
 j FIGO
 FIN3:
 bne $t1,4,FIN4
 jal PRINT4
 j FIGO
 FIN4:
 bne $t1,5,FIN5
 jal PRINT5
 j FIGO
 FIN5:
 bne $t1,6,FIN6
 jal PRINT6
 j FIGO
 FIN6:
 bne $t1,7,FIN7
 jal PRINT7
 j FIGO
 FIN7:
 bne $t1,8,FIN8
 jal PRINT8
 j FIGO
 FIN8:
 bne $t1,9,FIN9
 jal PRINT9
 j FIGO
 FIN9:
 FIGO:
 mflo $t6
 lw $t0,0($sp)
 lw $t1,4($sp)
 lw $t2,8($sp)
 lw $t3,12($sp)
 lw $t4,16($sp)
 lw $t5,20($sp)
 lw $t6,24($sp)
 lw $ra,28($sp)
 addi $sp,$sp,32
 jr $ra
 
 PRINTSCORE:
 addi $sp,$sp,-12
 sw $t0,0($sp)
 sw $t1,4($sp)
 sw $ra,8($sp)
 la $t0,SCORE
 lb $t1,0($t0)
 addi $t1,$t1,-1
 sb $t1,0($t0)
 jal INCSCORE
 lw $t0,0($sp)
 lw $t1,4($sp)
 lw $ra,8($sp)
 addi $sp,$sp,12
 jr $ra
           
 END:
 addi $sp,$s4,4
 li $v0,31
 li $a0,70
 li $a1,200
 li $a2,51
 li $a3,40
 syscall
 li $v0,32
 li $a0,100
 syscall
 li $v0,31
 li $a0,66
 syscall
 li $v0,32
 li $a0,100
 syscall
 li $v0,31
 li $a0,62
 syscall
 li $v0,32
 li $a0,100
 syscall
 li $v0,31
 li $a0,58
 syscall
 li $v0,32
 li $a0,100
 syscall
 li $v0,31
 li $a0,55
 li $a1,2000
 syscall
 li $v0,32
 li $a0,2000
 syscall
la $t9,HP
lb $t8,0($t9)
addi $t8,$t8,-1
sb $t8,0($t9)
 la $t0, INICIO
 la $t1, AUX
 li $t2, 0
 LOOPYLOOP:
 lb $t3,0($t1)
 sb $t3,0($t0)
 addi $t0,$t0,1
 addi $t1,$t1,1
 addi $t2,$t2,1
 bne $t2,1200,LOOPYLOOP
bne $t8,0,REINC
li $v0, 10
syscall

ECHO:   addi $sp,$sp,-8
	sw $t1,0($sp)
	sw $t2,4($sp)
	la $t1,0xFF100000
	lw $t0,0($t1)
	andi $t0,$t0,0x0001		# Le bit de Controle Teclado
   	beq $t0,$zero,PULA
   	lw $t2,4($t1)  # Tecla lida
   	beq $t2,119,VNI
   	beq $t2,100,VNI
   	beq $t2,97,VNI
   	beq $t2,115,VNI
   	beq $t2,65,VNI
   	beq $t2,68,VNI
   	beq $t2,83,VNI
   	beq $t2,87,VNI
   	j PULA
   	VNI:
	bne $s7, 119,ONW
	beq $t2,119,VIR
	beq $t2,87,VIR
	beq $t2,97,VIR
	beq $t2,65,VIR
	beq $t2,100,VIR
	beq $t2,68,VIR
	j PULA
	ONW:
	bne $s7, 115,ONS
	beq $t2,97,VIR
	beq $t2,65,VIR
	beq $t2,100,VIR
	beq $t2,68,VIR
	beq $t2,115,VIR
	beq $t2,83,VIR
	j PULA
	ONS:
	bne $s7, 97,ONA
	beq $t2,119,VIR
	beq $t2,87,VIR
	beq $t2,97,VIR
	beq $t2,65,VIR
	beq $t2,115,VIR
	beq $t2,83,VIR
	j PULA
	ONA:
	bne $s7, 100,OND
	beq $t2,100,VIR
	beq $t2,68,VIR
	beq $t2,119,VIR
	beq $t2,87,VIR
	beq $t2,115,VIR
	beq $t2,83,VIR
	j PULA
	OND:
	VIR:
	add $v1,$t2,$zero
PULA:	lw $t1,0($sp)
	lw $t2,4($sp)
	addi $sp,$sp,8
	jr $ra
