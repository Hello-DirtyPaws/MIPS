	.data 

	.text
	
main:

li $t0, 1
addi $t1, $t0, 2
addi $t2, $t1, 3
addi $t3, $t2, 4
addi $t4, $t3, 5


li $v0, 1
move $a0, $t4
syscall 