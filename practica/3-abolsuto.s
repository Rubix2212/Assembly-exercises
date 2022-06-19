.text
.globl main
main:
  lw $a0, 4($a1)
  jal atoi

  jal absolute

  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall
absolute:
  blt $v0, $zero, negative
  j return
negative:
  mul $v0, $v0, -1
return:
  jr $ra 

#atoi no borrar
atoi:
  addi $sp, $sp, -8
  sw $s0, 0($sp)
  sw $s1, 4($sp)
  sw $s2, 8($sp)
  sw $s3, 12($sp)
  li $v0, 0
  li $s2, 1
  li $s3, 45
atoi_loop:
  lb $s0, 0($a0)
  beq $s0, $zero, ret
  beq $s0, $s3, atoi_negative
  mul $v0, $v0, 10
  addi $s1, $s0, -48
  add $v0, $v0, $s1
atoi_inc:
  addi $a0, $a0, 1
  j atoi_loop
ret:
  mul $v0, $v0, $s2
  lw $s0, 0($sp)
  lw $s1, 4($sp)
  lw $s2, 8($sp)
  lw $s3, 12($sp)
  addi $sp, $sp, 8
  jr $ra
atoi_negative:
  li $s2, -1
  j atoi_inc