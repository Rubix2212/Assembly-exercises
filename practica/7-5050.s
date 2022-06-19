.text
.globl main
main:
  li $s0, 0
  li $s1, 0
  li $s2, 100
loop:
  beq $s1, $s2, exit
  addi $s1, $s1, 1
  add $s0, $s0, $s1

  j loop
exit:
  li $v0, 1
  move $a0, $s0
  syscall

  li $v0, 10
  syscall