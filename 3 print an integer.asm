#andrew nashid
#print an integer

		.data
myNumber :	.word 23
myMessage:	.asciiz "The number is "

		.text
main:	
		li $v0, 4		#call code to system to print string is 4
		la $a0, myMessage	#load address of myMessage into $a0 
		syscall			#call the OS to perform the string print call
								
		li $v0, 1		#call code to system to print integer is 1
		lw $a0, myNumber	#load the word, labeled myNumber, into $a0
		syscall			#call the OS to perform the integer print call
			
		li $v0, 10		#call code to have the system exit the program
		syscall
