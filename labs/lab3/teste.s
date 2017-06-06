ADD:
li $t0,1
li $t1,4
add $t0,$t0,$t1
beq $t0,5,MUL
jal FU
MUL:
li $t0,2
li $t1,4
mul $t0,$t0,$t1
beq $t0,8,SUB
jal FU
SUB:
li $t0,1
li $t1,4
sub $t0,$t0,$t1
beq $t0,-3,AND
jal FU
AND:
li $t0,1
li $t1,4
and $t0,$t0,$t1
beq $t0,0,OR
jal FU
OR:
li $t0,1
li $t1,4
or $t0,$t0,$t1
beq $t0,5,MFHI
jal FU
MFHI:
mfhi $t0
beq $t0,0,MFLO
jal FU
MFLO:
mflo $t0
beq $t0,8,SLL
jal FU
SLL:
li $t0,1
sll $t0,$t0,3
beq $t0,8,SRL
jal FU
SRL:
li $t0,8
srl $t0,$t0,3
beq $t0,1,SRA
jal FU
SRA:
li $t0,8
sra $t0,$t0,3
beq $t0,1,SRAV
jal FU
SRAV:
li $t0,8
li $t1,3
srav $t0,$t0,$t1
beq $t0,1,SLLV
jal FU
SLLV:
li $t0,1
li $t1,3
sllv $t0,$t0,$t1
beq $t0,8,SRLV
jal FU
SRLV:
li $t0,8
li $t1,3
srlv $t0,$t0,$t1
beq $t0,1,XOR
jal FU
XOR:
li $t0,8
li $t1,3
xor $t0,$t0,$t1
beq $t0,11,NOR
jal FU
NOR:
li $t0,8
li $t1,3
nor $t0,$t0,$t1
beq $t0,0xFFFFFFF4,SRL
jal FU
FU:
