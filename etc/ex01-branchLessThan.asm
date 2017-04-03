.text
# This program reads two integers and decides if the first is bigger or
# smaller than the second, printing a convinient message on screen.
main:
	# Input
	li $v0, 5            # Reading first integer
	syscall
	add $t0, $zero, $v0  # Storing integer on t0 
	li $v0, 5            # Reading second integer
	syscall
	add $t1, $zero, $v0  # Storing integer on t1
	
	# Calling "branch if less than"
	add $a0, $t0, $0  # Preparing BLTJ arguments
	add $a1, $t1, $0
	la $a2, smaller
	jal bltj          # Calling BLTJ
	jal bigger        # Calling bigger in case it is not smaller
	
	# Finishing the program
	li $v0, 10 
	syscall

	
smaller:
	li $v0, 4     # tell MIPS we are printing a string
	la $a0, less  # store the variable hi on $a0
	syscall       # and do it
	addi $ra, $ra, 4
	jr $ra
	
bigger:
	li $v0, 4     # tell MIPS we are printing a string
	la $a0, more  # store the string address on memory
	syscall       # and do it
	jr $ra
	
# the BLTJ (Branch if Less Than by Joe) procedure evaluates the operation
#     if A < B:
#         go to C
# where A is on $a0, B is on $a1 and C on $a2
#
# TODO Fix this mess
bltj:
	slt $t0, $a0, $a1
	addi $t1, $0, 1
	bne $t0, $t1, falsebranch
	jr $a2	
	falsebranch:
		jr $ra

.data
	less: .asciiz "Is smaller!"
	more: .asciiz "Not smaller!"
