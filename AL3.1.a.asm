.data

.text  
 main:
  
  li $s0, 4 #max value of i is stored in $s0
  
  li $t0, 0 #counter value
  li $t3, 1 #$t3 stores the value of 2^i
  li $s1, 0 #$s1 stores the value of 2^i +1
  getPowerOfTwo:
  add $t0, $t0, 1
  
  mulu $t3, $t3,2
  add $s1, $s1, $t3
  add $s1, $s1, 1
  beq $s0, $t0, endGetPowerOfTwo
  j getPowerOfTwo
  
  
  endGetPowerOfTwo:
  li $v0, 1	#printing the final answer
  move $a0, $s1
  syscall
