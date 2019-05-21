#andrew nashid
#print a float

		.data
myMessage :	.asciiz "The value of PI is "
myFloat	  :	.float 3.14

		.text
main :		
		li $v0, 4		#call code to system to print string is 4
		la $a0, myMessage	#load address of myMessage of into register $a0
		syscall			#call to the OS to perform the system call
		
		li $v0, 2		#call code to system to print float is 4
		lwc1 $f12, myFloat	#load float into register $f12 of coprocessor 1
		syscall			#call ot the OS to perform the system call
		
		li $v0, 10		#call code to the system to exit program
		syscall