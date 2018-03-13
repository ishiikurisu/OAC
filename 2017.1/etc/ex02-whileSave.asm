.text
# This program is an attempt to compile the following C snippet to MIPS assembly:
#
#     while (save[i] == k)
#         i++;
#
main:
	# TODO Fill "save" array with data
	# Declared save array in .data section
	li $v0, 5             	# k = scan()
	syscall
	add $s1, $0, $v0
	addi $v0, $0, 0	        # i = 0
	la $s0, save
	
	jal while           # Running the while loop
	add $a0, $zero, $v0 # Printing output
	li $v0, 1
	syscall
	
	li $v0, 10 # Finishing the program
	syscall

# Simulates the snippet "while(save[i]==k)i++;" with the aid of the continue procedure
# $t0 = save[i]
# $v0 = i
# $s0 = save
# $s1 = k
while:	
	# Getting offset
	addi $t0, $0, 4         # Generating a 4
	mul $t0, $v0, $t0       # Multiplying current offset by 4
	add $t0, $t0, $s0       # Getting correct address
	lw $t0, 0($t0)          # Loading address in save + 4*i
	# BUG What if the user queries a number that is not on the array?
	
	# Checking for loop condition
	beq $t0, $s1, continue  # Exits the loop if the condition is true
	addi $v0, $v0, 1        # Incrementing i
	j while                 # Restarting loop
	
continue:
	jr $ra

.data
	# TODO Create an array with user read values
	# The array to be iterated on
	save: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
