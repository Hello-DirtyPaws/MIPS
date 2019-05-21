	.data
binArray: .space 64
prompt1: .asciiz "Please enter an integer: "
prompt2: .asciiz "16 bit binary representation is: "
	.text
main:

#print prompt1
li $v0, 4
la $a0, prompt1
syscall

#Take the user input
li $v0, 5
syscall
move $s0, $v0 #user input stored in $s0
move $t1, $s0 #user input also copied to $t1
li $t3, 2 #2 is sotred in $t3

la $t0, binArray
loop:
beqz $t1, endLoop
div $t1, $t3
mflo $t1 #stores the quotient
mfhi $t2 #stores the remainder
sw $t2, ($t0) #stores the remainder in the array
add $t0, $t0, 4
j loop
endLoop:

li $v0, 4
la $a0, prompt2
syscall

la $t0, binArray + 60
li $t2, 0
loop2: #prints the binary array in reverse loop
#loads the array integer in $t1
lw $t1, ($t0)

#prints the binary array in the loop
li $v0, 1
move $a0, $t1
syscall

sub $t0, $t0, 4
add $t2, $t2, 1
bge $t2, 16 endLoop2
j loop2
endLoop2:
