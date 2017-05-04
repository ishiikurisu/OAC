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
#a0 stores the colour     #
#a1 stores tolerance      #
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

############FLAG TEXT#########
PRINTBRAZILFLAGTEXT:         #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
#O                           #
li $a0,40                    #
li $a1,712                   #
li $a2,848                   #
li $a3,0                     #
jal PRINTCHARO               #
#O                           #
#R                           #
li $a0,40                    #
li $a1,776                   #
li $a2,856                   #
li $a3,0                     #
jal PRINTCHARR               #
#R                           #
#D                           #
li $a0,40                    #
li $a1,840                   #
li $a2,864                   #
li $a3,0                     #
jal PRINTCHARD               #
#D                           #
#E                           #
li $a0,40                    #
li $a1,904                   #
li $a2,872                   #
li $a3,0                     #
jal PRINTCHARE               #
#E                           #
#M                           #
li $a0,40                    #
li $a1,968                   #
li $a2,880                   #
li $a3,0                     #
jal PRINTCHARM               #
#M                           #
#E                           #
li $a0,40                    #
li $a1,1096                  #
li $a2,896                   #
li $a3,0                     #
jal PRINTCHARE               #
#E                           #
#P                           #
li $a0,40                    #
li $a1,1224                  #
li $a2,912                   #
li $a3,0                     #
jal PRINTCHARP               #
#P                           #
#R                           #
li $a0,40                    #
li $a1,1288                  #
li $a2,920                   #
li $a3,0                     #
jal PRINTCHARR               #
#R                           #
#O                           #
li $a0,40                    #
li $a1,1352                  #
li $a2,928                   #
li $a3,0                     #
jal PRINTCHARO               #
#O                           #
#G                           #
li $a0,40                    #
li $a1,1416                  #
li $a2,936                   #
li $a3,0                     #
jal PRINTCHARG               #
#G                           #
#R                           #
li $a0,40                    #
li $a1,1480                  #
li $a2,944                   #
li $a3,0                     #
jal PRINTCHARR               #
#R                           #
#E                           #
li $a0,40                    #
li $a1,1544                  #
li $a2,952                   #
li $a3,0                     #
jal PRINTCHARE               #
#E                           #
#S                           #
li $a0,40                    #
li $a1,1608                  #
li $a2,960                   #
li $a3,0                     #
jal PRINTCHARS               #
#S                           #
#S                           #
li $a0,40                    #
li $a1,1672                  #
li $a2,968                   #
li $a3,0                     #
jal PRINTCHARS               #
#S                           #
#O                           #
li $a0,40                    #
li $a1,1736                  #
li $a2,976                   #
li $a3,0                     #
jal PRINTCHARO               #
#O                           #
                             #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
############FLAG TEXT#########

##########################
##########################
############UK############
##########################
##########################
PRINTUKFLAG:             #
addi $sp,$sp,-4          #
sw $ra,0($sp)            #
                         #
li $a0,128               #blue background
li $t0,1272              #
li $t1,952               #
li $t4,8000              #
jal DOTPROC              #
                         #
li $a0,255               #white straps back
li $t0,0                 #
li $t1,0                 #
li $t2,2552              #
li $t3,1912              #
li $t4,160               #
jal LINEPROC             #
li $t0,2552              #
li $t1,0                 #
li $t2,0                 #
li $t3,1912              #
jal LINEPROC             #
                         #
li $a0,6                 #red straps back
li $t0,0                 #
li $t1,0                 #
li $t2,2552              #
li $t3,1912              #
li $t4,80                #
jal LINEPROC             #
li $t0,2552              #
li $t1,0                 #
li $t2,0                 #
li $t3,1912              #
jal LINEPROC             #
                         #
li $a0,255               #white straps front
li $t0,1272              #
li $t1,0                 #
li $t2,1272              #
li $t3,1912              #
li $t4,320               #
jal LINEPROC             #
li $t0,0                 #
li $t1,952               #
li $t2,2552              #
li $t3,952               #
jal LINEPROC             #
                         #
li $a0,6                 #red straps front
li $t0,1272              #
li $t1,0                 #
li $t2,1272              #
li $t3,1912              #
li $t4,160               #
jal LINEPROC             #
li $t0,0                 #
li $t1,952               #
li $t2,2552              #
li $t3,952               #
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
PRINTFRANCEFLAG:             #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
                             #
li $a0,255                   #three lines
li $t0,1280                  #
li $t1,0                     #
li $t2,1280                  #
li $t3,1912                  #
li $t4,424                   #
jal LINEPROC                 #
li $a0,128                   #
li $t0,424                   #
li $t1,0                     #
li $t2,424                   #
li $t3,1912                  #
li $t4,432                   #
jal LINEPROC                 #
li $a0,6                     #
li $t0,2136                  #
li $t1,0                     #
li $t2,2136                  #
li $t3,1912                  #
li $t4,432                   #
jal LINEPROC                 #
                             #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
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
PRINTBRAZILFLAG:             #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
                             #
li $a0,40                    #green background
li $t0,1272                  #
li $t1,952                   #
li $t4,8000                  #
jal DOTPROC                  #
                             #
li $a0,54                    #yellow diamond
li $t0,1272                  #
li $t1,0                     #
li $t2,2552                  #
li $t3,952                   #
li $t4,8                     #
jal LINEPROC                 #
li $t0,2552                  #
li $t1,952                   #
li $t2,1272                  #
li $t3,1912                  #
jal LINEPROC                 #
li $t0,1272                  #
li $t1,1912                  #
li $t2,0                     #
li $t3,952                   #
jal LINEPROC                 #
li $t0,0                     #
li $t1,952                   #
li $t2,1272                  #
li $t3,0                     #
jal LINEPROC                 #
li $a2,159                   #
li $a3,119                   #
jal DROPBUCKET               #
                             #
li $a0,128                   #blue circle
li $t0,1272                  #
li $t1,952                   #
li $t4,640                   #
jal DOTPROC                  #
                             #
li $a0,255                   #white strap
li $t0,640                   #
li $t1,880                   #
li $t2,1920                  #
li $t3,1040                  #
li $t4,80                    #
jal LINEPROC                 #
                             #
li $a0,54                    #cutting strap
li $t0,1272                  #
li $t1,952                   #
li $t2,8                     #
li $t3,81                    #
jal CIRCLEPROC               #
li $a2,70                    #
li $a3,100                   #
jal DROPBUCKET               #
li $a2,250                   #
li $a3,140                   #
jal DROPBUCKET               #
                             #
li $a0,255                   #make stars
li $t0,1496                  #
li $t1,856                   #
li $t4,24                    #
jal DOTPROC                  #
li $t0,1760                  #
li $t1,1168                  #
jal DOTPROC                  #
li $t0,1840                  #
li $t1,1144                  #
li $t4,16                    #
jal DOTPROC                  #
li $t0,1816                  #
li $t1,1240                  #
jal DOTPROC                  #
li $t0,1784                  #
li $t1,1288                  #
jal DOTPROC                  #
li $t0,1752                  #
li $t1,1336                  #
jal DOTPROC                  #
li $t0,1560                  #
li $t1,1360                  #
li $t4,24                    #
jal DOTPROC                  #
li $t0,1640                  #
li $t1,1280                  #
li $t4,16                    #
jal DOTPROC                  #
li $t0,1624                  #
li $t1,1344                  #
jal DOTPROC                  #
li $t0,1608                  #
li $t1,1424                  #
jal DOTPROC                  #
li $t0,1560                  #
li $t1,1280                  #
jal DOTPROC                  #
li $t0,1480                  #
li $t1,1296                  #
jal DOTPROC                  #
li $t0,1440                  #
li $t1,1120                  #
li $t4,24                    #
jal DOTPROC                  #
li $t0,1280                  #
li $t1,1480                  #
li $t4,8                     #
jal DOTPROC                  #
li $t0,1320                  #
li $t1,1344                  #
li $t4,16                    #
jal DOTPROC                  #
li $t0,1304                  #
li $t1,1224                  #
jal DOTPROC                  #
li $t0,1344                  #
li $t1,1264                  #
jal DOTPROC                  #
li $t0,1264                  #
li $t1,1280                  #
jal DOTPROC                  #
li $t0,1296                  #
li $t1,1312                  #
li $t4,8                     #
jal DOTPROC                  #
li $t0,1120                  #
li $t1,1160                  #
li $t4,24                    #
jal DOTPROC                  #
li $t0,920                   #
li $t1,1240                  #
jal DOTPROC                  #
li $t0,760                   #
li $t1,1080                  #
jal DOTPROC                  #
li $t0,880                   #
li $t1,1320                  #
li $t4,8                     #
jal DOTPROC                  #
li $t0,984                   #
li $t1,1184                  #
li $t4,16                    #
jal DOTPROC                  #
li $t0,1104                  #
li $t1,1280                  #
jal DOTPROC                  #
li $t0,1096                  #
li $t1,1328                  #
jal DOTPROC                  #
li $t0,1144                  #
li $t1,1344                  #
jal DOTPROC                  #final star
                             #
jal PRINTBRAZILFLAGTEXT      #write in strap
                             #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
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
PRINTSWEDENFLAG:             #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
                             #
li $a0,208                   #blue background
li $t0,1272                  #
li $t1,952                   #
li $t4,8000                  #
jal DOTPROC                  #
                             #
li $a0,54                    #yellow straps
li $t0,952                   #
li $t1,0                     #
li $t2,952                   #
li $t3,1912                  #
li $t4,240                   #
jal LINEPROC                 #
li $t0,0                     #
li $t1,952                   #
li $t2,2552                  #
li $t3,952                   #
jal LINEPROC                 #
                             #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
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
PRINTISRAELFLAG:             #
addi $sp,$sp,-4              #
sw $ra,0($sp)                #
                             #
li $a0,255                   #white background
li $t0,1272                  #
li $t1,952                   #
li $t4,8000                  #
jal DOTPROC                  #
                             #
li $a0,128                   #blue straps
li $t0,0                     #
li $t1,240                   #
li $t2,2552                  #
li $t3,240                   #
li $t4,80                    #
jal LINEPROC                 #
li $t0,0                     #
li $t1,1680                  #
li $t2,2552                  #
li $t3,1680                  #
jal LINEPROC                 #
                             #
li $a0,128                   #david`s star
li $t0,1272                  #
li $t1,400                   #
li $t2,1752                  #
li $t3,1240                  #
li $t4,40                    #
jal LINEPROC                 #
li $t0,1752                  #
li $t1,1240                  #
li $t2,792                   #
li $t3,1240                  #
jal LINEPROC                 #
li $t0,792                   #
li $t1,1240                  #
li $t2,1272                  #
li $t3,400                   #
jal LINEPROC                 #
li $t0,1272                  #
li $t1,1520                  #
li $t2,808                   #
li $t3,680                   #
jal LINEPROC                 #
li $t0,808                   #
li $t1,680                   #
li $t2,1768                  #
li $t3,680                   #
jal LINEPROC                 #
li $t0,1768                  #
li $t1,680                   #
li $t2,1272                  #
li $t3,1520                  #
jal LINEPROC                 #
                             #
lw $ra,0($sp)                #
addi $sp,$sp,4               #
jr $ra                       #
##############################
##############################
############ISRAEL############
##############################
##############################

############################
############################
############LOVE############
############################
############################
PRINTLOVEFLAG:             #
addi $sp,$sp,-4            #
sw $ra,0($sp)              #
                           #
li $a0,5                   #red background
li $t0,1272                #
li $t1,952                 #
li $t4,8000                #
jal DOTPROC                #
                           #
li $a0,248                 #blue heart
li $a1,16                  #
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
li $a0,128                 #david`s star
li $t0,1272                #
li $t1,400                 #
li $t2,1752                #
li $t3,1240                #
li $t4,32                  #
jal LINEPROC               #
li $t0,1752                #
li $t1,1240                #
li $t2,792                 #
li $t3,1240                #
jal LINEPROC               #
li $t0,792                 #
li $t1,1240                #
li $t2,1272                #
li $t3,400                 #
jal LINEPROC               #
li $t0,1272                #
li $t1,1520                #
li $t2,808                 #
li $t3,680                 #
jal LINEPROC               #
li $t0,808                 #
li $t1,680                 #
li $t2,1768                #
li $t3,680                 #
jal LINEPROC               #
li $t0,1768                #
li $t1,680                 #
li $t2,1272                #
li $t3,1520                #
jal LINEPROC               #
                           #
li $a0,5                   #red ruby
li $a2,159                 #
li $a3,119                 #
jal DROPBUCKET             #
                           #
li $a0,196                 #paint it purple
li $a2,159                 #
li $a3,70                  #
jal DROPBUCKET             #
li $a2,159                 #
li $a3,180                 #
jal DROPBUCKET             #
li $a2,131                 #
li $a3,90                  #
jal DROPBUCKET             #
li $a2,211                 #
li $a3,90                  #
jal DROPBUCKET             #
li $a2,131                 #
li $a3,150                 #
jal DROPBUCKET             #
li $a2,211                 #
li $a3,150                 #
jal DROPBUCKET             #
li $a2,159                 #
li $a3,50                  #
jal DROPBUCKET             #
                           #
lw $ra,0($sp)              #
addi $sp,$sp,4             #
jr $ra                     #
############################
############################
############LOVE############
############################
############################

###############################
###############################
############SCIENCE############
###############################
###############################
PRINTSCIENCEFLAG:             #
addi $sp,$sp,-4               #
sw $ra,0($sp)                 #
                              #
li $a0,73                     #blue background
li $t0,1272                   #
li $t1,952                    #
li $t4,4000                   #
jal DOTPROC                   #
                              #
li $a0,184                    #big atom
li $t0,1272                   #
li $t1,952                    #
li $t4,120                    #
jal DOTPROC                   #
li $a0,61                     #
li $t0,1272                   #
li $t1,952                    #
li $t2,1272                   #
li $t3,952                    #
li $t4,16                     #
li $t5,240                    #
jal ELIPSEPROC                #
                              #
li $a0,168                    #orbitals rad
li $t0,800                    #
li $t1,952                    #
li $t2,1744                   #
li $t3,952                    #
li $t4,24                     #
li $t5,1100                   #
jal ELIPSEPROC                #
li $t0,944                    #
li $t1,624                    #
li $t2,1600                   #
li $t3,1280                   #
li $t5,1100                   #
jal ELIPSEPROC                #
li $t0,944                    #
li $t1,1280                   #
li $t2,1600                   #
li $t3,624                    #
li $t5,1100                   #
jal ELIPSEPROC                #
                              #
li $a0,184                    #orbitals
li $t0,800                    #
li $t1,952                    #
li $t2,1744                   #
li $t3,952                    #
li $t4,8                      #
li $t5,1100                   #
jal ELIPSEPROC                #
li $t0,944                    #
li $t1,624                    #
li $t2,1600                   #
li $t3,1280                   #
li $t5,1100                   #
jal ELIPSEPROC                #
li $t0,944                    #
li $t1,1280                   #
li $t2,1600                   #
li $t3,624                    #
li $t5,1100                   #
jal ELIPSEPROC                #
                              #
li $a0,184                    #electrons
li $t0,720                    #
li $t1,952                    #
li $t4,40                     #
jal DOTPROC                   #
li $a0,61                     #
li $t0,720                    #
li $t1,952                    #
li $t2,720                    #
li $t3,952                    #
li $t4,16                     #
li $t5,80                     #
jal ELIPSEPROC                #
li $a0,184                    #
li $t0,1656                   #
li $t1,1336                   #
li $t4,40                     #
jal DOTPROC                   #
li $a0,61                     #
li $t0,1656                   #
li $t1,1336                   #
li $t2,1656                   #
li $t3,1336                   #
li $t4,16                     #
li $t5,80                     #
jal ELIPSEPROC                #
li $a0,184                    #
li $t0,1656                   #
li $t1,568                    #
li $t4,40                     #
jal DOTPROC                   #
li $a0,61                     #
li $t0,1656                   #
li $t1,568                    #
li $t2,1656                   #
li $t3,568                    #
li $t4,16                     #
li $t5,80                     #
jal ELIPSEPROC                #
                              #
lw $ra,0($sp)                 #
addi $sp,$sp,4                #
jr $ra                        #
###############################
###############################
############SCIENCE############
###############################
###############################

###############################
###############################
############JAPAN##############
###############################
###############################
PRINTJAPANFLAG:               #
addi $sp,$sp,-4               #
sw $ra,0($sp)                 #
                              #
li $a0,255                    #white background
li $t0,1272                   #
li $t1,952                    #
li $t4,4000                   #
jal DOTPROC                   #
                              #
li $a0,6                      #red sun
li $t0,1272                   #
li $t1,952                    #
li $t4,560                    #
jal DOTPROC                   #
                              #
lw $ra,0($sp)                 #
addi $sp,$sp,4                #
jr $ra                        #
###############################
###############################
############JAPAN##############
###############################
###############################

###############################
###############################
############US#################
###############################
###############################
PRINTUSFLAG:                  #
addi $sp,$sp,-4               #
sw $ra,0($sp)                 #
                              #
li $a0,255                    #white background
li $t0,1272                   #
li $t1,852                    #
li $t4,4000                   #
jal DOTPROC                   #
                              #
li $a0,6                      #
li $t0,0                      #
li $t1,72                     #
li $t2,2552                   #
li $t3,72                     #
li $t4,72                     #
jal LINEPROC                  #
li $t0,0                      #
li $t1,368                    #
li $t2,2552                   #
li $t3,368                    #
jal LINEPROC                  #
li $t0,0                      #
li $t1,664                    #
li $t2,2552                   #
li $t3,664                    #
jal LINEPROC                  #
li $t0,0                      #
li $t1,952                    #
li $t2,2552                   #
li $t3,952                    #
jal LINEPROC                  #
li $t0,0                      #
li $t1,1248                   #
li $t2,2552                   #
li $t3,1248                   #
jal LINEPROC                  #
li $t0,0                      #
li $t1,1544                   #
li $t2,2552                   #
li $t3,1544                   #
jal LINEPROC                  #
li $t0,0                      #
li $t1,1840                   #
li $t2,2552                   #
li $t3,1840                   #
jal LINEPROC                  #
                              #
li $a0,128                    #
li $t0,1272                   #
li $t1,1016                   #
li $t2,1272                   #
li $t3,0                      #
li $t4,0                      #
jal LINEPROC                  #
li $t0,0                      #
li $t1,1024                   #
li $t2,1264                   #
li $t3,1024                   #
jal LINEPROC                  #
li $a2,0                      #
li $a3,0                      #
jal DROPBUCKET                #
li $a2,0                      #
li $a3,27                     #
jal DROPBUCKET                #
li $a2,0                      #
li $a3,46                     #
jal DROPBUCKET                #
li $a2,0                      #
li $a3,64                     #
jal DROPBUCKET                #
li $a2,0                      #
li $a3,83                     #
jal DROPBUCKET                #
li $a2,0                      #
li $a3,101                    #
jal DROPBUCKET                #
li $a2,0                      #
li $a3,119                    #
jal DROPBUCKET                #
                              #
li $a0,255                    #
li $t0,176                    #
li $t1,96                     #
li $t4,24                     #
jal DOTPROC                   #
li $t0,360                    #
li $t1,96                     #
jal DOTPROC                   #
li $t0,544                    #
li $t1,96                     #
jal DOTPROC                   #
li $t0,728                    #
li $t1,96                     #
jal DOTPROC                   #
li $t0,912                    #
li $t1,96                     #
jal DOTPROC                   #
li $t0,1096                   #
li $t1,96                     #
jal DOTPROC                   #
li $t0,176                    #
li $t1,304                    #
jal DOTPROC                   #
li $t0,360                    #
li $t1,304                    #
jal DOTPROC                   #
li $t0,544                    #
li $t1,304                    #
jal DOTPROC                   #
li $t0,728                    #
li $t1,304                    #
jal DOTPROC                   #
li $t0,912                    #
li $t1,304                    #
jal DOTPROC                   #
li $t0,1096                   #
li $t1,304                    #
jal DOTPROC                   #
li $t0,176                    #
li $t1,512                    #
jal DOTPROC                   #
li $t0,360                    #
li $t1,512                    #
jal DOTPROC                   #
li $t0,544                    #
li $t1,512                    #
jal DOTPROC                   #
li $t0,728                    #
li $t1,512                    #
jal DOTPROC                   #
li $t0,912                    #
li $t1,512                    #
jal DOTPROC                   #
li $t0,1096                   #
li $t1,512                    #
jal DOTPROC                   #
li $t0,176                    #
li $t1,712                    #
jal DOTPROC                   #
li $t0,360                    #
li $t1,712                    #
jal DOTPROC                   #
li $t0,544                    #
li $t1,712                    #
jal DOTPROC                   #
li $t0,728                    #
li $t1,712                    #
jal DOTPROC                   #
li $t0,912                    #
li $t1,712                    #
jal DOTPROC                   #
li $t0,1096                   #
li $t1,712                    #
jal DOTPROC                   ###8bull
li $t0,176                    #
li $t1,920                    #
jal DOTPROC                   #
li $t0,360                    #
li $t1,920                    #
jal DOTPROC                   #
li $t0,544                    #
li $t1,920                    #
jal DOTPROC                   #
li $t0,728                    #
li $t1,920                    #
jal DOTPROC                   #
li $t0,912                    #
li $t1,920                    #
jal DOTPROC                   #
li $t0,1096                   #
li $t1,920                    #
jal DOTPROC                   #
li $t0,272                    #
li $t1,200                    #
jal DOTPROC                   #
li $t0,456                    #
li $t1,200                    #
jal DOTPROC                   #
li $t0,632                    #
li $t1,200                    #
jal DOTPROC                   #
li $t0,816                    #
li $t1,200                    #
jal DOTPROC                   #
li $t0,1000                   #
li $t1,200                    #
jal DOTPROC                   #
li $t0,272                    #
li $t1,408                    #
jal DOTPROC                   #
li $t0,456                    #
li $t1,408                    #
jal DOTPROC                   #
li $t0,632                    #
li $t1,408                    #
jal DOTPROC                   #
li $t0,816                    #
li $t1,408                    #
jal DOTPROC                   #
li $t0,1000                   #
li $t1,408                    #
jal DOTPROC                   #
li $t0,272                    #
li $t1,608                    #
jal DOTPROC                   #
li $t0,456                    #
li $t1,608                    #
jal DOTPROC                   #
li $t0,632                    #
li $t1,608                    #
jal DOTPROC                   #
li $t0,816                    #
li $t1,608                    #
jal DOTPROC                   #
li $t0,1000                   #
li $t1,608                    #
jal DOTPROC                   #
li $t0,272                    #
li $t1,816                    #
jal DOTPROC                   #
li $t0,456                    #
li $t1,816                    #
jal DOTPROC                   #
li $t0,632                    #
li $t1,816                    #
jal DOTPROC                   #
li $t0,816                    #
li $t1,816                    #
jal DOTPROC                   #
li $t0,1000                   #
li $t1,816                    #
jal DOTPROC                   #
                              #
lw $ra,0($sp)                 #
addi $sp,$sp,4                #
jr $ra                        #
###############################
###############################
############US#################
###############################
###############################

############################
############################
############BUTAO###########
############################
############################
PRINTBUTAOFLAG:            #
addi $sp,$sp,-4            #
sw $ra,0($sp)              #
                           #
li $a0,22                  #red background
li $t0,1272                #
li $t1,952                 #
li $t4,8000                #
jal DOTPROC                #

li $a0,55                  #
li $t0,2559                #
li $t1,0                   #
li $t2,0                   #
li $t3,1919                #
li $t4,6                   #
jal LINEPROC               #

li $a1,0
li $a2,0
jal DROPBUCKET

li $a0,164                    #
li $t0,1040                 #
li $t1,1656                  #
li $t4,80                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,1040                 #
li $t1,1656                  #
li $t4,72                     #
jal DOTPROC                   #

li $a0,164                    #
li $t0,1192                #
li $t1,1296                 #
li $t4,80                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,1192                #
li $t1,1296                 #
li $t4,72                     #
jal DOTPROC                   #

li $a0,164                    #
li $t0,2000                 #
li $t1,760                  #
li $t4,80                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,2000                 #
li $t1,760                  #
li $t4,72                     #
jal DOTPROC                   #
                           #
li $a0,164                 #blue heart
li $a1,6                   #
li $a2,130                 #
li $t0,384                 #
li $t1,1624                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,560                 #
li $t1,1496                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,408                 #
li $t1,1536                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,624                 #
li $t1,1424                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,512                 #
li $t1,1432                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,680                 #
li $t1,1368                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,520                 #
li $t1,1328                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,680                 #
li $t1,1352                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,808                 #
li $t1,1312                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,888                 #
li $t1,1200                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,936                 #
li $t1,1008                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,992                 #
li $t1,880                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1072                #
li $t1,840                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1216                #
li $t1,832                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1320                #
li $t1,880                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1432                #
li $t1,936                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1464                #
li $t1,928                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1440                #
li $t1,800                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1368                #
li $t1,688                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1352                #
li $t1,592                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1392                #
li $t1,528                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1480                #
li $t1,440                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
                           ##BRAKE
li $t0,1576                #
li $t1,384                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              ##DONE
li $t0,1688                #
li $t1,392                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1776                #
li $t1,368                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1800                #
li $t1,392                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1840                #
li $t1,392                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1856                #
li $t1,416                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1912                #
li $t1,440                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1968                #
li $t1,432                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2072                #
li $t1,240                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2008                #
li $t1,416                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2112                #
li $t1,384                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2024                #
li $t1,456                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2176                #
li $t1,448                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1984                #
li $t1,504                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1968                #
li $t1,552                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1952                #
li $t1,664                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1936                #
li $t1,608                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1912                #
li $t1,696                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1912                #
li $t1,584                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1872                #
li $t1,568                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1856                #
li $t1,544                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1800                #
li $t1,552                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
                           ##BRAKE
li $t0,1784                #
li $t1,592                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              ##DONE
li $t0,1824                #
li $t1,640                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1880                #
li $t1,664                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1880                #
li $t1,752                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1856                #
li $t1,728                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1840                #
li $t1,752                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1824                #
li $t1,704                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1736                #
li $t1,640                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1688                #
li $t1,640                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1656                #
li $t1,632                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1624                #
li $t1,568                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1568                #
li $t1,592                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1560                #
li $t1,656                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1624                #
li $t1,736                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1760                #
li $t1,800                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1888                #
li $t1,792                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1904                #
li $t1,736                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1920                #
li $t1,800                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1968                #
li $t1,808                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1984                #
li $t1,768                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2016                #
li $t1,816                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2048                #
li $t1,792                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
                           ##BRAKE
li $t0,2040                #
li $t1,752                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              ##DONE
li $t0,2096                #
li $t1,824                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,2024                #
li $t1,880                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1976                #
li $t1,912                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1888                #
li $t1,864                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1824                #
li $t1,904                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1736                #
li $t1,912                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1664                #
li $t1,880                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1656                #
li $t1,992                 #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1616                #
li $t1,1096                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1568                #
li $t1,1168                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1712                #
li $t1,1216                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1792                #
li $t1,1136                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1864                #
li $t1,1136                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1824                #
li $t1,1184                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1808                #
li $t1,1208                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1888                #
li $t1,1264                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1840                #
li $t1,1248                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1808                #
li $t1,1248                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1760                #
li $t1,1304                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1760                #
li $t1,1368                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1784                #
li $t1,1424                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
                           ##BRAKE
li $t0,1704                #
li $t1,1376                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              ##DONE
li $t0,1688                #
li $t1,1288                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1448                #
li $t1,1208                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1464                #
li $t1,1104                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1344                #
li $t1,1096                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1184                #
li $t1,1032                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1104                #
li $t1,1040                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1040                #
li $t1,1144                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1064                #
li $t1,1240                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1096                #
li $t1,1144                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1176                #
li $t1,1144                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1144                #
li $t1,1168                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1144                #
li $t1,1200                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1208                #
li $t1,1200                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1232                #
li $t1,1232                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1160                #
li $t1,1248                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1144                #
li $t1,1320                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1184                #
li $t1,1368                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1144                #
li $t1,1376                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1088                #
li $t1,1336                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1056                #
li $t1,1320                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1056                #
li $t1,1400                #
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #

li $t0,1104
li $t1,1472
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1152
li $t1,1480
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1208
li $t1,1592
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1168
li $t1,1544
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1128
li $t1,1544
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1128
li $t1,1648
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1080
li $t1,1592
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1040
li $t1,1568
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,984
li $t1,1624
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,960
li $t1,1576
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,976
li $t1,1536
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,1032
li $t1,1512
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,976
li $t1,1416
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,984
li $t1,1336
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,920
li $t1,1352
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,824
li $t1,1448
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,704
li $t1,1520
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,744
li $t1,1464
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,640
li $t1,1520
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
li $t0,688
li $t1,1464
addi $sp,$sp,-8            #
sw $t0,0($sp)              #
sw $t1,4($sp)              #
jal POLYPROC               #

li $a0,255
li $a2,152
li $a3,119
jal DROPBUCKET

li $a2,77
li $a3,186
jal DROPBUCKET

li $a2,77
li $a3,180
jal DROPBUCKET

li $a2,191
li $a3,128
jal DROPBUCKET

li $a2,184
li $a3,70
jal DROPBUCKET

li $a2,242
li $a3,64
jal DROPBUCKET

li $a2,228
li $a3,82
jal DROPBUCKET

li $a2,250
li $a3,50
jal DROPBUCKET

li $a0,164                    #
li $t0,1832                   #
li $t1,424                    #
li $t4,40                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,1832                   #
li $t1,424                    #
li $t4,32                     #
jal DOTPROC                   #
li $a0,0                    #
li $t0,1852                   #
li $t1,424                    #
li $t4,20                     #
jal DOTPROC                   #

li $a0,164                    #
li $t0,1792                   #
li $t1,464                    #
li $t4,40                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,1792                   #
li $t1,464                    #
li $t4,32                     #
jal DOTPROC                   #
li $a0,0                    #
li $t0,1812                   #
li $t1,464                    #
li $t4,20                     #
jal DOTPROC                   #

li $a0,164                    #
li $t0,1712                   #
li $t1,564                    #
li $t4,40                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,1712                   #
li $t1,564                    #
li $t4,32                     #
jal DOTPROC                   #

li $a0,164                    #
li $t0,1848                  #
li $t1,1352                   #
li $t4,80                     #
jal DOTPROC                   #
li $a0,255                    #
li $t0,1848                  #
li $t1,1352                   #
li $t4,72                     #
jal DOTPROC                   #


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