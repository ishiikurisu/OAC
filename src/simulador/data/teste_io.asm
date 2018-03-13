.data
  
.text
# read a
li $v0, 5
syscall
add $t0, $v0, $zero

# read b
li $v0, 5
syscall
add $t1, $v0, $zero

# sum a + b
add $a0, $t1, $t0
li $v0, 1
syscall