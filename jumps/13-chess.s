.data
  msg: .asciiz "Ingrese numero: "
  black: .asciiz "*"
  white: .asciiz " "
  nl: .asciiz "\n"
.text
.globl main
main:
  li $v0, 4
  la $a0, msg
  syscall

  li $v0, 5
  syscall
  
  move $s0, $v0
  move $s1, $s0
  move $s2, $s0

outer_loop:
  beq $s0, $zero, exit
inner_loop:
  beq $s1, $zero, inner_exit
  add $s3, $s0, $s1
  rem $s3, $s3, 2
  beq $s3, $zero, print_black
  li $v0, 4
  la $a0, white
  syscall
  j continue
print_black:
  li $v0, 4
  la $a0, black
  syscall
continue:
  addi $s1, $s1, -1
  j inner_loop
inner_exit:
  li $v0, 4
  la $a0, nl
  syscall
  addi $s0, $s0, -1
  move $s1, $s2
  j outer_loop
exit:
  li $v0, 10
  syscall
