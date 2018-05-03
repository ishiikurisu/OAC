.data
NUMERO_1: .asciiz "Digite o primeiro numero: "
NUMERO_2: .asciiz "Digite o segundo numero: "
OPERACAO: .asciiz "Escolha a operacao (+ ou *): "
MAIS: .ascii "+"
VEZES: .ascii "*"

.text
# Menu principal
# ==============
#
# Escrevendo primeiro texto
li $v0, 4
la $a0, NUMERO_1
syscall
# Lendo primeiro numero
li $v0, 6
syscall
mfc1 $s0, $f0
# Escrevendo segundo texto
li $v0, 4
la $a0, NUMERO_2
syscall
# Lendo segundo numero
li $v0, 6
syscall
mfc1 $s1, $f0
# Escrevendo terceiro texto
li $v0, 4
la $a0, OPERACAO
syscall
# Lendo operacao
li $v0, 12
syscall

# Decidindo procedimento
# ======================
#

# TODO Comparar `char` em $v0 para saber se a operecao atual eh uma soma
# TODO Comparar `char` em $v0 para saber se a operecao atual eh uma multiplicao
# TODO Avisar quando uma operacao invalida foi chamada


# Saindo programa
# ===============
#
li $v0, 10
syscall

# Definicoes auxiliares
# =====================
#

# TODO Implement the rest of the application
