#andrew nashid
#adding integers

		.data
myNumber1:	.word 25
myNumber2:	.word -40

		.text
main:

		lw $t0, myNumber1	#load the integer in word myNumber1 into $t0
		lw $t1, myNumber2	#load the integer in word myNumber1 into $t1


		#FIRST WAY

		li $v0, 1		#call code to system to print integer
		addu  $a0, $t0, $t1	#add the values in registers
					#  $t1 and $t2 to destination $a0
		syscall	
		
				
		#SECOND WAY
		
		add $t2, $t1, $t0	#add the values of $t1 and $t2
					#  in $t2
		li $v0, 1		#call code to system to print integer
		move $a0, $t2		#psuedo-instruction used to copy
					#  contents of $t2 into $a0
		syscall
		
		#THIRD WAY
		
		add $t3, $t1, $t0	#add the values of $t1 and $t0
					#   into $t3	
		li $v0, 1		#call code to system to print integer
		add $a0, $t3, $zero	#adding the sum($t3) with $zero(0)
					#  into assembler temporary
		syscall
		
		#FOURTH WAY
		
		add $t4, $t0, $t1	#add the values of $t0 and $t1
					#   into $t4
		li $v0, 1		#call code to system to print integer
		addi $a0, $t3, 0	#add $t3 and immediate value of 0
					#   into  $a0
		syscall
		
		#FIFTH WAY
		
		addi $t5, $t4, 0	#add the values of $t4 and zero
					# into %t5
		li $v0, 1		#call code to system to print integer
		move $t5, $zero		#psuedo-instruction to move $zero into $t5
		syscall

		#CLOSE THE PROGRAM
		
		li $v0, 10		#system call code to exit program
		syscall			#   'gracefully exit'
		
		
		
		
		
		
