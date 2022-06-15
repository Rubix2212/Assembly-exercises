.data
  msg: .asciiz "Ingrese numero: "
  error: .asciiz "Error\n"
.text
.globl main
main:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $a0, $v0

  blt $a0, $zero, error404

  jal fibonacci

  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall
error404:
  li $v0, 4
  la $a0, error
  syscall

  li $v0 ,10
  syscall
fibonacci:
  addi $sp, $sp, -20
  sw $a0, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  sw $s2, 12($sp)
  sw $ra, 16($sp)

  li $s0, 1
  beq $a0, $zero, f0
  beq $a0, $s0, f1

  addi $a0, $a0, -1
  jal fibonacci
  move $s1, $v0

  addi $a0, $a0, -1
  jal fibonacci
  move $s2, $v0

  add $v0, $s1, $s2

  j return
f0:
  li $v0, 0
  j return
f1:
  li $v0, 1
  j return
return:
  lw $a0, 0($sp)
  lw $s0, 4($sp)
  lw $s1, 8($sp)
  lw $s2, 12($sp)
  lw $ra, 16($sp)
  addi $sp, $sp, 20
  jr $ra