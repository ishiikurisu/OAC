.data
X: .word 33
.text 
la $t1, X
lw $t0, 0($t1)
add $t0, $t0, $t0
sw $t0, 0($t1)
add $a0, $t0, $0
addi $v0, $0, 1
syscall