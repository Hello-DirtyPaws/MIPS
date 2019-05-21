#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the maximum and the minimun number from an array limiting the array size to 10.
#using stacks and routines.

		.data
getSize: 	.asciiz "Please enter the number of integers needed to be entered: "
invalidSize:	.asciiz "INVALID SIZE ENTERED!!!"
askForElement:	.asciiz "Please enter an integer to push into the stack: "
stackStr:	.asciiz "Integers in the stack are as follows: "
nL:		.asciiz "\n"
space:		.asciiz "  "
min:		.asciiz "The minimum value is: "
max:		.asciiz "The maximum value is: "
		.text 
	
main: 

	li $v0, 4
	la $a0, getSize		#ask for stack size
	syscall 
	
	li $v0, 5
	syscall 		
	move $a0, $v0		#store the stack size in $a0
	
	jal check_size
	move $s0, $a0
	
	li $t0, 0	#Loop control variable
	
for0:	
	beq $t0, $s0, endFor0	#loop till size
	addi $t0, $t0, 1
	
	li $v0, 4
	la $a0, askForElement	#ask for an element
	syscall 
	
	li $v0, 5
	syscall 
	move $a0, $v0
	jal push
	j for0
endFor0:

	jal pop		#get the top element to $a0
	li $t0, 0	#loop control variable
	move $t1, $a0	#min set to the top element of the stack
	move $t2, $a0	#max set to the top element of the stack
	jal push	#push back the popped top element
	
	li $v0, 4
	la $a0, stackStr	#prints "the elements in the stack are: "
	syscall
for1:
	beq $t0, $s0, endFor1
	jal pop
	li $v0, 1	#prints the poped top element
	syscall 
	
	jal compare_and_set
	
	li $v0, 4
	la $a0, space		#prints the space between elements
	syscall
	
	addi $t0, $t0, 1	#Settitng $t1 to next address
	j for1
endFor1:

	li $v0, 4		#Printing new line
	la $a0, nL
	syscall
	
	
	li $v0, 4
	la $a0, min	#Prints string "Min value is: "
	syscall
	
	li $v0, 1
	move $a0, $t1	#prints the min value
	syscall
	
	li $v0, 4
	la $a0, nL	#prints new line
	syscall
	
	li $v0, 4
	la $a0, max	#prints "Max value is: "
	syscall
	
	li $v0, 1	
	move $a0, $t2	#prints the max value
	syscall
	
	li $v0, 10
	syscall 	#Exit
	
check_size:	
	bgt $a0, 10, err	#if size entered is greater than 10..go to err
	ble $a0, 0, err		#if the size is less than 0..go to err
	j noErr
err:
	li $v0, 4
	la $a0, invalidSize	#prints Invalid Size
	syscall 
	j main
noErr:	
	jr $ra
	
compare_and_set:
	blt $t1, $a0, min_not_change	#if the $t1 < current value ($a0), dont change the mininum value 
	move $t1, $a0			#changing the minimum value
min_not_change:
	
	bgt $t2, $a0, max_not_change	#if the $t1 > current value ($a0), dont change the maximum value
	move $t2, $a0			#changing the maximum value
max_not_change:
	
	jr $ra
	
push:					#push method for stack
	addi $sp, $sp, -4		#$sp = $sp - 4, assigned a new address in relation to the previous $sp
	sb $a0, ($sp)			#pushing in the current value($a0) into the memory at $sp
	jr $ra
	
pop:					#pop method for stack
	lb $a0, ($sp)			#load the value from the top (address in $sp) into $a0
	addi $sp, $sp, 4		#$sp = $sp + 4, assigned a previous address to $sp
	jr $ra	

	
	
	
