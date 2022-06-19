.data
  msg: .asciiz "Ingrese numero: "
  suma: .asciiz "\nSuma: "
  prom: .asciiz "\nPromedio: "
.text
.globl main
main:
  li $t1, 0
  li $t2, 0
loop:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  move $t0, $v0

  beq $t0, $zero, exit
  add $t1, $t1, $t0
  addi $t2, $t2, 1

  j loop
exit:
  div $t2, $t1, $t2
  li $v0, 4
  la $a0, suma
  syscall

  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 4
  la $a0, prom
  syscall

  li $v0, 1
  move $a0, $t2
  syscall  
  
  li $v0, 10
  syscall