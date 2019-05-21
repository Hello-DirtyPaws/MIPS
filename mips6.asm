	.data
pro1:	.asciiz "Enter an integer: "
out1:   .asciiz "The number you enrered is "

	.text
main: 	
	jal get_int	#
	move $s0, $v0
	
	li $v0, 4
	la $a0, out1
	syscall 
	
	li $v0, 1 
	move $a0, $s0
	syscall 
	
	li $v0, 10
	syscall 
	
get_int: 
	.text
		li $v0, 4
		la $a0, pro1
		syscall 
		
		li $v0, 5
		syscall 
		
		jr $ra
