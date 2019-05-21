#andrew nashid
#multiplying numbers with 
#  mul

		.data
myMessage1:	.asciiz "\nThe product is "

myDouble1:	.float 3.5
myDouble2:	.float 2.5	
#product of these two two is 8.75
	
		.text
main:		
		lwc1 $f0, myDouble1
		lwc1 $f2, myDouble2 
		
		li $v0, 2
		mul.s  $f12, $f0, $f2
		syscall
		
		#I am loading values straight to registers
		#  to avoid making time-consuming calls
		#  to registers.

		addi $t0, $zero, 10   #$t0 = $zero + 10
		
		add $t1, $zero, 4     #for some reason,
				      # add works with immediate
		
		mul  $t2, $t0, $t1   #mul is psuedo-code which
				     #  which doesn't examine 
				     #  or save bits for hi register.
				     #  Treats product as 32 bits.
				
		li $v0, 4	     #system call code to OS to print
				     #  string is 4
		la $a0, myMessage1   #load address into $a0
		syscall
		
		li $v0 , 1	     #system call code to OS to print
				     #  integer is 1
		add $a0, $zero, $t2  #add $t2 and $zero to assembler
				     #  temporary
		syscall
			
		#Closing the program
		
		li $v0, 10	    #system call code to OS 
				    #  to exit program
		syscall		    # exit
