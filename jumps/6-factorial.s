.data
msg: .asciiz "Ingrese factorial (menor a 21): "
nl: .asciiz "\n"
.text
.globl main
main:
  li $v0, 4 # carga mensaje
  la $a0, msg # muestra mensaje
  syscall # llama al sistema

  li $v0, 5 # lee y guarda numero
  syscall # llama al sistema
  move $a0, $v0 # muestra numero(?

  jal factorial # guarda posicion y salta a factorial

  move $a0, $v0 # muestra numero(?
  li $v0, 1 # carga numero
  syscall # llama al sistema

  li $v0, 4 # carga salto de linea
  la $a0, nl # muestra salto de linea
  syscall # llama al sistema

  li $v0, 10 # exit
  syscall # llama al sistema
factorial:
  li $v0, 1 # carga numero
loop:
  beq $a0, $zero, return # si a0 = 0 salta a return
  mul $v0, $v0, $a0 # multiplica v0 * a0 y lo guarda en v0
  subi $a0, $a0, 1 # a0 - 1 y lo guarda en a0
  j loop # salta a loop
return:
  jr $ra # vuelve a la linea 18
    