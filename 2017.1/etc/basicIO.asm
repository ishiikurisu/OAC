.text
main:
	# Input
	li $v0, 5            # Reading first integer
	syscall
	add $t0, $zero, $v0  # Storing integer on t0 
	li $v0, 5            # Reading second integer
	syscall
	add $t1, $zero, $v0  # Storing integer on t1
	
	# Output
	add $t2, $t1, $t0    # Calculating sum
	li $v0, 1            # Printing result
	add $a0, $t2, $zero
	syscall
	
	li $v0, 10 # Finishing the program
	syscall

.data
