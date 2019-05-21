#SURAJ UPADHYAY
#CSC 263-02
#10-23-2017


#This is my first program and will print "Hello world."
	.data
msg1:	
	.asciiz  "Hello World"
	.text
main:
	li $v0, 4		#System call code to print string is 4
	la $a0, msg1		#load address of the string into $a0
	
	#Exit the program
	#li $v0, 10
	syscall			#Call the  OS to perform the syscall
				#where $v0 is the actual function called
				#which uses $v0 as an argument
	
