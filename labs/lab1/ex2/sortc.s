	.globl	v               
	.data                  
v:
	.word	5               
	.word	8               
	.word	3               
	.word	4               
	.word	7              
	.word	6              
	.word	8               
	.word	0               
	.word	1               
	.word	9               
.LC0:
	.ascii	"\n"        	    # Alterardo de "%d\011\000" para "\n"
	.text
	# a main foi retirada do final do segmento de texto e foi colocado nesse ponto                       
	.globl	main               
	.set	nomips16           
	.set	nomicromips         
	
main:				    # O main foi colocado para o inicio do segmento de texto
	.frame	$fp,24,$31          
	.mask	0xc0000000,-4       
	.fmask	0x00000000,0        
	.set	noreorder           
	.set	nomacro             
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$5,10			# 0xa
	la	$4, v	# acrescentado no lugar de lui lui $2,%hi(v) e addiu $4,$2,%lo(v)
	jal	show
	nop

	li	$5,10			# 0xa
	#lui	$2,%hi(v)
	#addiu	$4,$2,%lo(v)
	la	$4, v	# acrescentado no lugar de lui lui $2,%hi(v) e addiu $4,$2,%lo(v)
	jal	sort
	nop

	li	$5,10			# 0xa
	#lui	$2,%hi(v)
	#addiu	$4,$2,%lo(v)
	la	$4, v	# acrescentado no lugar de lui lui $2,%hi(v) e addiu $4,$2,%lo(v)
	jal	show
	nop
	
	li $v0,10 # acrescentado para finalizar main
	syscall	  # acrescentado para finalizar main
	#nop
	#move	$sp,$fp
	#lw	$31,20($sp)
	#lw	$fp,16($sp)
	#addiu	$sp,$sp,24
	#j	$31
	#nop

	.set	macro           
	.set	reorder        
 
	.globl	show            
	.set	nomips16        
	.set	nomicromips    
show:
	.frame	$fp,32,$31		
	.mask	0xc0000000,-4   
	.fmask	0x00000000,0    
	.set	noreorder       
	.set	nomacro         
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$0,16($fp)
	b	.L2
	nop

.L3:
	lw	$2,16($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2 	# alterado de $5 para $4

	# lui	$2, %HI(.LC0)
	# addiu	$4,$2,%lo(.LC0)
	
	#jal	printf
	li	$2, 1	 # acrescentado para imprimir os valores do vetor no lugar de printf
	syscall		 # acrescentado para imprimir os valores do vetor no lugar de printf

	nop 

	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L2:
	lw	$3,16($fp)
	lw	$2,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,.L3
	nop

	#li	$4,10			# 0xa
	#jal	putchar
	la	$4, .LC0 # acrescentado no lugar de lui + addiu
	li	$2, 4    # acrescentado para imprimir \n
	syscall
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	#j	$31
	jr $31	# acrescentado no lugar de j	$31
	nop

	.set	macro           
	.set	reorder        
	.end	show           
	.size	show, .-show    
	#.align	2               
	.globl	swap            
	.set	nomips16        
	.set	nomicromips     
	.ent	swap            
	#.type	swap, @function # Define que o tipo de swap e @function.
swap:
	.frame	$fp,16,$31		
	.mask	0x40000000,-4   
	.fmask	0x00000000,0    
	.set	noreorder       
	.set	nomacro         
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$5,20($fp)
	lw	$2,20($fp)
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($fp)
	lw	$2,20($fp)
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$3,20($fp)
	addiu	$3,$3,1
	sll	$3,$3,2
	lw	$4,16($fp)
	addu	$3,$4,$3
	lw	$3,0($3)
	sw	$3,0($2)
	lw	$2,20($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$3,0($fp)
	sw	$3,0($2)
	nop
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	#j	$31
	jr $31	# acrescentado no lugar de j	$31
	nop

	.set	macro           
	.set	reorder         
	.end	swap            
	.size	swap, .-swap    
	#.align	2               
	.globl	sort            
	.set	nomips16        
	.set	nomicromips     
	.ent	sort            
	#.type	sort, @function 
sort:
	.frame	$fp,32,$31		
	.mask	0xc0000000,-4   
	.fmask	0x00000000,0    
	.set	noreorder       
	.set	nomacro         
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$0,16($fp)
	b	.L6
	nop

.L10:
	lw	$2,16($fp)
	addiu	$2,$2,-1
	sw	$2,20($fp)
	b	.L7
	nop

.L9:
	lw	$5,20($fp)
	lw	$4,32($fp)
	jal	swap
	nop

	lw	$2,20($fp)
	addiu	$2,$2,-1
	sw	$2,20($fp)
.L7:
	lw	$2,20($fp)
	bltz	$2,.L8
	nop

	lw	$2,20($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,20($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$4,32($fp)
	addu	$2,$4,$2
	lw	$2,0($2)
	slt	$2,$2,$3
	bne	$2,$0,.L9
	nop

.L8:
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L6:
	lw	$3,16($fp)
	lw	$2,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,.L10
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	#j	$31
	jr $31	# acrescentado no lugar de j	$31
	nop

	.set	macro               
	.set	reorder             
	.end	sort                
	.size	sort, .-sort        
	#.align	2                   
	.ident	"GCC: (Sourcery CodeBench Lite 2016.05-7) 5.3.0"  # insere no arquivo objeto a tag: "GCC: (Sourcery CodeBench Lite 2016.05-7) 5.3.0".
