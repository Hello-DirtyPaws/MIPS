#This program will compute the summation of j + (2k + 1) till k = 3, j = 2
.data
.text  
 main:
  
  li $t1, 3 #will hold the max value for k
  li $t3, 2 #will hold the max value for j
  li $t4, 0 #counter for j
  li $s1, 0 #will hold the final answer
  
  loop_j:
  add $t4, $t4, 1 #increment the j counter
  li $t0, 0 #counter for k
  li $s0, 0 #will hold the summation of (2k + 1)
  
  loop_k:
  add $t0, $t0, 1 #increment the k counter
  mulu $t2, $t0, 2 #$t2 =  k * 2
  add $t2, $t2, 1 #$t2 = $t2 + 1 = 2k + 1
  add $s0, $t2, $s0 #does the summation
  beq $t0, $t1, endLoop_k
  j loop_k
  endLoop_k:
  
  add $s0, $s0, $t4
  add $s1, $s1, $s0
  beq $t4, $t3, endLoop_j
  j loop_j
  endLoop_j:
  
  li $v0, 1	#printing the final answer
  move $a0, $s1
  syscall
