#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the length of a String and number of numeric and alpha characters in that string,
#using stacks and subroutines.

		.data
askForStr:	.asciiz "Please enter a string of not more than 20 characters: "
msg1:		.asciiz "\nThe length of the entered String is: "
msg2:		.asciiz "\nThe number of numericals in the entered string: "
msg3:		.asciiz "\nThe number of alpha characters in the entered string: "
str:		.space 20
		.text
	
main:	
	li $v0, 4
	la $a0, askForStr	#ask for the input string
	syscall

	li $v0, 8
	la $a0, str		#specifying the location to store the enterd string
	li $a1, 21		#specifying the length of the string to be entered, i.e, 20
	syscall
	move $t0, $a0		#$t0 contains the entered String
	
	li $s0, 0		#length variable
	li $s1, 0		#no. of alpha chars
	li $s2, 0		#no. of numericals
	
	lb $a0, 0($t0)		#store the value of the content at the address at $t0
	
for1:
	beqz $a0, endFor1	#end if its end of the string (0 asciiz value or the null)
	beq $a0, 10, endFor1	#end if its a \n or enter
	addi $s0, $s0, 1	#computes the length
	jal push		#push into the stack character by character
	addi $t0, $t0, 1	#incrementing location
	lb $a0, 0($t0)		#store the value of the content at the new address at $t0
	j for1
endFor1:
	 li $t1, 0
for2:
	beq $s0, $t1, endFor2
	addi $t1, $t1, 1
	jal pop
	jal catogorise_byte	#calculates num of alpha chars and stores the total into $s2
				#also calculates num of mumericals and stores the total into $s1
	j for2
endFor2:

	li $v0, 4
	la $a0, msg1	#msg prompt for length
	syscall
		
	li $v0, 1
	move $a0, $s0	#prints length
	syscall
	
	li $v0, 4
	la $a0, msg2	#msg prompt for num of alpha chars
	syscall
	
	li $v0, 1
	move $a0, $s1	#prints num of alpha chars
	syscall
	
	li $v0, 4
	la $a0, msg3	#msg prompt for num of numericals
	syscall
	
	li $v0, 1
	move $a0, $s2	#prints num of numericals
	syscall
		
	li $v0, 10	#exit
	syscall
	
push:					#push method for stack
	addi $sp, $sp, -4		#$sp = $sp - 4, assigned a new address in relation to the previous $sp
	sb $a0, ($sp)			#pushing in the current value($a0) into the memory at $sp
	jr $ra
	
pop:					#pop method for stack
	lb $a0, ($sp)			#load the value from the top (address in $sp) into $a0
	addi $sp, $sp, 4		#$sp = $sp + 4, assigned a previous address to $sp
	jr $ra	

catogorise_byte: 
	blt $a0, 48, end_catogorise_byte	#if ascii value less than 48, neither a letter nor a number
	bgt $a0, 122, end_catogorise_byte	#if ascii value greater than 122, neither a letter nor a number
	
	bgt $a0, 57, not_a_num			#if ascii value greater than 57, deffinitely not a number
	addi $s2, $s2, 1			#else, incrementing the number of numbers
	j end_catogorise_byte			#j to end
not_a_num: 					#if ascii value greater than 57 but less than 122, it is either a letter or special character
	blt $a0, 65, end_catogorise_byte	#if ascii value less than 65, its's special character and j end
	addi $s1, $s1, 1			#else, incrementing the number of letters
end_catogorise_byte:
	jr $ra



