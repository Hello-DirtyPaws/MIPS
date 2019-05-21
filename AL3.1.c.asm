.data
.text  
 main:
  
  li $s3, 2 #max value of k is stored in $s3
  li $s2, 2 #max value of j is stored in $s2
  li $s0, 2 #max value of i is stored in $s0
  li $t5, 0 #will store the final answer
  li $t1, 0 #counter for k
  
  tripleSum:
  li $t2, 0 #will store the total of j + (2^i +1)
  li $t4, 0 #counter for j
  add $t1, $t1, 1 #increment the k counter by 1
  
   doubleSum: 
  li $t3, 1 #$t3 stores the value of 2^i
  li $s1, 0 #$s1 stores the value of 2^i +1
  li $t0, 0 #counter for i
  add $t4, $t4,1 #increment the j counter by 1
  
  getPowerOfTwo:
  add $t0, $t0, 1 #increment the i counter by 1
  mulu $t3, $t3, 2
  add $s1, $s1, $t3
  add $s1, $s1, 1
  beq $s0, $t0, endGetPowerOfTwo
  j getPowerOfTwo
  endGetPowerOfTwo:
  
  add $t2, $t2, $s1 
  add $t2, $t2, $t4 # (2^i +1) + j
  beq $t4, $s2, endDoubleSum
  j doubleSum
  endDoubleSum:
  
  add $t5, $t5, $t2
  add $t5, $t5, $t1 # (2^i +1) + j + k
  
  beq $t1, $s3, endTripleSum
  j tripleSum
  endTripleSum:
  
  li $v0, 1	#printing the final answer
  move $a0, $t5
  syscall
