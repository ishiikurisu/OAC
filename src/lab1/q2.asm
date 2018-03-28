.data
vetor:
	.word 1 2 3 4 5 6 7 8 9
tam:
	.word 9
espaco:
	.asciiz " "

.text 
	jal pr_vet	# chamada da função pr_vet
	li $v0, 10	# colocando 10 em v0 e chamando
	syscall		# syscall encerra o programa


# código para impressão do vetor
pr_vet: 
	la $t1, tam
	lw $t1, 0($t1)
	la $t2, vetor
	li $t0, 0
	li $t4, 1

	pr_vet_loop:
		# escrevendo número
		lw $a0, 0($t2)
		addi $v0, $0, 1
		syscall
		la $a0, espaco
		addi $v0, $0, 4
		syscall

		# incremento do loop
		addi $t2, $t2, 4
		addi $t0, $t0, 1
		# conferindo condição
		slt $t3, $t0, $t1
		beq $t3, $t4, pr_vet_loop
		
	jr $ra
