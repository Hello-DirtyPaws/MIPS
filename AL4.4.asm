	.data
matrix_m: .word 1, 2, 3, 4
matrix_v: .word 5, 6
matrix_r: .space 8
message: .asciiz "Matrix r() = \n"
newLine: .asciiz "]\n"
bracket: .asciiz "["
	.text 
main:

la $s0, matrix_m
la $s1, matrix_v
la $s2, matrix_r

li $t0, 2 #rows of matrix_m 
li $t1, 2 #cols of matrix_m and #rows of matrix_v
li $t2, 1 #cols of matrix_v

li $v0, 4
la $a0, message
syscall

li $t3, 0 #couter for #row of matrix_m
loop1:
li $t4, 0 #counter for #cols of matrix_m
li $s3, 0 #sum of the products being set to 0
la $t5, matrix_v #$t5 points to the matrix_v
loop2:
lw $t6, ($t5)
lw $t7, ($s0)

mul $t6, $t6, $t7 #multiply the entries
add $s3, $s3, $t6 #add to the sum

add $t5, $t5, 4
add $s0, $s0, 4

add $t4, $t4, 1
beq $t4, $t1, endLoop2
j loop2
endLoop2:

sw $s3, ($s2)

li $v0, 4
la $a0, bracket
syscall

li $v0, 1
lw $a0, ($s2)
syscall

li $v0, 4
la $a0, newLine
syscall

add $s2, $s2, 4
add $t3, $t3, 1
beq $t3, $t0 endLoop1
j loop1
endLoop1: