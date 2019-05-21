	.data
array:  .space 12
sum: 	.word 0
	.text	
la $t0, array #$t0 stores the array address
#loading integers to respective registers
li $t1, 2 
li $t2, 5
li $t3, 8

#storing the integers from registers to the respective memory locations
sw $t1, ($t0)
sw $t2, 4($t0)
sw $t3, 8($t0)

#loading the integers back to registers from the memory locations
lw $t4, ($t0)
lw $t5, 4($t0)
lw $t6, 8($t0)

#Computing the sum and storing it into $t7
add $t7, $t4, $t5
add $t7, $t7, $t6

#storing the sum to a memory location
sw $t7, sum

#loading the sum back to a register from the memory location
lw $t8, sum

#printing the sum
li $v0, 1
move $a0, $t8
syscall