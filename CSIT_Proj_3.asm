#f(3) = (1+(3))(1+(3)^2)(1+(3)^3)
.data
.text  
 main:
 
 li $s0, 3 #stores the value of x
 li $s2, 1 #Multiplication of tokens
 li $t0, 0 #counter for no. of tokens
 
 
 tokens:
 add $t0, $t0, 1
 li $t1, 0 #counter for power loop
 li $s1, 1 #Stores the power 
 
 getPower:
 add $t1, $t1, 1
 mulu $s1, $s1, $s0 #$s1 = $s1 * x
 beq $t1, $t0, endPower
 j getPower
 endPower:
 
 add $s1, $s1, 1
 mulu $s2, $s2, $s1 #Step by step multiplying the tokens
 
 beq $t0, $s0, endTokens
 j tokens
 endTokens:
 
 move $t0, $s2
 
 li $v0, 1 
 move $a0, $t0
 syscall 