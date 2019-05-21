#andrew nashid
#display the string "hello world"


		.data
message:	.asciiz "Hello World \n" 
		
		.text
main:
		li $v0, 4		#call code to the system to print string
		la $a0, message		#load the address of message into register $a0
		syscall			#make the call to the system to perform action
		
		li $v0, 10		#call code to the system to gracefully exit is 10
		syscall
