#andrew nashid
#dividing numbers with
#   div & div.d & div.s & divu  13

	     .data
#==================Setting it all up==========
myFloat1 :  .float 3.5
myFloat2 :  .float 1.25
myFloatZ :  .float 0

myDouble1:  .double 9.5
myDouble2:  .double 3.25
myDoubleZ:  .double 0

newLine  :  .asciiz "\n"

quo	:   .asciiz "\nQuotient\n"
mod	:   .asciiz "\nRemainder\n"

#=============================================
	     .text
main:
		#Integer division
	    #adding values straight to registers
	    #  is less time consuming than
	    #  making calls to registers	
	     addi $t0, $zero, 110
	     addi $t1, $zero, 8
	     
	     
	     #the result of $t0/$t1
	     #  will move into hi and lo
	     div $t0, $t1


	     #lo and hi are special registers
	     # which aren't directley addressable
	     # hence the mflo & mfhi instructions
	     # which will move the values to our
	     # accessible registers
	     
	     #mflo aka move from lo
	     # $LO = Quotient
	     mflo $s0
	     
	     #mfhi aka move from hi
	     # $HI = Remainder
	     mfhi $s1     

#outputting the quotient and remainder
#  seperately as two integers 
	     li $v0, 4
	     la $a0, quo
	     syscall
	     
	     li $v0, 1
	     addi $a0, $s0, 0
	     syscall

	     li $v0, 4
	     la $a0, mod
	     syscall
	     
	     li $v0, 1
	     addi $a0, $s1, 0
	     syscall
#==========================================	     
	#float division
	
	    #loading single precision values into
	    # our coprocessor1 registers
	     lwc1 $f0, myFloat1
	     lwc1 $f1, myFloat2 
	     lwc1 $f2, myFloatZ   
	      
	     #  $f2 = $f0 / $f1
	     #div.s is for single precision
	     # AKA float division
	     #No need here for a hi and lo
	     # as with floating and double 
	     # precision division, there is 
	     # no remainder. The answer is in
	     # one number
	     div.s $f3, $f0, $f1
	     

#showing the answer
	     li $v0, 4
	     la $a0, quo
	     syscall
#Inorder to output, we use a system call code of 2
#For ANY coproc1 (coproccesor1) output, 
# it must $f12 MUST be used
# as the destination
# Also, we typically cant use Load Word instruction
# unless we deal with memory calls (our answer
# isn't memory)
# so we create a 'zero' value corpoc1 register
# and use it for our multi-register instruction
# add.s (add single-precision)
	     li $v0, 2
	     add.s $f12, $f2, $f3
	     syscall

#===============================================
	#double division
#same scenario as above, but with double precision
# numbers, thus the values must be stored in every 
# -other EVEN register
	ldc1 $f4,  myDouble1
	ldc1 $f6,  myDouble2
	ldc1 $f8,  myDoubleZ
	
	#$f10 = $f6 / $f4
	#$f10  = 2.25 / 7.5
# div.d for divide double precision	
	div.d $f10, $f6, $f4
	
	
	li $v0, 4
	la $a0, quo
	syscall
#addiing quotient to $f8, our 'zero'
# coproc1 register	
	li $v0, 3
	add.d $f12, $f8, $f10
	syscall
	     
#==============================================
		#unsigned Integer Division
#similar to our first problem set of integer division
#We are using the same values, well
# Imporatant to note, that we are dealing with unsigned
# division, as indicated by our DIVU (division unsigned)
# instruction. 		
	     addi $t2, $zero, -110
	     addi $t3, $zero, 8
	     
	     # lo and hi = $t2 / $t3
#Because $t2 is negative, and we are dealing with an
# unsigned operation on a negative double precision 
# number, the padded 1's on the negative number
# are now treated as part of an unsigned number
# thus making a potentially large number to dive     
	     divu $t2, $t3
	     
	     # $LO = Quotient
	     mflo $s2
	     
	     # $HI = Remainder
	     mfhi $s3     

#showing the answer
# using proper system calls for
# string and integer quotient 
# and remainder
	     li $v0, 4
	     la $a0, quo
	     syscall
	     
	     li $v0, 1
	     addi $a0, $s2, 0
	     syscall

	     li $v0, 4
	     la $a0, mod
	     syscall
	     
	     li $v0, 1
	     addi $a0, $s3, 0
	     syscall
         	           	           	           	           	           	           	           	           	           
#================================================
	    #closing the program	             
	     li $v0, 10 #system call code to exit 
	     		# program is 10
	     syscall	#EXIT
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
