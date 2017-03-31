.text
# This program is an attempt to compile the following C snippet to MIPS assembly:
#
#     while (save[i] == k)
#         i++;
#
main:
	# TODO Fill "save" array with data
	# IDEA save must be in $s0, k in $s1, and i in $v0
	jal while 
	add $a0, $zero, $v0 # Printing output
	li $v0, 4
	syscall
	
	li $a0, 10 # Finishing the program
	syscall

# Simulates the snippet "while(save[i]==k)i++;" with the aid of the continue procedure
while:
	# t0 = save[i]
	# $v0 = i
	# $s0 = save
	# $s1 = k
	lw $t0, $v0($s0)
	beq $t0, $s1, continue
	addi $v0, $v2, 1
	j while
	
continue:
	jr $ra