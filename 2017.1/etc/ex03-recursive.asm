# Implemente o seguinte codigo em C:
#
#     int rec(int n) { return (n < 1)? 0 : n + rec(n-1); }
#

.text
# this procedure reads an integer
main:
	# Reading integer
	li $v0, 5
	syscall
	add $a0, $zero, $v0
	add $v0, $zero, $zero
	# Calling recursive sum function
	jal rec
	# Printing result
	li $v0, 1
	add $a0, $v0, $zero
	syscall
	
	# Finishing the program
	li $v0, 10
	syscall
	
# This procedure calculates the sum from 1 to n.
# Arguments:
# - $a0 <- n
# - $v0 <- the sum from 1 to n or 0 if n < 0
# This procedure is based on the function:
#     int rec(int n) { return (n < 1)? 0 : n + rec(n-1); }
#
rec:
	# Filling stack
	subi $sp, $sp, 8
	sw $a0, 4($sp) 
	sw $ra, 0($sp)
	# Trying to recurse
	addi $t0, $0, 1
	add $v0, $v0, $a0
	# Finishing recursion
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
loop:
	# rec(n-1)
	subi $a0, $a0, 1
	jal rec
		
	
.data