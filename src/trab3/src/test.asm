.data

.text
#
# Testes unitários
# ================
#
# Lendo um float da memória
li $v0, 6
syscall
mfc1 $s0, $f0

# TODO Extrair expoente
jal GET_EXP
add $a0, $v0, $0
li $v0, 1
syscall

# TODO Extrair mantissa

# TODO Normalizar número

#
# Definições auxiliares
# =====================

# Extrai o expoente de um número em ponto flutuante simples guardado em $a0
# e o guarda em $v0.
GET_EXP:
nop
