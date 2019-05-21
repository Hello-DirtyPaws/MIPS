	.data 
array1: .word 2, 3
array2: .word 4, 5
arraySum: .space 8
message: .asciiz "arraySum = ["
comma: .asciiz ","
bracket: .asciiz "]"
	.text
	
main:

la $t0, array1
la $t1, array2
la $t2, arraySum

li $t3, 2 #num of rows in the 1D array
li $t4, 0 #counter for num of rows

li $v0, 4
la $a0, message
syscall

loop:
li $s0, 0
lw $t5, ($t0) #array1 element stored in $t5
lw $t6, ($t1) #array2 element stored in $t6
add $t5, $t5, $t6 #$t5 = $t5 + $t6
sw $t5, ($t2) #storing the sum into the arraySum

#prints the number in the arraySum
li $v0, 1
lw $a0, ($t2) 
syscall

#incrementing the array pointers
add $t0, $t0, 4
add $t1, $t1, 4
add $t2, $t2, 4
addi $t4, $t4, 1 #increment the counter
beq $t4, $t3, endLoop

#prints the comma
li $v0, 4
la $a0, comma
syscall

j loop
endLoop:

li $v0, 4
la $a0, bracket
syscall
