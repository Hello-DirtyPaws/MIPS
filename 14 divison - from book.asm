#andrew nashid
#division problem 
# from e-book pdf pg. 38-39     14
	
	  .data
newLine:  .asciiz "\n"
lab1:	  .asciiz "The quotient is "
lab2:     .asciiz "The remainder is "

	   .text
main:
	   li $t1, 14  #load 14 in $t1
	   li $t2, 4   #same where $t2 = 4
	   
	   #perform the division 14/4
	   div $t1, $t2 
	   
	   li $v0, 4	 #system call code to
	   		 # print string is 4
	   la $a0, lab1  #loading address of o
	   		 #  string into $a0
	   syscall
	   
	   li $v0, 1	#system call code to pring
	  		# integer is 1
	   mflo $a0     #placing the value in special
	  		#register lo, to $a0
	    syscall
	   
	   li $v0, 4	    #system call code to 
	   		    # print string is 4
	   la $a0, newLine  #printing a new line 
	   		    # character
	   syscall
	   
	   li $v0, 4	  #system call code to
	   		  # print string is 4
	   la $a0, lab2   #loading addres of lab2
	   		  # into $a0
	   syscall
	   
	   li $v0, 1	 #printing the remainder
	   mfhi $a0      #loading into $a0 from lo
	   syscall
	      
	   li $v0, 10 #system call code to exit is 10
	   syscall    #gracefully exiting...
		