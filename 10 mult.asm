#andrew nashid     
#multiplying numbers with
#  mult         10

	     .data
myMessage:   .asciiz "The product is "

	     .text
main:

	    #storing, by immediate addition,
	    # the values straight into registers
	    #  to avoid lengthy memory calls

	     addi $t0, $zero, 4
	     addi $t1, $zero, 15
	

	     mult $t0, $t1	#Multiply the values
	      			#  in these values
	      			#This produces a 64 bit value
	      			#  upper 32 bits stored in hi
	      			#  lower 32 bits stored in lo

	      
	     mflo $t2	   #loads the lower 32 bits to $t2

	     
	     li $v0, 4	   	#call code to system to 
	     			#  print string
	     la $a0, myMessage  #load the address of myMessage 
	     			#  in $a0
	     syscall 
	     
	     li $v0, 1		  #call code to system to 
	     	
	     #could also use move for below	
	     			  #  print integer
	     add $a0, $zero, $t2  #add $zero and $t2 to
	     			   #  $a0
	     syscall
	     
	     #Gracefully close
	     
	     li $v0, 10 #call code to OS to exit the program
	     syscall	#exit...
	     
	      
	      		   
	      
	      
	
	
