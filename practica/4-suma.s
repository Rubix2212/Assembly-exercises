.data
  msg: .asciiz "Ingrese numero: "
  suma: .asciiz "Suma: "
.text
.globl main
main:
  li $t1, 0
loop:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $t0, $v0

  beq $t0, $zero, exit
  add $t1, $t1, $t0

  j loop
exit:
  li $v0, 4
  la $a0, suma
  syscall

  li $v0, 1
  move $a0, $t1
  syscall
  
  li $v0, 10
  syscall