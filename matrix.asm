.data
array: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
size: .word 4
msg: .asciiz " The sum of left to right daigonal is: "
  .text 

la $a0, array # Starting 
lw $a1, size # n value is stored in $a1

lefttorightsum: 
    lw $t8, 0($a0) # contents of $a0 will be stored in $t8
    move $t1, $a0  # move $a0 to $t1
    addi $t3, $a1,1 #add $t3= $a1+1
    sll $t3, $t3, 2 # multiply by 4
    addi $t0, $a1, -1 # Add $t0= $a1-1
    
    loop: 
    add $t1, $t1, $t3 # Calculate the next address
    lw $t2, 0($t1) # load contents of $t1 to $t2
    add $t8, $t8, $t2 # add $t8= $t8+$t2
    addi $t0, $t0, -1 # add $t0= $t0-1
    bgtz $t0, loop # It will check for if greater than 0 if it is true 
    li $v0, 4 # the loop will continue
    la $a0, msg # it will print the output lable
    syscall 
    
    li $v0, 1
    move $a0, $t8 # Move $t8 to $a0
    syscall 
    li $v0, 10
    syscall 
