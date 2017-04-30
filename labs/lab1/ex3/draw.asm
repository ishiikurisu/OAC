 ###########POLY############
 POLY:                     #
 #a0 stores the colour     #
 #a1 stores tolerance      #
 #a2: the amount of points #
 #points: stack
 
 
li $t6, 1

move $s7, $sp
addi $sp, $sp, -4
 
sw $ra, 0($sp)
 
 POLYLOOP:
 
 lw $t0, 0($s7)
 lw $t1, 4($s7)
 lw $t2, 8($s7)
 lw $t3, 12($s7)
 move $t4, $a1
 jal LINEPROC
 
 addi $t6, $t6, 1
 addi $s7, $s7, 8
 bne $t6, $a2, POLYLOOP
 
 lw $t0, 0($s7)
 lw $t1, 4($s7)
 lw $t2, 4($sp)
 lw $t3, 8($sp)
 move $t4, $a1
 jal LINEPROC
 
 lw $ra, 0($sp)
 addi $sp, $sp, 4

 jr $ra

 ##########POLY##########