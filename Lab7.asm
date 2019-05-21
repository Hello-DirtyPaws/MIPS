#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will print the length of a String and number of numeric and alpha characters in that string.

		.data
askForStr:	.asciiz "Please enter a string of not more than 20 characters: "
str:		.space  20
msg1:		.asciiz "\nThe length of the entered String is: "
msgNum:		.asciiz "\nThe number of numeric characters are: "
msgAlphaNum:	.asciiz "\nThe number of alpha characters are: "
		.text
	
main:	
	li $v0, 4
	la $a0, askForStr	#ask for the input string
	syscall
	
	li $v0, 8
	la $a0, str		#specifying the location to store the enterd string
	li $a1, 21		#specifying the length of the string to be entered, i.e, 20
	syscall

	la $a0, msg1	#prints the message "The length of the str"
	li $v0, 4
	syscall
	
	
	la $t0, str	#store the str address in $t0
	
	li $t1, 0	#str length
	li $s0, 0	#Numeric characters
	li $s1, 0	#Alpha characters
for:	
	lb $a0, 0($t0)
	beqz $a0, endFor	#end if its end of the string (0 asciiz value or the null)
	beq $a0, 10, endFor	#end if its a \n or enter
	jal catogorise_byte
	
	addi $t1, $t1, 1	#increment the length variable
	addi $t0, $t0, 1	#increment the string pointer
	j for
endFor:

	li $v0, 1
	move $a0, $t1
	syscall 
	
	li $v0, 4
	la $a0, msgNum	#prints "the number of numeric chars: "
	syscall
	
	li $v0, 1
	move $a0, $s0	#gives the number of numeric chars
	syscall
	
	li $v0, 4
	la $a0, msgAlphaNum	#prints "the number of alpha numeric chars: "
	syscall
	
	li $v0, 1
	move $a0, $s1	#gives the number of alpha numeric chars 
	syscall
	
	li $v0, 10	#exit
	syscall

catogorise_byte: 
	blt $a0, 48, end_catogorise_byte	#if ascii value less than 48, neither a letter nor a number
	bgt $a0, 122, end_catogorise_byte	#if ascii value greater than 122, neither a letter nor a number
	
	bgt $a0, 57, not_a_num			#if ascii value greater than 57, deffinitely not a number
	addi $s0, $s0, 1			#else, incrementing the number of numbers
	j end_catogorise_byte			#j to end
not_a_num:					#if ascii value greater than 57 but less than 122, it is either a letter or special character
	blt $a0, 65, end_catogorise_byte	#if ascii value less than 65, its's special character and j end
	addi $s1, $s1, 1			#else, incrementing the number of letters
end_catogorise_byte:
	jr $ra
	
	
	