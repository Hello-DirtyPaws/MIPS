#SURAJ UPADHYAY
#CSC 263-02
#10-25-2017

	.data
prompt: .asciiz "Enter an integer to print: "
output:	.asciiz "The number you entered is: "
	.text 

main:
	li $v0, 4 #output the prompt for the user
	la $a0, prompt 
	syscall 
	
	li $v0, 5 #input the number and save it to $v0
	syscall 
	move $s0, $v0 #move the saved number from $v0 to $s0
	
	li $v0, 4 #print out the label
	la $a0, output
	syscall 
	
	li $v0, 1 #Output the number that was entered
	move $a0, $s0 
	syscall 
	
	#Exiting the program
	li $v0, 10 
	syscall 
	
