# 2. Escribir un programa que acepte dos números enteros del usuario y calcule el cociente y resto de la división entera. El resultado tiene que verse así en la consola:
# hay que mostrar (Dividendo = divisor * cociente + resto)

.data
msg: .asciiz "\nIngrese numero: "
equal: .asciiz " = "
multi: .asciiz " x "
sum: .asciiz " + "
nl: .asciiz "\n"


.text
.globl main
main:
    li $v0, 4 # carga mensaje
    la $a0, msg # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee numero
    syscall # llama al sistema
    move $t1, $v0 # mueve v0 a t1
    
    li $v0, 4 # carga mensaje
    la $a0, msg # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee mensaje
    syscall # llama al sistema
    move $t2, $v0 # mueve v0 a t2

    div $t3, $t1, $t2 # divide t1 / t2
    rem $t4, $t1, $t2 # da el resto de t1 / t2 (es decir que si estamos dividiendo 55/2 = 27,5, pero el resto lo va a tomar como si fuera 1, porque 55 = 27 x 2 + 1. Por lo tanto el resultado es 1)
    
    li $v0, 4 # carga salto de linea
    la $a0, nl # muestra salto de linea
    syscall # llama al sistema

    li $v0, 1 # carga numero
    move $a0, $t1 # muestra t1 (primer numero ingresado)
    syscall # llama al sistema

    li $v0, 4 # carga mensaje
    la $a0, equal # muestra =
    syscall # llama al sistema

    li $v0, 1 # carga numero
    move $a0, $t2 # muestra t2 (segundo numero ingresado)
    syscall # llama al sistema

    li $v0, 4 # carga mensaje
    la $a0, multi # muestra x
    syscall # llama al sistema

    li $v0, 1 # carga numero
    move $a0, $t3 # muestra t3 (Division)
    syscall

    li $v0, 4 # carga mensaje
    la $a0, sum # muestra +
    syscall # llama al sistema

    li $v0, 1 # carga numero
    move $a0, $t4 # muestra rem
    syscall # llama al sistema

    li $v0, 4 # carga mensaje
    la $a0, nl # muestra salto de linea
    syscall # llama al sistema

    li $v0, 10 # exit
    syscall # llama al sistema