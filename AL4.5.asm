	.data
matrix_h: .space 96
matrix_x: .space 16
matrix_y: .space 24
message: .asciiz "Matrix y() = \n"
newLine: .asciiz "]\n"
bracket: .asciiz "["
	.text
main:
jal fillMatrices

la $s0, matrix_h
la $s1, matrix_x
la $s2, matrix_y

li $t0, 6 #rows of matrix_h 
li $t1, 4 #cols of matrix_h and #rows of matrix_x
li $t2, 1 #cols of matrix_x

li $v0, 4
la $a0, message
syscall

li $t3, 0 #couter for #row of matrix_x
loop1:
li $t4, 0 #counter for #cols of matrix_x
li $s3, 0 #sum of the products being set to 0
la $t5, matrix_x #$t5 points to the matrix_x
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

#DONE
li $v0, 10
syscall

#fill matricies
fillMatrices:

#filling matrix_x
la $t0, matrix_x
li $t1, 1
sw $t1, ($t0)
li $t1, 3
sw $t1, 4($t0)
li $t1, 1
sw $t1, 8($t0)
li $t1, 2
sw $t1, 12($t0)

#filling matrix_h
la $t0, matrix_h
li $t1, 1 #h(0)
li $t2, 2 #h(1)
li $t3, 1 #(h2)

li $t4, 0 #counter for loop1
loop:
move $t5, $t4
sw  $t1, matrix_h($t5)
add $t5, $t5, 16
sw $t2, matrix_h($t5)
add $t5, $t5, 16
sw $t3, matrix_h($t5)
add $t4, $t4, 20 #incrementing the counter to the next position
bgt $t4, 66, endLoop
j loop
endLoop:
jr $ra