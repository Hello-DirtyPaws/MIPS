#andrew nashid
#printing a double

		.data
myString :	.asciiz "The double precision numbers are\n"
andString:	.asciiz "\nand  \n"

myDouble1 :	.double 1.111
myDouble2 :     .double 2.222

zeroDouble:	.double 0

				
		.text
main:
		li $v0, 4		#system call code to print string is 4
		la $a0, myString	#load the address of myString into register $a0
		syscall
		
		
		ldc1 $f0, myDouble1	#load the double value of myDouble1 
					#  into register $f0 of coprocessor 1
		ldc1 $f2, myDouble2	#load the double value of myDouble2 
					#  into register $f2 of coproccesor 1 
		
		ldc1 $f4, zeroDouble	#load a zero digit into
					#  register $f4 of coprocessor1
		
		li $v0, 3		#call code to system to print double
		add.d $f12, $f0, $f4	#adding values from registers $f0 and $f4, 
					#  with destination as $f4
		syscall
		
		li $v0, 4		#call code to system to print string
		la $a0, andString	#loading address of andString into $a0
		syscall
		
		li $v0, 3		#call code to system to print double
		add.d $f12, $f2, $f4	#adding values from registers $f0 and $f4
					#  with destination as $f4
		syscall
		
		li $v0, 10		#call code to system to exit program
		syscall
		
		