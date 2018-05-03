.data
PI: .float -3.14159 # => 0x40490fd0

.text
#
# Testes unitários
# ================
#
# Lendo um float da memória
la $t0, PI
ori $s0, $t0, 0x0

# TODO Extrair sinal
ori $a0, $s0, 0
jal GET_SIGN
or $a0, $v0, $0
li $v0, 1
syscall

# TODO Extrair expoente
ori $a0, $s0, 0
jal GET_EXP
add $a0, $v0, $0
li $v0, 1
syscall

# TODO Extrair mantissa

# TODO Normalizar número

# Terminando programa
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
nop
li $v0, 5
jr $ra
