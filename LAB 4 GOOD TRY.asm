	.data
msg1:	.asciiz "The input String is: "
str:	.asciiz "Hello world!"
newLn: 	.asciiz "\n"
msg2:	.asciiz "The output reverse String is: "
	.text
	
main:	
	li $v0, 4
	la $a0, msg1	#prints the message "The input string is: "
	syscall
	
	li $v0, 4
	la $a0, str	#prints the str itself
	syscall
	
	li $v0, 4
	la $a0, newLn	#prints newLine \n
	syscall
	
	li $v0, 4
	la $a0, msg2	#prints the message "The output reverse string is: "
	syscall
	
	la $t0, str	#store the str address in $t0
	li $t3, 0	#length variable
for:	
	lb $t2, 0($t0)  #load the 1st character from $t0 to $t2	
	beqz $t2, endFor  #loops till the string ends
	
	move $a0, $t2
	jal push
	
	addi $t3, $t3,1  #increment length
	addi $t0, $t0, 1
	j for
endFor:


	la $t0, str
for2:
	beqz $t3, endfor2 
	subi $t3, $t3, 1
	
	jal pop
	
	li $v0, 4
	move $a0, $t2
	syscall 
	
	j for2
endfor2:

	li $v0, 10
	syscall

	
			
pop:	
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	syscall 
	jr $ra
	
push: 
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	syscall
	jr $ra
	 
	
	
