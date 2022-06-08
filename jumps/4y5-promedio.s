.data
msg: .asciiz "\nIngrese numero (si ingresa 0 el programa termina): "
nl: .asciiz "\n"
avr: .asciiz "\nEl promedio es: "

.text
.globl main
main:   
    li $v0, 4 # carga mensaje
    la $a0, msg # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda numero
    syscall # llama al sistema
    move $t0, $v0 # mueve v0 a t0
loop:
    beq $t0, $zero, exit # si t0 = zero salta a exit
    add $t1, $t1, $t0 # t1 = t1 + t0 (la primera iteracion sumo 0 + t0 y lo guardo en t1, las siguientes sumo t1 + t0 y lo guardo en t1)
    addi $t2, $t2, 1 # t2 = t2 + 1 (contador de iteraciones)

    li $v0, 4 # carga mensaje
    la $a0, msg # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda numero
    syscall # llama al sistema
    move $t0, $v0 # mueve v0 a t0

    j loop # salta a loop
exit:
    div $t3, $t1, $t2 # divide t1/t2 y lo guarda en t3 (divide suma de iteariones / contador)
    li $v0, 4 # carga mensaje
    la $a0, avr # muestra mensaje
    syscall # llama al sistema

    li $v0, 1 # carga numero
    move $a0, $t3 # muestra numero
    syscall # llama al sistema

    li $v0, 10 # exit
    syscall # llama al sistema