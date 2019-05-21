#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print a string in reverse.

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
	addi $t3, $t3,1  #increment length
	addi $t0, $t0, 1
	j for
endFor:
	subi $t0, $t0, 1
for2:
	lb $t2, 0($t0)
	beq $t3, $t1, endfor2
	
	li $v0, 11
	move $a0, $t2
	syscall 
	
	addi $t1, $t1, 1
	subi $t0, $t0, 1
	j for2
	
endfor2:
	li $v0, 10
	syscall
	
	
	
	
