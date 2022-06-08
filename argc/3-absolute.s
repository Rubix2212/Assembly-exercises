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

  jal absolute

  li $v0, 1
  syscall

  li $v0, 10
  syscall
absolute:
  blt $a0, $zero, negative

  jr $ra

negative:
  mul $a0, $a0, -1
return:
  jr $ra