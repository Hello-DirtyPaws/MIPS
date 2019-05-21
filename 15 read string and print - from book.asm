#andrew nashid
#read string and print
# from e-book pdf pg. 31       15

	    .data
prompt:     .asciiz "Enter a string to print "
output:	    .asciiz "The string you entered is "
str:	    .space 41
strSize:    .word 40
	
	.text
main:
	#outputtting the prompt
	# for the user
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0,8	#system call code to read
			# string is 8
	la $a0, str	#load address of str in $a0
	lw $a1, strSize #storing in $a1
			# the size of the input
	syscall
	
	#outputting a message for the 
	#  user
	li $v0, 4
	la $a0, output
	syscall
	
	#outputting the user input
	# from previously,
	# as it was stored in str
	li $v0, 4
	la $a0, str
	syscall
	
	#Closing down the program
	li $v0, 10   #System call code to
		     # exit program is 10
	syscall