.data
  nl: .asciiz "\n"
  zero: .asciiz "0"
  one: .asciiz "1"
.text
.globl main
main:
  lw $a0, 4($a1)
  jal atoi
  move $s0, $v0

  jal pow

  li $v0, 10
  syscall
pow:
  li $s1, 1 # contador
  li $s2, 1 # potencia
  li $s3, 0 # suma
  

  li $v0, 4
  la $a0, one
  syscall
pow_loop:
  bgt $s1, $s0, return
  add $s3, $s3, $s2
  addi $s1, $s1, 1
  mul $s2, $s2, 2

  li $v0, 4
  la $a0, nl
  syscall

  li $v0, 1
  move $a0, $s2
  syscall
  j pow_loop
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