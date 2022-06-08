# Escribir un programa que imprima los números entre el 1000 y el 
# 1999, mostrando 5 números por línea. 
.data
nl: .asciiz "\n"
sp: .asciiz " "
.text
.globl main
main:
    li $s0, 0 # start contador1
    li $s1, 5 # end contador1
    li $t0, 999 # start contador2
    li $t1, 1999 # end contador2
loop:
    beq $t0, $t1, end # si t0 es igual a t1 salta a end
    beq $s0, $s1, nextline # si s0 es igual a s1 salta a nextline

    addi $s0, $s0, 1 # suma s0 + 1 y lo guarda en s0
    addi $t0, $t0, 1 # suma t0 + 1 y lo guarda en t0

    li $v0, 1 # lee numero
    move $a0, $t0 # muestra numero
    syscall # llama al sistema

    li $v0, 4 # carga espacio
    la $a0, sp # muestra espacio
    syscall # llama al sistema

    j loop # salta a loop
nextline:
    li $v0, 4 # carga salto de linea
    la $a0, nl # muestra salto de linea
    syscall # llama al sistema

    li $s0, 0 # resetea el contador1 (vuelve a darle el valor de 0 hasta que llegue a 5 devuelta)

    j loop # salta a loop
end:
    li $v0, 4 # carga salto de linea
    la $a0, nl # muestra salto de linea
    syscall # llama al sistem

    li $v0, 10 # exit
    syscall # llama al sistema