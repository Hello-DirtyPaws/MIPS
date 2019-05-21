#andrew nashid
#multiplying numbers with 	
#   sll  and sllv     11

	 .data
newLine: .asciiz "\n"
	
	 .text
main:
	 #  2 * (2^3) = 16
	 addi $s0, $zero, 3 #adding immediate value of 3
			    # to register $s0
	 sll $s1, $s0, 2    #shift legft logical instr.
			    #  multiply value of $s0 by
			    #  2 to the power of
			    #  immediate value, to left
			    #  Then store in $s1
			    #...or shift binary value
			    #  to left off the number
			    #  immediate
	 
	 li $v0, 1          #System call code to print
	 		    #integer is 1
	 addi $a0, $s1, 0   #add value of 
	 syscall
#===============================================
# close the program

	li $v0, 4	#having a new line printed
	la $a0, newLine	# to improve readability
	syscall	

	
#==================================================	
		
	li $t0, 4 #another way I'm demonstrating
	li $t1, 2 # the possible ways to store 
		  # values in registers
	#  4 * (2^2) = 16
	sllv $t0, $t0, $t1 #an alternative to sll
			   # except insread of using 
			   # an immediate value
			   # ,a register holding the
			   #  number, is used.
	li $v0, 1
	add $a0, $zero, $t0 
	syscall

	#No need for shift left arithmetic
	#  as sll or sllv can both change 
	#  signedness.
#============CLOSE THE PROGRAM=====================	
	li $v0, 10 #call code to exit program is 10
	syscall   #exit
