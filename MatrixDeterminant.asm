
	.data
A: .word 4, 1, 2, 1, 0, 3, 2, 3, 5
retStr: .asciiz "The determinant of the given symmetric matrix is: "
	.text
main:
la $a0, A
jal calcDeterminant

move $t0, $v0
li $v0, 4
la $a0, retStr
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

calcDeterminant:
move $t0, $a0
lw $t2,16($t0)
lw $t7,32($t0)
lw $t4,28($t0)
lw $t5,20($t0)
mul $t6,$t2,$t7
mul $s1,$t5,$t4
sub $s0,$t6,$s1
lw $t2,0($t0)
mul $s0,$t2,$s0
lw $t2,12($t0)
lw $t7,32($t0)
lw $t4,24($t0)
lw $t5,20($t0)
mul $t6,$t2,$t7
mul $s1,$t5,$t4
sub $a1,$t6,$s1
lw $t2,4($t0)
mul $a1,$t2,$a1
sub $s0,$s0,$a1
lw $t2,12($t0)
lw $t7,28($t0)
lw $t4,24($t0)
lw $t5,16($t0)
mul $t6,$t2,$t7
mul $s1,$t5,$t4
sub $a1,$t6,$s1
lw $t2,8($t0)
mul $a1,$t2,$a1
add $s0,$a1,$s0
move $v0, $s0
jr $ra
