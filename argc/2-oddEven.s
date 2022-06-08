.data
  msg: .asciiz "Ingrese num: "
  even: .asciiz "\nEs par\n"
  odd: .asciiz "\nEs impar\n"
.text
.globl main
main:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $a0, $v0

  jal OddEven
  
  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall

OddEven:
  rem $a0, $a0, 2
  beq $a0, $zero, par

  li $v0, 0

  j return
par:
  li $v0, 1
return:
  jr $ra