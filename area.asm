	.data
pro1:	.asciiz "Enter the length: "
pro2: 	.asciiz "Enter the width: "
out1: 	.asciiz "The area of a "
out2: 	.asciiz " x "
out3: 	.asciiz " rectangle is: "
	.text
	
main:	
	li $v0, 4
	la $a0, pro1	#prom1 to user
	syscall 
	
	li $v0, 5
	syscall 
	move $s0, $v0	#store the length in $s0
	
	li $v0, 4
	la $a0, pro2	#prom2 to user
	syscall 
	
	li $v0, 5
	syscall 
	move $s1, $v0	#store the width in $s1
	
	move $a0, $s0	#Set parameters for the function call
	move $a1, $s1
	jal findArea	#call the method finaArea with the 2 parameter ($a0, $a1)
	#move $s3, $v0	#storing the return value from from the method to $s0
	
	li $v0, 4 
	la $a0, out1	#print out1
	syscall 
	
	li $v0, 1 
	move $a0, $s0	#print the length
	syscall 
	
	li $v0, 4 
	la $a0, out2	#print out2
	syscall 
	
	li $v0, 1 
	move $a0, $s1	#print the width
	syscall 
	
	li $v0, 4 
	la $a0, out3	#print out3
	syscall 
	
	li $v0, 1 
	move $a0, $s3	#print the area 
	syscall 
	
	li $v0, 10	#exit
	syscall 	
	
		
findArea:	
	mult $a0, $a1
	mflo $s3
	jr $ra
	
	
	