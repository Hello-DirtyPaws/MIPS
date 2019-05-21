#andrew nashid
#display a character


		.data
myCharacter:	.byte	'c'

		.text
main:		
		li $v0, 4		#call code to system to print character is 4
		la $a0, myCharacter	#load address of our character into $a0
		syscall			#call the the OS to perform system call
							
		li $v0, 10		#call code to system to 'gracefully exit'
		syscall
