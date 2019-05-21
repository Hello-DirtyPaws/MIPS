#andrew nashid
#subtracting integers to get a negative result

		.data
num1:		.word 40
num2:		.word 65
		
		.text
main:
		#FIRST WAY
		
		lw $t0, num1 		#$t0 = 40
		lw $t1, num2		#$t1 = 65
		
		# 40 - 65 = -25
			
		li $v0, 1		#system call code to
					#  print integer is 1
		sub $a0, $t0, $t1	#store the difference 
					#  of $t0 and $t1
					#   in $a0
		syscall
		
		#SECOND WAY
		
		lw $t0, num1		#load word num1 into $t0
		lw $t1, num2		#load word num2 into $t1
		
		sub $t2, $t0, $t1	#$t2 = $t0 - $t1
		
		li $v0, 1		#system call code 
					#  to print integer is 1
		move $a0, $t2		#psuedo-code to store 
					#  $t2 into $a0
		syscall
		
		#THIRD WAY
		
		lw $t0, num1		#$t0 = num1
		lw $t1, num2		#$t1 = num2
		
		sub $t2, $t0, $t1	#$t2 = $t0 - $t1
		
		li $v0, 1		#system call code to 
					#  print integer is 1
		
		subi $a0, $t2, 0	#$a0 = $t2 - 0
		syscall
		
		#FOURTH WAY
		
		lw $t0, num1		#load num1 into
					#  register $t0
		lw $t1, num2		#load num2 into
					#  register $t1
		
		sub $t2, $t0, $t1	#store the difference
					# of $t0 and $t1
					# into $t2
		
		li $v0, 1		#call code to system to 
					# print integer is 1
		sub $a0, $t2, $zero	#$zero is hard-wired as 0
					# so it is similar to subi
		syscall
		
		#FIFTH WAY
		lw $t0, num1		#$t0 = 45
		lw $t1, num2		#$t1 = 60
		
		sub $t2, $t0, $t1	#$t2 = 45 - 60
		
		li $v0, 1		#system call code to print
					# integer is 1
		move $t2, $zero		#move = subi = 
					# $t2 = $zero - 0
		syscall
		
		
		#CLOSE THE PROGRAM
		
		li $v0, 10	#call code to system to exit program 
		syscall		#exit
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
