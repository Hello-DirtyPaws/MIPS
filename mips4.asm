	.data
lb1:	.asciiz "\n"
	.text
	
main:	li $t1, 4
	li $t2, 13
	div $t1, $t2
	
	mflo $a0
	li $v0, 2 	#prints the quotient; mflo
	syscall 
	
	
	li $v0, 4
	la $a0, lb1     #prints the new line ("\n"); lb1
	syscall 
	
	
	mfhi $a0
	li $v0, 1      #prints the remainder; mfhi
	syscall 