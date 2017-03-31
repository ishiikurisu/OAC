.text
main:
# Execute this step by step to see the registers changing
li $t0, 5
li $v0, 10

# # Some I/O
# Output:
la $a0, joe    # Setting joe to $a0
la $t0, frank  # Setting frank to $t0
li $v0, 4      # Preparing the program to print
syscall        # Calling the print function
move $a0, $t0  # Setting the print argument to frank
li $v0, 4      # Preparing the program to print
syscall        # Calling the print function
# Input:
la $a0, myName
li $a1, 8
li $v0, 8
syscall
li $v0, 4
syscall

# Finishing the program
li $v0, 10
syscall

.data
joe: .asciiz "joe"
frank: .asciiz " frank\n"
myName: .space 20