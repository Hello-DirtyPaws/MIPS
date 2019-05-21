#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the sum of all even numbers from 1-100.
	.data
prompt:	.asciiz "The sum of all even numbers from 1-100 is: "
	.text
	
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $t0, 0	#sum variable
	li $t1, 0	#Loop control variable
	
for:	
	addi $t1, $t1, 2
	bgt $t1, 100, endfor
	add $t0, $t0, $t1
	j for
endfor:
	li $v0, 1 
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall 
	
