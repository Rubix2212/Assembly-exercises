.data
  prompt: .asciiz "Ingrese numero: "
  true: .asciiz "Iguales\n"
  false: .asciiz "No iguales\n"
.text
.globl main
main:
  li $v0, 4 # cargo mensaje
  la $a0, prompt # muestro mensaje
  syscall # llamo al sitema

  li $v0, 5 # leo y guardo numero
  syscall # llamo al sitem
  move $t0, $v0 # muevo v0 a t0

  li $v0, 4 # carga mensaje
  la $a0, prompt # muestro mensaje
  syscall # llamo al sitem

  li $v0, 5 # leo y guardo numero
  syscall # llamo al sitem
  move $t1, $v0 # muevo v0 a t1
  
  li $v0, 4 # cargo mensaje
  la $a0, prompt # muestro mensaje
  syscall # llamo al sitem

  li $v0, 5 # leo y guardo numero
  syscall # llamo al sitem
  move $t2, $v0 # muevo v0 a t2

  add $s1, $t0, $t1 # sumo t0 + t1 y lo guardo en s1
  add $s2, $t0, $t2 # sumo t0 + t2 y lo guardo en s2
  add $s3, $t1, $t2 # sumo t1 + t2 y lo guardo en s3

  beq $s1, $s2, iguales1 # si s1 es igual a s2 salta a iguales1
desiguales:
  li $v0, 4 # cargo mensaje
  la $a0, false # muestro mensaje
  syscall #sumo t0 + t1 y lo guardo en s1

  j end # salta a end
iguales1:
  beq $s2, $s3, iguales2 # si s2 es igual a s3 salta a iguales2

  j desiguales # si no, salto a desiguales
iguales2:
  beq $s1, $s3, iguales3 # si s1 es igual a s3 salto a iguales3

  j desiguales # si no, salto a des iguales
iguales3:
  li $v0, 4 # cargo mensaje
  la $a0, true # muestro mensaje
  syscall # llamo al sistema
  
end:
  li $v0, 10 # exit
  syscall # llamo al sistema
