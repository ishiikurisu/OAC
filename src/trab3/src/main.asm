.data
NUMERO_1: .asciiz "Digite o primeiro numero: "
NUMERO_2: .asciiz "Digite o segundo numero: "
OPERACAO: .asciiz "Escolha a operacao (+ ou *): "
AVISO: .asciiz "Operacao invalida escolhida!"

.text
main:
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
add $a0, $s0, $zero		# Primeiro numeros
add $a1, $s1, $zero		# Segundo numero
add $s2, $v0, $zero 	# Operacao invocada em forma de string
add $s3, $0, $0 		# Flag para saber se ocorreu uma operacao

# Comparando `char` em $s2 para saber se a operecao atual eh uma soma
addi $t0, $0, 43
bne $t0, $s2, NAO_SOME
  jal SOMAR
  addi $s3, $s3, 1
  mtc1 $v0, $f12
  li $v0, 2
  syscall
NAO_SOME:
nop

# Comparando `char` em $s2 para saber se a operecao atual eh uma multiplicao
addi $t0, $0, 42
bne $t0, $s2, NAO_MULTIPLIQUE
  jal MULTIPLICAR
  addi $s3, $s3, 1
  mtc1 $v0, $f12
  li $v0, 2
  syscall
NAO_MULTIPLIQUE:
nop

# Avisando quando uma operacao invalida foi chamada
bne $0, $s3, NAO_AVISE
  li $v0, 4
  la $a0, AVISO
  syscall
NAO_AVISE:
nop


# Saindo programa
# ===============
#
li $v0, 10
syscall

# Definicoes auxiliares
# =====================
#

# Essa operacao realiza a soma de dois numeros em ponto flutuante, sendo um
# deles em $a0 e o outro em $a1. O resultado estará guardado em $v0.
SOMAR:
or $t7, $ra, $0

jal GET_EXP
ori $t0, $v0, 0
jal GET_MAN
ori $t2, $v0, 0
jal GET_SIGN
ori $t4, $v0, 0
ori $a0, $a1, 0
jal GET_EXP
ori $t1, $v0, 0
jal GET_MAN
ori $t3, $v0, 0
jal GET_SIGN
ori $t5, $v0, 0

add $v0, $t2, $t3
sll $v0, $v0, 23
# TODO Implement normalization when exponents are different
or $v0, $v0, $t1

or $ra, $t7, $0
jr $ra

# Essa operacao realiza a multiplicacao de dois numeros em ponto flutuante,
# sendo um deles em $a0 e o outro em $a1. O resultado estará guardado em $v0.
# TODO Fix me!
MULTIPLICAR:
or $t7, $ra, $0

jal GET_EXP
ori $t0, $v0, 0
jal GET_MAN
ori $t2, $v0, 0
jal GET_SIGN
ori $t4, $v0, 0
ori $a0, $a1, 0
jal GET_EXP
ori $t1, $v0, 0
jal GET_MAN
ori $t3, $v0, 0
jal GET_SIGN
ori $t5, $v0, 0

addu $t0, $t0, $t2
sll $t0, $t0, 23
mul $t1, $t1, $t3
beq $t4, $t5, MULTIPLICAR_SINAL_POSITIVO
j MULTIPLICAR_SINAL_NEGATIVO
MULTIPLICAR_SINAL_POSITIVO:
	li $t2, 0x0
	j RETORNO_MULTIPLICAR
MULTIPLICAR_SINAL_NEGATIVO:
	li $t2, 0x80000000

RETORNO_MULTIPLICAR:
or $v0, $t2, $t0
or $v0, $v0, $t1
or $ra, $t7, $0
jr $ra

# Operacoes de suporte
# --------------------

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

# Extrai a mantissa de um número em ponto flutuante simples guardado em $a0
# e o guarda em $v0.
GET_MAN:
andi $v0, $a0, 0x7fffff
jr $ra
