#SURAJ UPADHYAY
#CSC 263-02
#12-04-2017

#This program will convert a fahrenheit value to a celcius value and print it.

	 .data 
prompt1: .asciiz "Enter the Fahrenheit value: "
newLn:	 .asciiz "\n" 
prompt2: .asciiz "The Celsius value is: "
five:	 .double 5
nine:	 .double 9
ttwo:	 .double 32
	 .text 
	 
main:	li $v0, 4
	la $a0, prompt1
	syscall 
	
	li $v0, 7
	syscall 
	mov.d $f4, $f0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	l.d $f2, ttwo
	sub.d $f4, $f4, $f2
	l.d $f2, five
	mul.d $f4, $f4, $f2
	l.d $f2, nine
	div.d $f4, $f4, $f2
	
	li $v0, 3
	mov.d $f12, $f4
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
