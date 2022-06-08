# 1. ¿Cuál es el código en MIPS para el siguiente enunciado de C? f = g + (h - 5);
# La idea seria que le usario ingrese g y h. F es lo que te tiene q mostrar.
.data
f: .asciiz "\nIngresar f: "
g: .asciiz "\nIngresar g: "
h: .asciiz "\nIngresar h: "
nl: .asciiz "\n"

.text
.globl main
main:
    li $v0, 4 # carga mensaje
    la $a0, g # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda el numero ingresado
    syscall # llama al sistema
    move $t1, $v0 # mueve v0 a t1

    li $v0, 4 # carga mensaje
    la $a0, h # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda el numero ingresado
    syscall # llama al sistema
    move $t2, $v0 # mueve v0 a t2
    
    li $v0, 4 # carga salto de linea
    la $a0, nl # muestra salto de linea
    syscall # llama al sistema

    addi $t3, $t2, -5 # suma una variable con una constante y la guarda en t3 (h + (-5)) 
    add $t4, $t1, $t3 # suma t1 (g) + t3 (addi anterior) y lo guarda en t4
    syscall # llama al sistema

    li $v0, 1 # lee numero
    move $a0, $t4 # carga numero
    syscall # llama al sistema

    li $v0, 10 # exit
    syscall # llama al sistema
