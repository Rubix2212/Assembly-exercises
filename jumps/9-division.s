.data
  prompt: .asciiz "Ingrese numero positivo: "
  verdadero: .asciiz "Verdadero\n"
  falso: .asciiz "Falso\n"
.text
.globl main
main:
  li $v0, 4 # carga mensaje
  la $a0, prompt # muestra mensaje
  syscall # llama al sistema

  li $v0, 5 # lee y guarda numero
  syscall # llama al sistema
  move $t0, $v0 # mueve v0 a t0

  li $v0, 4 # carga mensaje
  la $a0, prompt # muestra mensaje
  syscall # llama al sistema

  li $v0, 5 # lee y guarda numero
  syscall # llama al sistema
  move $t1, $v0 # mueve v0 a t1

  rem $s0, $t0, $t1 # t0 % t1 = s0
  rem $s1, $t1, $t0 # t1 % t0 = s1

  beq $s0, $zero, true # si s0 es igual a 0 salta a true
  beq $s1, $zero, true # si s1 es igual a 0 salta a true

  li $v0, 4 # carga mensaje
  la $a0, falso # muestra mensaje
  syscall # llama al sistema

  j end # salta a end
true:
  li $v0, 4 # carga mensaje
  la $a0, verdadero # muestra mensaje
  syscall # llama al sistema
end:
  li $v0, 10 # exit
  syscall # llama al sistema