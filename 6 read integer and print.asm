#andrew nashid
#program to read and print integer

		.data
inputStr :	.asciiz "\nEnter an integer "
outputStr:	.asciiz "The integers is "

		.text
main:
#practicing a few ways with different MIPS instructions
#to read and print integers


		li $v0, 4	 #call code to system to	
				 #  print String
		la $a0, inputStr #Load address of inputStr
				 # into $a0
		syscall
		
		li $v0, 5       #call code to system to
				#  read integer
		syscall
		add $t0, $zero, $v0 #store input from $v0	
				    # $t0				
		
		li $v0, 4	  #call code to system to
				  # print String
		la $a0, outputStr #load addres of our string
		syscall		  #  to $a0

		li $v0, 1	  #call code to print integer is
		add $a0, $t4, $t0 #loading our input in $t4, and
				  # and adding it to $a0, to 
				  # output it
		syscall
#==============================================
		#same proceedings as above,
		# just with different insturctions
		# here and there
		li $v0, 4
		la $a0, inputStr
		syscall
		
		#move instead of add
		li $v0, 5
		syscall
		move $t0, $v0
						
		li $v0, 4
		la $a0, outputStr
		syscall
		
		#addi instead of add
		#$a0 = $t0 + 0
		li $v0, 1
		addi  $a0, $t0, 0
		syscall
#===============================================					
		li $v0, 10 #call co to system to exit
		          #  program
		syscall	  #...exiting
		
		
		
