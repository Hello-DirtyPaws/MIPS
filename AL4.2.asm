	.data
array: .word 2, 3, 4
	.text
main:
li $t1, 0 
#loading the integer at address (array) to $t0 and adding it to the sum register $t1
lw $t0, array
add $t1, $t1, $t0

#loading the integer at address (array+4) to $t0 and adding it to the sum register $t1
lw $t0, array+4
add $t1, $t1, $t0

#loading the integer at address (array+8) to $t0 and adding it to the sum register $t1
lw $t0, array+8
add $t1, $t1, $t0

#printing the sum
li $v0, 1
move $a0, $t1
syscall