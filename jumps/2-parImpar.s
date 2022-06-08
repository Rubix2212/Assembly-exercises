.data
msg: .asciiz "Ingrese numero: "
par: .asciiz "El numero que ingreso es par."
impar: .asciiz "El numero que ingreso es impar."

.text
.globl main
main:
    li $v0, 4 # cargo mensaje
    la $a0, msg # muestro mensaje
    syscall # llama al sistema

    li $v0, 5 # leo y guardo entero en v0
    syscall # llama al sistema
    move $t0, $v0 # muevo v0 a t0

    rem $t1, $t0, 2 # resto de t0/2 lo guardo en t1 (t0 % 2)
    beq $t1, $zero, even # comparo si el resto es igual a 0, si lo es, salto a even (if (t2 == 0))
    
    li $v0, 4 # carga mensaje
    la $a0, impar # muestra mensaje
    syscall # llama al sistema

    j exit # salta a exit

even: 
    li $v0, 4 # carga mensaje
    la $a0, par # muestra mensaje
    syscall # llamo al sistema

    j exit # salta a exit
exit: 
    li $v0, 10 # exit
    syscall # llama al sistema