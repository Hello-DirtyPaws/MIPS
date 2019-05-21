	.data
ask: .asciiz "Please enter  a number: "
x: .asciiz "The sum of "
y: .asciiz " and "
z: .asciiz " is: "
num1: .word 10
num2: .word 4

	.text
	li $v0, 4
	la $a0, ask
	syscall 
	
	li $v0, 5
	syscall 
	move $s0, $v0
	
	li $v0, 4
	la $a0, ask
	syscall 
	
	li $v0, 5
	syscall 
	move $s1, $v0
	
	li $v0, 4
	la $a0, x
	syscall 
	
	li $v0, 1 
	move $a0, $s0
	syscall 
	
	li $v0, 4
	la $a0, y
	syscall 
	
	li $v0, 1 
	move $a0, $s1
	syscall 
	
	li $v0, 4
	la $a0, z
	syscall 
	
	li $v0, 1
	div $a0, $s0, $s1
	syscall 
	
	
	
	
	

