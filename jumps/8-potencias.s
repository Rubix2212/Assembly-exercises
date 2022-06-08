.data
    prompt: .asciiz "\nIngrese potencia: "
    nl: .asciiz "\n"
    result: .asciiz "Suma de potencias: "
.text
.globl main
main:
    li $v0, 4 # cargo mensaje
    la $a0, prompt # muestro mensaje
    syscall # llamo al sistema

    li $v0, 5 # leo y guardo numero
    syscall # llamo al sistema
    move $t0, $v0 # muevo v0 a t0
    # defino constantes
    li $t1, 1 # contador
    li $t2, 1 # potencia
    li $t3, 0 # suma
loop:
    bgt $t1, $t0, end # si t1 es menor a t0 saltar a end
    li $v0, 1 # cargo numero (potencia)
    move $a0, $t2 # muestra potencia
    syscall # llamo al sistema

    li $v0, 4 # cargo salto de linea
    la $a0, nl # muestro salto de linea
    syscall # llamo al sistema

    add $t3, $t3, $t2 # t3 = t3 + t2
    addi $t1, $t1, 1 # t1 = t1 + 1
    mul $t2, $t2, 2 # t2 = t2 * 2

    j loop # si no se completo bgt salta a loop
end: 
  li $v0, 4 # cargo mensaje
  la $a0, result # muestro mensaje
  syscall # llamo al sistema

  li $v0, 1 # cargo numero (suma)
  move $a0, $t3 # muestro suma
  syscall # llamo al sistema

  li $v0, 4 # cargo salto de linea
  la $a0, nl # muestro salto de linea
  syscall # llamo al sistema

  li $v0, 10 # exit
  syscall # llamo al sistema