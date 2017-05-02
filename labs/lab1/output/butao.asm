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

COORD:.float 160.5,120.5,160.6,120.5
TOLERANCE:.float 0.0005
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
mul $a3,$a3,linesize              #
add $a2,$a2,$a3                   #
addi $a2,$a2,0xff000000           #
lbu $a1,0($a2)                    #
move $a2,$t0                      #
move $a3,$t1                      #
beq $a0,$a1,FUCKOFF               #
jal SPLATTER                      #
FUCKOFF:                          #
lw $ra,0($sp)                     #
addi $sp,$sp,4                    #
jr $ra                            #
                                  #
SPLATTER:                         #
addi $sp,$sp,-12                  #
sw $ra,0($sp)                     #
sw $a2,4($sp)                     #
sw $a3,8($sp)                     #
mul $a3,$a3,linesize              #
add $a2,$a2,$a3                   #
addi $a2,$a2,0xff000000           #
sb $a0,0($a2)                     #
lw $a2,4($sp)                     #
lw $a3,8($sp)                     #
                                  #
addi $a2,$a2,1                    #
bgt $a2,maxx,SPLND                #
mul $t3,$a3,linesize              #
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
mul $t3,$a3,linesize              #
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
mul $t3,$a3,linesize              #
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
mul $t3,$a3,linesize              #
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

ARGTOCOORD:  #moves arguments of function to COORD data adress
la $t9,COORD
sw $t0,0($t9)
sw $t1,4($t9)
sw $t2,8($t9)
sw $t3,12($t9)
mtc1 $t4,$f11
cvt.s.w $f11,$f11
li $t9,8
mtc1 $t9,$f10
cvt.s.w $f10,$f10
div.s $f11,$f11,$f10
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
li $t0,8
mtc1 $t0,$f5
cvt.s.w $f5,$f5
div.s $f0,$f0,$f5
div.s $f1,$f1,$f5
div.s $f2,$f2,$f5
div.s $f3,$f3,$f5
add.s $f0,$f0,half
add.s $f1,$f1,half
add.s $f2,$f2,half
add.s $f3,$f3,half
jr $ra

SETMARGIN:    #sets margin for eliptic ploting
mtc1 $t5,$f4
li $t5,8
mtc1 $t5,$f5
cvt.s.w $f4,$f4
cvt.s.w $f5,$f5
div.s $f4,$f4,$f5
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
LINEPROC:                          #
addi $sp,$sp,-4                    #
sw $ra,0($sp)                      #
jal ARGTOCOORD                     #
jal COORDTOFLOAT                   #
jal CALCCONST                      #
jal PRINTLINE                      #
lw $ra,0($sp)                      #
addi $sp,$sp,4                     #
jr $ra                             #
############LINE PROCESS############

############ELIPSE PRINT##########
CALCDISTE:                       #calculates magin from point to elipsis
sub.s $f10,$f0,$f8               #
sub.s $f11,$f1,$f9               #
mul.s $f10,$f10,$f10             #
mul.s $f11,$f11,$f11             #
add.s $f10,$f10,$f11             #
sqrt.s $f10,$f10                 #
abs.s $f12,$f10                  #
                                 #
sub.s $f10,$f2,$f8               #
sub.s $f11,$f3,$f9               #
mul.s $f10,$f10,$f10             #
mul.s $f11,$f11,$f11             #
add.s $f10,$f10,$f11             #
sqrt.s $f10,$f10                 #
abs.s $f13,$f10                  #
                                 #
add.s $f10,$f12,$f13             #
sub.s $f10,$f10,$f4              #
abs.s $f10,$f10                  #
jr $ra                           #
                                 #
                                 #
PRINTELIPSE:                     #
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
sub.s $f11,$f11,$f4              #
floor.w.s $f11,$f11              #
mfc1 $t0,$f11                    #
slti $t9,$t0,minx                #
beqz $t9,X1NSE                   #
addi $t0,$0,minx                 #
X1NSE:                           #
                                 #
sub.s $f11,$f1,$f30              #
sub.s $f11,$f11,$f4              #
floor.w.s $f11,$f11              #
mfc1 $t1,$f11                    #
slti $t9,$t1,miny                #
beqz $t9,Y1NSE                   #
addi $t1,$0,miny                 #
Y1NSE:                           #
                                 #
sub.s $f11,$f2,$f30              #
sub.s $f11,$f11,$f4              #
floor.w.s $f11,$f11              #
mfc1 $t2,$f11                    #
slti $t9,$t2,minx                #
beqz $t9,X2NSE                   #
addi $t2,$0,minx                 #
X2NSE:                           #
                                 #
sub.s $f11,$f3,$f30              #
sub.s $f11,$f11,$f4              #
floor.w.s $f11,$f11              #
mfc1 $t3,$f11                    #
slti $t9,$t3,miny                #
beqz $t9,Y2NSE                   #
addi $t3,$0,miny                 #
Y2NSE:                           #
                                 #
slt $t9,$t0,$t2                  #
beqz $t9, X2TOX1E                #
X1TOX2E:                         #
move $s0,$t0                     #
add.s $f11,$f2,$f30              #
add.s $f11,$f11,$f4              #
ceil.w.s $f11,$f11               #
mfc1 $t2,$f11                    #
li $t9,maxx                      #
slt $t9,$t9,$t2                  #
beqz $t9,X2NBE                   #
addi $t2,$0,maxx                 #
X2NBE:                           #
move $s2,$t2                     #
j XDONEE                         #
X2TOX1E:                         #
move $s0,$t2                     #
add.s $f11,$f0,$f30              #
add.s $f11,$f11,$f4              #
ceil.w.s $f11,$f11               #
mfc1 $t0,$f11                    #
li $t9,maxx                      #
slt $t9,$t9,$t0                  #
beqz $t9,X1NBE                   #
addi $t0,$0,maxx                 #
X1NBE:                           #
move $s2,$t0                     #
j XDONEE                         #
XDONEE:                          #
                                 #
slt $t9,$t1,$t3                  #
beqz $t9, Y2TOY1E                #
Y1TOY2E:                         #
move $s1,$t1                     #
add.s $f11,$f3,$f30              #
add.s $f11,$f11,$f4              #
ceil.w.s $f11,$f11               #
mfc1 $t3,$f11                    #
li $t9,maxy                      #
slt $t9,$t9,$t3                  #
beqz $t9,Y2NBE                   #
addi $t3,$0,maxy                 #
Y2NBE:                           #
move $s3,$t3                     #
j YDONEE                         #
Y2TOY1E:                         #
move $s1,$t3                     #
add.s $f11,$f1,$f30              #
add.s $f11,$f11,$f4              #
ceil.w.s $f11,$f11               #
mfc1 $t1,$f11                    #
li $t9,maxy                      #
slt $t9,$t9,$t1                  #
beqz $t9,Y1NBE                   #
addi $t1,$0,maxy                 #
Y1NBE:                           #
move $s3,$t1                     #
j YDONEE                         #
YDONEE:                          #
                                 #
move $t2,$s1                     #
PUTALINELOOPE:                   #
bgt $t2,$s3,FINLINELOOPE         #
move $t1,$s0                     #
                                 #
PUTACOLLOOPE:                    #
bgt $t1,$s2,FINCOLLOOPE          #
mtc1 $t1,$f8                     #
mtc1 $t2,$f9                     #
cvt.s.w $f8,$f8                  #
cvt.s.w $f9,$f9                  #
add.s $f8,$f8,half               #
add.s $f9,$f9,half               #
jal CALCDISTE                    #
la $t9,TOLERANCE                 #
lw $t9,0($t9)                    #
mtc1 $t9,$f11                    #
c.le.s $f10,$f11                 #
bc1t PIXINE                      #
j PIXOUTE                        #
PIXINE:                          #
mul $t9,$t2,linesize             #
addi $t9,$t9,0xff000000          #
add $t9,$t9,$t1                  #
sb $a0,0($t9)                    #
PIXOUTE:                         #
addi $t1,$t1,1                   #
j PUTACOLLOOPE                   #
FINCOLLOOPE:                     #
                                 #
addi $t2,$t2,1                   #
j PUTALINELOOPE                  #
FINLINELOOPE:                    #
lw $ra,0($sp)                    #
lw $s0,4($sp)                    #
lw $s1,8($sp)                    #
lw $s2,12($sp)                   #
lw $s3,16($sp)                   #
addi $sp,$sp,20                  #
jr $ra                           #
############ELIPSE PRINT##########

############ELIPSE PROCESS############
ELIPSEPROC:                          #
addi $sp,$sp,-4                      #
sw $ra,0($sp)                        #
jal ARGTOCOORD                       #
jal COORDTOFLOAT                     #
jal SETMARGIN                        #
jal PRINTELIPSE                      #
lw $ra,0($sp)                        #
addi $sp,$sp,4                       #
jr $ra                               #
############ELIPSE PROCESS############

############CIRCLE PROCESS############
CIRCLEPROC:                          #
addi $sp,$sp,-4                      #
sw $ra,0($sp)                        #
mul $t4,$t2,2                        #
mul $t5,$t3,16                       #
move $t2,$t0                         #
move $t3,$t1                         #
jal ELIPSEPROC                       #
lw $ra,0($sp)                        #
addi $sp,$sp,4                       #
jr $ra                               #
############CIRCLE PROCESS############

############DOT PRINT#############
CALCDISTDOT:                     #calculates distance from point to point
sub.s $f10,$f0,$f2               #
sub.s $f11,$f1,$f3               #
mul.s $f10,$f10,$f10             #
mul.s $f11,$f11,$f11             #
add.s $f10,$f10,$f11             #
sqrt.s $f10,$f10                 #
abs.s $f10,$f10                  #
jr $ra                           #
                                 #
                                 #
PRINTDOT:                        #
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
beqz $t9,XNSDOT                  #
addi $t0,$0,minx                 #
XNSDOT:                          #
                                 #
sub.s $f11,$f1,$f30              #
floor.w.s $f11,$f11              #
mfc1 $t1,$f11                    #
slti $t9,$t1,miny                #
beqz $t9,YNSDOT                  #
addi $t1,$0,miny                 #
YNSDOT:                          #
                                 #
move $s0,$t0                     #
add.s $f11,$f0,$f30              #
ceil.w.s $f11,$f11               #
mfc1 $t2,$f11                    #
li $t9,maxx                      #
slt $t9,$t9,$t2                  #
beqz $t9,XNBDOT                  #
addi $t2,$0,maxx                 #
XNBDOT:                          #
move $s2,$t2                     #
                                 #
move $s1,$t1                     #
add.s $f11,$f1,$f30              #
ceil.w.s $f11,$f11               #
mfc1 $t3,$f11                    #
li $t9,maxy                      #
slt $t9,$t9,$t3                  #
beqz $t9,YNBDOT                  #
addi $t3,$0,maxy                 #
YNBDOT:                          #
move $s3,$t3                     #
                                 #
move $t2,$s1                     #
PUTALINELOOPDOT:                 #
bgt $t2,$s3,FINLINELOOPDOT       #
move $t1,$s0                     #
                                 #
PUTACOLLOOPDOT:                  #
bgt $t1,$s2,FINCOLLOOPDOT        #
mtc1 $t1,$f2                     #
mtc1 $t2,$f3                     #
cvt.s.w $f2,$f2                  #
cvt.s.w $f3,$f3                  #
add.s $f2,$f2,half               #
add.s $f3,$f3,half               #
jal CALCDISTDOT                  #
la $t9,TOLERANCE                 #
lw $t9,0($t9)                    #
mtc1 $t9,$f11                    #
c.le.s $f10,$f11                 #
bc1t PIXINDOT                    #
j PIXOUTDOT                      #
PIXINDOT:                        #
mul $t9,$t2,linesize             #
addi $t9,$t9,0xff000000          #
add $t9,$t9,$t1                  #
sb $a0,0($t9)                    #
PIXOUTDOT:                       #
addi $t1,$t1,1                   #
j PUTACOLLOOPDOT                 #
FINCOLLOOPDOT:                   #
                                 #
addi $t2,$t2,1                   #
j PUTALINELOOPDOT                #
FINLINELOOPDOT:                  #
lw $ra,0($sp)                    #
lw $s0,4($sp)                    #
lw $s1,8($sp)                    #
lw $s2,12($sp)                   #
lw $s3,16($sp)                   #
addi $sp,$sp,20                  #
jr $ra                           #
############DOT PRINT#############

############DOT PROCESS###############
DOTPROC:                             #
addi $sp,$sp,-4                      #
sw $ra,0($sp)                        #
jal ARGTOCOORD                       #
jal COORDTOFLOAT                     #
jal PRINTDOT                         #
lw $ra,0($sp)                        #
addi $sp,$sp,4                       #
jr $ra                               #
############DOT PROCESS###############

###########POLY PROCESS####
POLYPROC:                 #
#a0 stores the colour     #
#a1 stores tolerance      #
#a2: the amount of points #
#points: stack            #
                          #
                          #
li $t6, 1                 #
                          #
addi $sp,$sp,-8           #
sw $ra,0($sp)             #
sw $s7,4($sp)             #
addi $s7,$sp,8            #
                          #
POLYLOOP:                 #
                          #
lw $t0,0($s7)             #
lw $t1,4($s7)             #
lw $t2,8($s7)             #
lw $t3,12($s7)            #
move $t4,$a1              #
jal LINEPROC              #
                          #
addi $t6,$t6,1            #
addi $s7,$s7,8            #
bne $t6,$a2,POLYLOOP      #
                          #
lw $t0,0($s7)             #
lw $t1,4($s7)             #
lw $t2,8($sp)             #
lw $t3,12($sp)            #
move $t4,$a1              #
jal LINEPROC              #
                          #
mul $t4,$a2,8             #
                          #
lw $ra,0($sp)             #
lw $s7,4($sp)             #
addi $sp,$sp,8            #
add $sp,$sp,$t4           #
                          #
jr $ra                    #
                          #
##########POLY PROCESS#####

############TRI PROCESS###############
TRIPROC:                             #
addi $sp,$sp,-4                      #
sw $ra,0($sp)                        #
mtc1 $t0,$f0                         #
cvt.s.w $f0,$f0                      #
mtc1 $t1,$f1                         #
cvt.s.w $f1,$f1                      #
mtc1 $t2,$f2                         #
cvt.s.w $f2,$f2                      #
move $a1,$t4                         #
li $a2,3                             #
li $t9,2                             #
mtc1 $t9,$f3                         #
cvt.s.w $f3,$f3                      #
div.s $f3,$f2,$f3                    #
li $t9,3                             #
mtc1 $t9,$f5                         #
cvt.s.w $f5,$f5                      #
div.s $f4,$f3,$f5                    #
sqrt.s $f6,$f5                       #
mul.s $f4,$f4,$f6                    #
add.s $f5,$f0,$f3                    #
add.s $f6,$f1,$f4                    #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
sub.s $f5,$f1,$f4                    #
sub.s $f6,$f5,$f4                    #
mfc1 $t9,$f0                         #
mtc1 $t9,$f5                         #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
sub.s $f5,$f0,$f3                    #
add.s $f6,$f1,$f4                    #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
jal POLYPROC                         #
lw $ra,0($sp)                        #
addi $sp,$sp,4                       #
jr $ra                               #
############TRI PROCESS###############

############QUAD PROCESS##############
QUADPROC:                            #
addi $sp,$sp,-4                      #
sw $ra,0($sp)                        #
mtc1 $t0,$f0                         #
cvt.s.w $f0,$f0                      #
mtc1 $t1,$f1                         #
cvt.s.w $f1,$f1                      #
mtc1 $t2,$f2                         #
cvt.s.w $f2,$f2                      #
move $a1,$t4                         #
li $a2,4                             #
li $t9,2                             #
mtc1 $t9,$f3                         #
cvt.s.w $f3,$f3                      #
div.s $f3,$f2,$f3                    #
add.s $f5,$f0,$f3                    #
add.s $f6,$f1,$f3                    #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
sub.s $f6,$f1,$f3                    #
add.s $f5,$f0,$f3                    #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
sub.s $f5,$f0,$f3                    #
sub.s $f6,$f1,$f3                    #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
sub.s $f5,$f0,$f3                    #
add.s $f6,$f1,$f3                    #
cvt.w.s $f5,$f5                      #
cvt.w.s $f6,$f6                      #
addi $sp,$sp,-8                      #
swc1 $f5,0($sp)                      #
swc1 $f6,4($sp)                      #
jal POLYPROC                         #
lw $ra,0($sp)                        #
addi $sp,$sp,4                       #
jr $ra                               #
############QUAD PROCESS##############

############CHAR R############
PRINTCHARR:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#R                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,32              #
addi $t3,$a2,32              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,32              #
addi $t1,$a2,40              #
addi $t2,$a1,0               #
addi $t3,$a2,40              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,40              #
addi $t2,$a1,40              #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
#R                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR R############

############CHAR D############
PRINTCHARD:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#D                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,32              #
addi $t3,$a2,32              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,40              #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
#D                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR D############

############CHAR P############
PRINTCHARP:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#P                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,32              #
addi $t3,$a2,32              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,32              #
addi $t1,$a2,40              #
addi $t2,$a1,0               #
addi $t3,$a2,40              #
move $t4,$a3                 #
jal LINEPROC                 #
#P                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR P############

############CHAR E############
PRINTCHARE:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#E                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,40              #
addi $t3,$a2,0               #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,80              #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,40              #
addi $t2,$a1,0               #
addi $t3,$a2,40              #
move $t4,$a3                 #
jal LINEPROC                 #
#E                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR E############

############CHAR O############
PRINTCHARO:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#O                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,32              #
addi $t3,$a2,0               #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,32              #
addi $t1,$a2,80              #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,0               #
addi $t2,$a1,40              #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
#O                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR O############

############CHAR S############
PRINTCHARS:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#S                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,32              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,32              #
addi $t3,$a2,0               #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,40              #
addi $t2,$a1,32              #
addi $t3,$a2,40              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,40              #
addi $t2,$a1,40              #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,32              #
addi $t1,$a2,80              #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
#S                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR S############

############CHAR G############
PRINTCHARG:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#G                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,32              #
addi $t3,$a2,0               #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,32              #
addi $t1,$a2,80              #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,40              #
addi $t2,$a1,40              #
addi $t3,$a2,72              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,32              #
addi $t1,$a2,40              #
addi $t2,$a1,24              #
addi $t3,$a2,40              #
move $t4,$a3                 #
jal LINEPROC                 #
#G                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR G############

############CHAR M############
PRINTCHARM:                  #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#M                           #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,0               #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,0               #
addi $t1,$a2,0               #
addi $t2,$a1,8               #
addi $t3,$a2,8               #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,0               #
addi $t2,$a1,24              #
addi $t3,$a2,16              #
move $t4,$a3                 #
jal LINEPROC                 #
                             #
addi $t0,$a1,40              #
addi $t1,$a2,0               #
addi $t2,$a1,40              #
addi $t3,$a2,80              #
move $t4,$a3                 #
jal LINEPROC                 #
#M                           #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############CHAR M############

############################
############################
############BUTAO###########
############################
############################
PRINTBUTAOFLAG:            #
addi $sp,$sp,-4            #
sw $ra,0($sp)              #
                           #
li $a0,6                   #red background
li $t0,1272                #
li $t1,952                 #
li $t4,8000                #
jal DOTPROC                #
                           #
li $a0,248                 #blue heart
li $a1,6                   #
li $a2,22                  #
li $t0,1272                #
li $t1,1912                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,472                 #
li $t1,1200                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,200                 #
li $t1,720                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,160                 #
li $t1,600                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,200                 #
li $t1,400                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,320                 #
li $t1,240                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,480                 #
li $t1,160                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,800                 #
li $t1,120                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1040                #
li $t1,160                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1120                #
li $t1,240                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1200                #
li $t1,360                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1272                #
li $t1,520                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1352                #
li $t1,360                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1432                #
li $t1,240                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1512                #
li $t1,160                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1752                #
li $t1,120                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2072                #
li $t1,160                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2232                #
li $t1,240                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2352                #
li $t1,400                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2392                #
li $t1,600                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2352                #
li $t1,720                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2072                #
li $t1,1200                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
jal POLYPROC               #
li $a0,248                 #blue heart print
li $a2,159                 #
li $a3,119                 #
jal DROPBUCKET             #
                           #
lw $ra,0($sp)              #
addi $sp,$sp,4             #
jr $ra                     #
############################
############################
############BUTAO###########
############################
############################

MAIN:
jal PRINTBUTAOFLAG
