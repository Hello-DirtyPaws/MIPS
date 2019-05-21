	.data 

	.text
	
main:

li $t0, 1
li $t1, 2
li $t2, 3
li $t3, 4
li $t4, 5

add $t5, $t0, $t1
add $t5, $t5, $t2
add $t5, $t5, $t3
add $t5, $t5, $t4


li $v0, 1
move $a0, $t5
syscall 