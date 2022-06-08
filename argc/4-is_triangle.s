.data
  msg: .asciiz "Ingrese num: "
.text
.globl main
main:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $a0, $v0

  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $a1, $v0

  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $a2, $v0

  jal triangle

  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall

triangle:
  add $s0, $a0, $a1
  add $s1, $a0, $a2
  add $s2, $a1, $s2

  bge $a0, $s2, not_triangle
  bge $a1, $s1, not_triangle
  bge $a2, $s0, not_triangle

  li $v0, 1

  j return
not_triangle:
  li $v0, 0
return:
  jr $ra