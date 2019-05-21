#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the maximum and minimun number from an array.

	.data
list:	.word 100, 41, 23, 84, 57, 90, 10, 18
size:	.word 8
arryStr: .asciiz "The array is as follows: "
nL:	.asciiz "\n"
space:	.asciiz "  "
min:	.asciiz "The minimum value is: "
max:	.asciiz "The maximum value is: "
	.text 
	
main:
	li $v0, 4
	la $a0, arryStr
	syscall 
	
	li $t0, 0	#loop control variable
	la $t1, list	#assigning list address to $t1
	lw $t3, size	#load size
for1:
	beq $t0, $t3, endFor1
	addi $t0, $t0, 1	#increment loop control variable
	
	li $v0, 1
	lw  $a0, 0($t1)
	syscall 
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t1, $t1, 4
	j for1
endFor1:

	li $v0, 4
	la $a0, nL
	syscall
	
	lw $s0, list	#min
	lw $s1, list 	#max
	
	li $t0, 0	#loop control variable
	la $t1, list	#assigning list address to $t1
	
for2:	
	beq $t0, $t3, endFor2
	addi $t0, $t0, 1	#increment loop control variable
	
	lw $t2, ($t1)
	
	bge $t2, $s0, then1
	lw $s0, ($t1)
then1: 
	ble $t2, $s1, then2
	lw $s1, ($t1)
then2:
	
	addi $t1, $t1, 4
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
	
	
	
	
