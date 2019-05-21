	.data
new_ln: .asciiz "\n"
lab1:   .asciiz "The quotient is "
lab2:   .asciiz "The remainder is " 
lab3:   .asciiz "The division is "
fp1:	.double 14.25
fp2: 	.double 2.0
	.text 

main:   li $t1, 14
	li $t2, 4
	div $t1, $t2  #performs the division 14/4
	
	li $v0, 4 #prints the first output label
	la $a0, lab1
	syscall 
	
	mflo $a0 # prints the quotient 3
	li $v0, 1
	syscall 
	
	la $a0, new_ln  #prints the new_ln
	li $v0, 4
	syscall 
	
	li $v0, 4 #prints the second output label
	la $a0, lab2
	syscall 
	
	mfhi $a0 # prints the remainder 2
	li $v0, 1
	syscall 
	
	li $v0, 4
	la $a0, new_ln  #prints the new_ln
	syscall 
	
	l.d  $f2, fp1
	l.d $f4, fp2
	div.d  $f12, $f2, $f4  #performs the division DOUBLE
	
	li $v0, 4 #prints the first output label
	la $a0, lab3
	syscall 
	
	li $v0, 3 #Prints the value stored in $f12
	syscall 
	
	li $v0, 4
	la $a0, new_ln  #prints the new_ln
	syscall 
		
	#Exiting the program
	li $v0, 10 
	syscall 
		
	
