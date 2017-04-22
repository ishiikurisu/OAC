.eqv minx 0
.eqv miny 0
.eqv maxx 319
.eqv maxy 239
.eqv half $f31
.eqv linesize 320
.eqv dely $f4
.eqv delx $f5
.eqv delxyswap $f6
.eqv distline $f7
.data

COORD:.word 0,119,159,119
TOLERANCE:.float 40
CONSTHALF:.float 0.5

.text
la $t0,CONSTHALF
lw $t0,0($t0)
mtc1 $t0,half
j MAIN

############DROP BUCKET############
DROPBUCKET:                       #
addi $sp,$sp,-4                   #
sw $ra,0($sp)                     #
move $t0,$a2                      #
move $t1,$a3                      #
mul $a3,$a3,320                   #
add $a2,$a2,$a3                   #
addi $a2,$a2,0xff000000           #
lbu $a1,0($a2)                    #
move $a2,$t0                      #
move $a3,$t1                      #
jal SPLATTER                      #
lw $ra,0($sp)                     #
addi $sp,$sp,4                    #
jr $ra                            #
                                  #
SPLATTER:                         #
addi $sp,$sp,-12                  #
sw $ra,0($sp)                     #
sw $a2,4($sp)                     #
sw $a3,8($sp)                     #
mul $a3,$a3,320                   #
add $a2,$a2,$a3                   #
addi $a2,$a2,0xff000000           #
sb $a0,0($a2)                     #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
                                  #
addi $a2,$a2,1                    #
bgt $a2,maxx,SPLND                #
mul $t3,$a3,320                   #
add $t2,$a2,$t3                   #
addi $t2,$t2,0xff000000           #
lbu $t0,0($t2)                    #
bne $t0,$a1,SPLND                 #
jal SPLATTER                      #
SPLND:                            #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
                                  #
addi $a2,$a2,-1                   #
blt $a2,minx,SPLNA                #
mul $t3,$a3,320                   #
add $t2,$a2,$t3                   #
addi $t2,$t2,0xff000000           #
lbu $t0,0($t2)                    #
bne $t0,$a1,SPLNA                 #
jal SPLATTER                      #
SPLNA:                            #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
                                  #
addi $a3,$a3,1                    #
bgt $a3,maxy,SPLNS                #
mul $t3,$a3,320                   #
add $t2,$a2,$t3                   #
addi $t2,$t2,0xff000000           #
lbu $t0,0($t2)                    #
bne $t0,$a1,SPLNS                 #
jal SPLATTER                      #
SPLNS:                            #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
                                  #
addi $a3,$a3,-1                   #
blt $a3,miny,SPLNW                #
mul $t3,$a3,320                   #
add $t2,$a2,$t3                   #
addi $t2,$t2,0xff000000           #
lbu $t0,0($t2)                    #
bne $t0,$a1,SPLNW                 #
jal SPLATTER                      #
SPLNW:                            #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
                                  #
lw $ra,0($sp)                     #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
addi $sp,$sp,12                   #
jr $ra                            #
############DROP BUCKET############

ARGTOCOORD:
la $t5,COORD
sw $t0,0($t5)
sw $t1,4($t5)
sw $t2,8($t5)
sw $t3,12($t5)
mtc1 $t4,$f11
cvt.s.w $f11,$f11
swc1 $f11,TOLERANCE
jr $ra


COORDTOFLOAT:  #moves pixel coordinates to floating point coordinates
la $t1,COORD
lw $t0,0($t1)
mtc1 $t0,$f0
lw $t0,4($t1)
mtc1 $t0,$f1
lw $t0,8($t1)
mtc1 $t0,$f2
lw $t0,12($t1)
mtc1 $t0,$f3
cvt.s.w $f0,$f0
cvt.s.w $f1,$f1
cvt.s.w $f2,$f2
cvt.s.w $f3,$f3
add.s $f0,$f0,half
add.s $f1,$f1,half
add.s $f2,$f2,half
add.s $f3,$f3,half
jr $ra

CALCCONST:    #calculates distance from point to line constants based on coordinates
sub.s $f4,$f3,$f1
sub.s $f5,$f2,$f0
mul.s $f6,$f2,$f1
mul.s $f7,$f0,$f3
sub.s $f6,$f6,$f7
mul.s $f7,dely,dely
mul.s $f8,delx,delx
add.s $f7,$f7,$f8
sqrt.s $f7,$f7
jr $ra

############LINE PRINT############
CALCDIST:                        #calculates distance from point to line
mul.s $f10,$f8,dely              #
mul.s $f11,$f9,delx              #
sub.s $f10,$f10,$f11             #
add.s $f10,$f10,delxyswap        #
div.s $f10,$f10,distline         #
abs.s $f10,$f10                  #
jr $ra                           #
                                 #
                                 #
PRINTLINE:                       #
addi $sp,$sp,-20                 #
sw $ra,0($sp)                    #
sw $s0,4($sp)                    #
sw $s1,8($sp)                    #
sw $s2,12($sp)                   #
sw $s3,16($sp)                   #
la $t0,TOLERANCE                 #
lwc1 $f30,($t0)                  #
                                 #
sub.s $f11,$f0,$f30              #
floor.w.s $f11,$f11              #
mfc1 $t0,$f11                    #
slti $t9,$t0,minx                #
beqz $t9,X1NS                    #
addi $t0,$0,minx                 #
X1NS:                            #
                                 #
sub.s $f11,$f1,$f30              #
floor.w.s $f11,$f11              #
mfc1 $t1,$f11                    #
slti $t9,$t1,miny                #
beqz $t9,Y1NS                    #
addi $t1,$0,miny                 #
Y1NS:                            #
                                 #
sub.s $f11,$f2,$f30              #
floor.w.s $f11,$f11              #
                                 #
                                 #
mfc1 $t2,$f11                    #
slti $t9,$t2,minx                #
beqz $t9,X2NS                    #
addi $t2,$0,minx                 #
X2NS:                            #
                                 #
sub.s $f11,$f3,$f30              #
floor.w.s $f11,$f11              #
mfc1 $t3,$f11                    #
slti $t9,$t3,miny                #
beqz $t9,Y2NS                    #
addi $t3,$0,miny                 #
Y2NS:                            #
                                 #
slt $t9,$t0,$t2                  #
beqz $t9, X2TOX1                 #
X1TOX2:                          #
move $s0,$t0                     #
add.s $f11,$f2,$f30              #
ceil.w.s $f11,$f11               #
mfc1 $t2,$f11                    #
li $t9,maxx                      #
slt $t9,$t9,$t2                  #
beqz $t9,X2NB                    #
addi $t2,$0,maxx                 #
X2NB:                            #
move $s2,$t2                     #
j XDONE                          #
X2TOX1:                          #
move $s0,$t2                     #
add.s $f11,$f0,$f30              #
ceil.w.s $f11,$f11               #
mfc1 $t0,$f11                    #
li $t9,maxx                      #
                                 #
slt $t9,$t9,$t0                  #
beqz $t9,X1NB                    #
addi $t0,$0,maxx                 #
X1NB:                            #
move $s2,$t0                     #
j XDONE                          #
XDONE:                           #
                                 #
slt $t9,$t1,$t3                  #
beqz $t9, Y2TOY1                 #
Y1TOY2:                          #
move $s1,$t1                     #
add.s $f11,$f3,$f30              #
ceil.w.s $f11,$f11               #
mfc1 $t3,$f11                    #
li $t9,maxy                      #
slt $t9,$t9,$t3                  #
beqz $t9,Y2NB                    #
addi $t3,$0,maxy                 #
Y2NB:                            #
move $s3,$t3                     #
j YDONE                          #
Y2TOY1:                          #
move $s1,$t3                     #
add.s $f11,$f1,$f30              #
ceil.w.s $f11,$f11               #
mfc1 $t1,$f11                    #
li $t9,maxy                      #
slt $t9,$t9,$t1                  #
beqz $t9,Y1NB                    #
addi $t1,$0,maxy                 #
Y1NB:                            #
move $s3,$t1                     #
j YDONE                          #
YDONE:                           #
                                 #
move $t2,$s1                     #
PUTALINELOOP:                    #
bgt $t2,$s3,FINLINELOOP          #
move $t1,$s0                     #
                                 #
PUTACOLLOOP:                     #
bgt $t1,$s2,FINCOLLOOP           #
mtc1 $t1,$f8                     #
mtc1 $t2,$f9                     #
cvt.s.w $f8,$f8                  #
cvt.s.w $f9,$f9                  #
add.s $f8,$f8,half               #
add.s $f9,$f9,half               #
jal CALCDIST                     #
la $t9,TOLERANCE                 #
lw $t9,0($t9)                    #
mtc1 $t9,$f11                    #
c.le.s $f10,$f11                 #
bc1t PIXIN                       #
j PIXOUT                         #
PIXIN:                           #
mul $t9,$t2,linesize             #
addi $t9,$t9,0xff000000          #
add $t9,$t9,$t1                  #
sb $a0,0($t9)                    #
PIXOUT:                          #
addi $t1,$t1,1                   #
j PUTACOLLOOP                    #
FINCOLLOOP:                      #
                                 #
addi $t2,$t2,1                   #
j PUTALINELOOP                   #
FINLINELOOP:                     #
lw $ra,0($sp)                    #
lw $s0,4($sp)                    #
lw $s1,8($sp)                    #
lw $s2,12($sp)                   #
lw $s3,16($sp)                   #
addi $sp,$sp,20                  #
jr $ra                           #
############LINE PRINT############

############LINE PROCESS############
LINEPROC:
addi $sp,$sp,-4
sw $ra,0($sp)
jal ARGTOCOORD
jal COORDTOFLOAT
jal CALCCONST
jal PRINTLINE
lw $ra,0($sp)
addi $sp,$sp,4
jr $ra
############LINE PROCESS############

##########################
##########################
############UK############
##########################
##########################
PRINTUKFLAG:             #
addi $sp,$sp,-4          #
sw $ra,0($sp)            #
                         #
li $a0,128               #
li $a2,0                 #
li $a3,0                 #
jal DROPBUCKET           #
                         #
li $a0,255               #
li $t0,0                 #
li $t1,0                 #
li $t2,319               #
li $t3,239               #
li $t4,20                #
jal LINEPROC             #
                         #
li $a0,255               #
li $t0,319               #
li $t1,0                 #
li $t2,0                 #
li $t3,239               #
li $t4,20                #
jal LINEPROC             #
                         #
li $a0,6                 #
li $t0,0                 #
li $t1,0                 #
li $t2,319               #
li $t3,239               #
li $t4,10                #
jal LINEPROC             #
                         #
li $a0,6                 #
li $t0,319               #
li $t1,0                 #
li $t2,0                 #
li $t3,239               #
li $t4,10                #
jal LINEPROC             #
                         #
li $a0,255               #
li $t0,159               #
li $t1,0                 #
li $t2,159               #
li $t3,239               #
li $t4,40                #
jal LINEPROC             #
                         #
li $a0,255               #
li $t0,0                 #
li $t1,119               #
li $t2,319               #
li $t3,119               #
li $t4,40                #
jal LINEPROC             #
                         #
li $a0,6                 #
li $t0,159               #
li $t1,0                 #
li $t2,159               #
li $t3,239               #
li $t4,20                #
jal LINEPROC             #
                         #
li $a0,6                 #
li $t0,0                 #
li $t1,119               #
li $t2,319               #
li $t3,119               #
li $t4,20                #
jal LINEPROC             #
                         #
lw $ra,0($sp)            #
addi $sp,$sp,4           #
jr $ra                   #
##########################
##########################
############UK############
##########################
##########################

##############################
##############################
############FRANCE############
##############################
##############################
PRINTFRANCEFLAG:
addi $sp,$sp,-4
sw $ra,0($sp)

li $a0,255
li $t0,160
li $t1,0
li $t2,160
li $t3,239
li $t4,53
jal LINEPROC

li $a0,128
li $t0,53
li $t1,0
li $t2,53
li $t3,239
li $t4,54
jal LINEPROC

li $a0,6
li $t0,267
li $t1,0
li $t2,267
li $t3,239
li $t4,54
jal LINEPROC

lw $ra,0($sp)
addi $sp,$sp,4
jr $ra
##############################
##############################
############FRANCE############
##############################
##############################

##############################
##############################
############BRAZIL############
##############################
##############################
PRINTBRAZILFLAG:
addi $sp,$sp,-4
sw $ra,0($sp)

li $a0,40
li $a2,0
li $a3,0
jal DROPBUCKET

li $a0,54
li $t0,159
li $t1,0
li $t2,319
li $t3,119
li $t4,1
jal LINEPROC

li $a0,54
li $t0,319
li $t1,119
li $t2,159
li $t3,239
li $t4,1
jal LINEPROC

li $a0,54
li $t0,159
li $t1,239
li $t2,0
li $t3,119
li $t4,1
jal LINEPROC

li $a0,54
li $t0,0
li $t1,119
li $t2,159
li $t3,0
li $t4,1
jal LINEPROC

li $a0,54
li $a2,159
li $a3,119
jal DROPBUCKET

lw $ra,0($sp)
addi $sp,$sp,4
jr $ra
##############################
##############################
############BRAZIL############
##############################
##############################


##############################
##############################
############SWEDEN############
##############################
##############################
PRINTSWEDENFLAG:
addi $sp,$sp,-4
sw $ra,0($sp)

li $a0,208
li $a2,159
li $a3,119
jal DROPBUCKET

li $a0,54
li $t0,119
li $t1,0
li $t2,119
li $t3,239
li $t4,30
jal LINEPROC

li $a0,54
li $t0,0
li $t1,119
li $t2,319
li $t3,119
li $t4,30
jal LINEPROC

lw $ra,0($sp)
addi $sp,$sp,4
jr $ra
##############################
##############################
############SWEDEN############
##############################
##############################

##############################
##############################
############ISRAEL############
##############################
##############################
PRINTISRAELFLAG:
addi $sp,$sp,-4
sw $ra,0($sp)

li $a0,255
li $a2,159
li $a3,119
jal DROPBUCKET

li $a0,128
li $t0,0
li $t1,30
li $t2,319
li $t3,30
li $t4,10
jal LINEPROC

li $a0,128
li $t0,0
li $t1,210
li $t2,319
li $t3,210
li $t4,10
jal LINEPROC

li $a0,128
li $t0,159
li $t1,50
li $t2,219
li $t3,155
li $t4,5
jal LINEPROC

li $a0,128
li $t0,219
li $t1,155
li $t2,99
li $t3,155
li $t4,5
jal LINEPROC

li $a0,128
li $t0,99
li $t1,155
li $t2,159
li $t3,50
li $t4,5
jal LINEPROC

li $a0,128
li $t0,159
li $t1,190
li $t2,101
li $t3,85
li $t4,5
jal LINEPROC

li $a0,128
li $t0,101
li $t1,85
li $t2,221
li $t3,85
li $t4,5
jal LINEPROC

li $a0,128
li $t0,221
li $t1,85
li $t2,159
li $t3,190
li $t4,5
jal LINEPROC

lw $ra,0($sp)
addi $sp,$sp,4
jr $ra
##############################
##############################
############ISRAEL############
##############################
##############################

MAIN:
jal PRINTISRAELFLAG
