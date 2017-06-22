Luis Felipe:
beq $t1,$t2,endpreenche 
  lw $t0,0($t2)
  addi $t2,$t2,-4
  sb $a2,0($t0)
   addi $t0,$t0,1
   sw $t0,0($t1)
   addi $t1,$t1,-4
left:   addi $t0,$t0,-2
   sw $t0,0($t1)
   addi $t1,$t1,-4
down:   addi $t0,$t0,321
   addi $t1,$t1,-8
   sw $t0,4($t1)
   addi $t0,$t0,-640
   sw $t0,8($t1)
  j bfs