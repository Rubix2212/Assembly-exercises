.data
msg: .asciiz "Ingrese numero: "
nl: .asciiz "\n"
.text
.globl main
main:
    li $v0, 4 # carga mensaje
    la $a0, msg # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda numero
    syscall # llama al sistema
    move $t0, $v0 # mueve v0 a t0

    blt $t0, $zero, modulo # si t0 es menor a 0 (osea negativo) salta a modulo
    
    li $v0, 4 # carga salto de linea
    la $v0, nl # muestra salto de linea
    syscall # llama al sistema
    
    li $v0, 1 # carga numero
    move $a0, $t0 # muestra numero
    syscall # llama al sistema

    j exit # salta a exit
modulo:
    mul $t0, $t0, -1 # multiplica 
    syscall # llama al sistema
    
    li $v0, 1 # carga numero
    move $a0, $t1 # muestra numero
    syscall # llama al sistema
exit:
    li $v0, 10 # exit
    syscall # llama al sistema