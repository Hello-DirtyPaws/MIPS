#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the number occurences of a particular character in a String.

	.data
str:	.asciiz "Hello world!"
msg1:	.asciiz "The occurence(s) of \'"
char:	.asciiz "l"
msg2: 	.asciiz "\' in the String \""
msg3:	.asciiz "\" is: "
	.text
	
main:	
	li $v0, 4
	la $a0, msg1		#prints the message "The occurence of"
	syscall
	
	li $v0, 4
	la $a0, char		#prints the char
	syscall

	li $v0, 4
	la $a0, msg2		#prints the message "in the String"
	syscall
			
	li $v0, 4
	la $a0, str		#prints the str itself
	syscall
	
	li $v0, 4
	la $a0, msg3		#prints "is: "
	syscall
	
	la $t0, str		#store the str address in $t0
	lb $t3, char		#store the 1st byte or the 1st character to $t3 from char
	
	li $t1, 0		#no of occurencies
for:	
	lb $t2, 0($t0)		#store the character at position $t0+0 to $t2
	beqz $t2, endFor 	#if $t2 == 0 endfor loop
	bne $t2, $t3, x	        #if char in $t2 != char in $t3, go to x
				#reaches here only if the chars in $t2 == $t3
	addi $t1, $t1, 1	#increment the occurence variable
x:
	addi $t0, $t0, 1	#increment the length variable
	j for
endFor:

	li $v0, 1
	move $a0, $t1		#prints the int value of no. of occurencies from $t1
	syscall 
	
	li $v0, 10
	syscall
