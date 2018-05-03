.data
NUMERO_1: .asciiz "Digite o primeiro numero: "
NUMERO_2: .asciiz "Digite o segundo numero: "
OPERACAO: .asciiz "Escolha a operacao (+ ou *): "
AVISO: .asciiz "Operacao invalida escolhida!"

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
add $a0, $s0, $zero
add $a1, $s1, $zero
add $s2, $v0, $zero
add $s3, $0, $0

# TODO Comparar `char` em $s2 para saber se a operecao atual eh uma soma
addi $t0, $0, 43
bne $t0, $s2, NAO_SOME
  jal SOMAR
  addi $s3, $s3, 1
  mtc1 $v0, $f12
  li $v0, 2
  syscall
NAO_SOME:
nop

# TODO Comparar `char` em $s2 para saber se a operecao atual eh uma multiplicao
addi $t0, $0, 42
bne $t0, $s2, NAO_MULTIPLIQUE
  jal MULTIPLICAR
  addi $s3, $s3, 1
  mtc1 $v0, $f12
  li $v0, 2
  syscall
NAO_MULTIPLIQUE:
nop

# TODO Avisar quando uma operacao invalida foi chamada
bne $0, $s3, NAO_AVISE
  li $v0, 4
  la $a0, AVISO
  syscall
NAO_AVISE:
nop


# Saindo programa
# ===============
#
SAIDA:
li $v0, 10
syscall

# Definicoes auxiliares
# =====================
#

# Essa operacao realiza a soma de dois numeros em ponto flutuante, sendo um
# deles em $a0 e o outro em $a1. O resultado estará guardado em $v0.
#
SOMAR:
mtc1 $a0, $f0
mtc1 $a1, $f1
# TODO Implementar soma de verdade
add.s $f0, $f1, $f0
mfc1 $v0, $f0
jr $ra

# Essa operacao realiza a soma de dois numeros em ponto flutuante, sendo um
# deles em $a0 e o outro em $a1. O resultado estará guardado em $v0.
#
MULTIPLICAR:
mtc1 $a0, $f0
mtc1 $a1, $f1
# TODO Implementar multiplicacao de verdade
mul.s $f0, $f1, $f0
mfc1 $v0, $f0
jr $ra
