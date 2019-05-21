#andrew nashid
#dividing number with
#  srl & srlv & sra & srav   12

	 .data
newLine: .asciiz "\n"

myNumber : .word -100
myShift  : .word -2

	
	.text
main:
# -100 / (2*2) = 25
	lw $t0, myNumber
	lw $t1, myShift
	
	#NOTE: IMMEDIATE OR VARIABLE MUST	
	# BE IN RANGE OF 0 - 31
	# THUS DIVIDING BY A NEGATIVE NUMBER
	# WOULD BE IMPOSSIBLE IN THIS CASE
	# THUS ONE WOULD USE 'DIV' INSTRUCTION
	
	#srl
	#shift right logical
		
	li $v0, 1	#sra takes the value in
	sra $a0, $t0, 2 # the register and divides
	syscall		# by 2 to power of value
			# in immediate
			# speaking in binary, shift
			# to the right by 'immediate'
			# spots
	li $v0, 4
	la $a0, newLine
	syscall
	
	#srlv
	#shift right logical variable
	
	li $v0, 1	   #srav acts in the same 
	srlv $a0, $t0, $t1 # manner as srl, but takes
	syscall	           # register as argument for
			   # shift, as opposed to
			   # immediate
			
	li $v0, 4
	la $a0, newLine
	syscall	
	
	#sra
	#shift right arithmetic
	
	li $v0, 1	   #sra acts in the sammer
	sra $a0, $t0, 2    # as the previous,
	syscall		   # EXCEPT IT DOESN'T CHANGE
			   # SIGNEDNESS OF VALUE
	
	li $v0, 4
	la $a0, newLine
	syscall	
		
	
	#srav
	#shift right arithmetic value
	
	li $v0, 1	   #similar to sra, 
	srav $a0, $t0, $t1 # except that it takes 
	syscall		   # a register argument,
			   # instead of immediate	
	li $v0, 4
	la $a0, newLine
	syscall	

	
#========Closing the progragram============
	
	li $v0, 10
	syscall
	
	
	
	