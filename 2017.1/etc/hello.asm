.data # This is where we declare our variables
	hi: .asciiz "hello joe!\n" # This is a string

.text # This is where the code is
	li $v0, 4     # tell MIPS to get ready because we are printing something
	la $a0, hi    # store the variable hi on $a0
	syscall       # and do it