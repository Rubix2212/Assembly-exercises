.data
askForNumber: .asciiz "\nIngrese numero: " # Mensaje
result: .asciiz "\nEl resultado es: "
.text
.globl main
main:
    li $v0, 4 # carga string (mensaje)
    la $a0, askForNumber # muestra string (mensaje)
    syscall # llama al sistema

    li $v0, 5 # guarda el numero en v0
    syscall # llama al sistema
    move $t1, $v0 # mueve v0 a t1
    
    li $v0, 4 # carga string (mensaje)
    la $a0, askForNumber # muestra string (mensaje)
    syscall # llama al sistema

    li $v0, 5 # guarda el numero en v0
    syscall # llama al sistema
    move $t2, $v0 # mueve v1 a t2

    
    add $t3, $t1, $t2 # guarda en t3 la suma (t3 = t1 + t2)
    li $v0, 4 # carga string
    la $a0, result # muestra string

    syscall # llama al sistema
    li $v0, 1 # carga numero
    move $a0, $t3 # muestra numero

    li $v0, 10
    syscall


