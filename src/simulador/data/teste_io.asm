.data
CONST: .word 5

.text
# read a
la $t0, CONST
lw $t0, 0($t0)

# read b
li $v0, 5
syscall
add $t1, $v0, $zero

# sum a + b
add $a0, $t1, $t0
li $v0, 1
syscall

# exit
li $v0, 10
syscall
