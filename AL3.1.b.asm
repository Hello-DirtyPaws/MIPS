.data
.text  
 main:
  
  li $s2, 3 #max value of j is stored in $s2
  li $s0, 3 #max value of i is stored in $s0
  li $t1, 0 #it will store the final answer
  li $t4, 0 #counter for j
  
   doubleSum: 
  li $t0, 0 #counter for i
  li $t3, 1 #$t3 stores the value of 2^i
  li $s1, 0 #$s1 stores the value of 2^i +1
  add $t4, $t4,1 #increment the counter by 1
  
  getPowerOfTwo:
  add $t0, $t0, 1 #increment the counter by 1
  mulu $t3, $t3, 2
  add $s1, $s1, $t3
  add $s1, $s1, 1
  beq $s0, $t0, endGetPowerOfTwo
  j getPowerOfTwo
  endGetPowerOfTwo:
  
  add $t1, $t1, $s1 
  add $t1, $t1, $t4 # (2^i +1) + j
  
  beq $t4, $s2, endDoubleSum
  j doubleSum
  endDoubleSum:
  
  li $v0, 1	#printing the final answer
  move $a0, $t1
  syscall