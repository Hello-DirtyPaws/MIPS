#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the maximum and minimun number from an array limiting the array size to 10.

		.data
arry:		.space 10
getSize: 	.asciiz "Please enter the size of the array: "
invalidSize:	.asciiz "INVALID SIZE ENTERED!!!"
askForElement:	.asciiz "Please enter an integer to add into the array: "
arryStr:	 .asciiz "The array is as follows: "
nL:		.asciiz "\n"
space:		.asciiz "  "
min:		.asciiz "The minimum value is: "
max:		.asciiz "The maximum value is: "
		.text 
	
main: 

checkSize:

	li $v0, 4
	la $a0, getSize		#ask for array size
	syscall 
	
	li $v0, 5
	syscall 		
	move $s2, $v0		#store the array size in $s2
	
	bgt $s2, 10, err	#if size entered is greater than 10..go to err
	bltz $s2, err		#if the size is less than 0..go to err
	j noErr
err:
	li $v0, 4
	la $a0, invalidSize
	syscall 
	j checkSize
noErr:	
	li $t0, 0
	la $t1, arry
	
for0:	
	beq $t0, $s2, endFor0	#loop till size
	addi $t0, $t0, 1
	
	li $v0, 4
	la $a0, askForElement	#ask for an element
	syscall 
	
	li $v0, 5
	syscall 
	sw $v0, ($t1)		#store the element in the array
	addi $t1, $t1, 4
	j for0
	
endFor0:
	
	li $v0, 4
	la $a0, arryStr		#indication to print the array
	syscall 
	
	li $t0, 0	#loop control variable
	la $t1, arry	#assigning list address to $t1
	
for1:
	beq $t0, $s2, endFor1
	addi $t0, $t0, 1	#increment loop control variable
	
	li $v0, 1
	lw  $a0, 0($t1)
	syscall 
	
	li $v0, 4
	la $a0, space		#prints the space between elements
	syscall
	
	addi $t1, $t1, 4	#Settitng $t1 to next address
	j for1
endFor1:

	li $v0, 4		#Printing new line
	la $a0, nL
	syscall
	
	lw $s0, arry	#min -- set to the first element of the array
	lw $s1, arry 	#max -- set to the first element of the array
	
	li $t0, 0	#loop control variable
	la $t1, arry	#assigning list address to $t1
	
for2:	
	beq $t0, $s2, endFor2
	addi $t0, $t0, 1	#increment loop control variable
	
	lw $t2, ($t1)		
	
	bge $t2, $s0, then1	#if $t2(current value) > $s0(min value), dont change the min value (then1)
	lw $s0, ($t1)		#else, changing the min value to the current value
then1: 
	ble $t2, $s1, then2	#if $t2(current value) < $s1(max value), dont change the max value (then2)
	lw $s1, ($t1)		#else, changing the max value to the current value
then2:
	
	addi $t1, $t1, 4	#incrementing the current array address pointer
	j for2
endFor2:
	
	
	li $v0, 4
	la $a0, min	#Prints string "Min value is: "
	syscall
	
	li $v0, 1
	move $a0, $s0	#prints the min value
	syscall
	
	li $v0, 4
	la $a0, nL	#prints new line
	syscall
	
	li $v0, 4
	la $a0, max	#prints "Max value is: "
	syscall
	
	li $v0, 1	
	move $a0, $s1	#prints the max value
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
