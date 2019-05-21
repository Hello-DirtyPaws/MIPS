#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the number of characters in a String.

	.data
msg1:	.asciiz "Please enter a String: "
msg2:	.asciiz "The number of character(s) in the entered String is/are: "
str:	.space 41
	.text
	
main:	
	li $v0, 4
	la $a0, msg1	#asks to enter the String 
	syscall
	
	li $v0, 8
	la $a0, str	#takes in the string
	la $a1, 40
	syscall
	la $t0, ($a0)
	
	li $v0, 4
	la $a0, msg2	#prints "is: "
	syscall
	
	
	li $t1, 0	#str length
for:	
	lb $t2, 0($t0)
	beqz $t2, endFor
	beq $t2, 10, endFor
	addi $t1, $t1, 1	#increment the length variable
	addi $t0, $t0, 1
	j for
endFor:

	li $v0, 1
	move $a0, $t1
	syscall 
