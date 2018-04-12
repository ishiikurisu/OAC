.data
primos: .word 1, 3, 5, 7, 11, 13, 17, 19
size: .word 8
msg: .asciiz "Os oito primeiros numeros primos sao : "
space: .ascii " "
.text
 la $t0, primos #carrega endereço inicial do array
 la $t1, size #carrega endereço de size
 lw $t1, 0($t1) #carrega size em t1
 li $v0, 4 #imprime mensagem inicial
 la $a0, msg
 syscall
loop: beq $t1, $zero, exit #se processou todo o array, encerra
 li $v0, 1 #serviço de impressão de inteiros
 lw $a0, 0($t0) #inteiro a ser exibido
 syscall
 li $v0, 4 #imprime separador
 la $a0, space
 syscall
 addi $t0, $t0, 4 #incrementa indice array
 addi $t1, $t1, -1 #decrementa contador
 j loop #novo loop
exit: li $v0, 10
 syscall
