.data
PI: .float -3.14159 # => 0xc0490fd0
MSG_ERROS: .asciiz "\nOs testes falharam!\n"

.text
#
# Testes unitários
# ================

# Preparando suite de testes
add $s7, $0, $0

# Lendo um float da memória
la $t0, PI
lw $s0, 0($t0)

# Extraindo sinal
ori $a0, $s0, 0
jal GET_SIGN
li $t0, 0x1
bne $t0, $v0, FIM
addi $s7, $s7, 1

# Extraindo expoente
ori $a0, $s0, 0
jal GET_EXP
li $t0, 0x80
bne $t0, $v0, FIM
addi $s7, $s7, 1

# TODO Extrair mantissa

# TODO Normalizar número

# Terminando programa
FIM:
bne $s7, $0, SEM_ERROS
  li $v0, 4
  la $a0, MSG_ERROS
  syscall
SEM_ERROS:
li $v0, 10
syscall

#
# Definições auxiliares
# =====================

# Extrai o sinal do número em $a0 e o guarda em $v0
GET_SIGN:
srl $v0, $a0, 31
jr $ra

# Extrai o expoente de um número em ponto flutuante simples guardado em $a0
# e o guarda em $v0.
GET_EXP:
srl $v0, $a0, 23
andi $v0, $v0, 0xFF
jr $ra
