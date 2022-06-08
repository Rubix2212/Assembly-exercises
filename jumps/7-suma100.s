# 1 + 2 + 3 + ... + 100 = 5050
.data
nl: .asciiz "\n"
.text
.globl main
main: 
    li $t0, 0 # guardamos en t0 = 0 (esto va a ser la suma 5050)
    li $t1, 1 # contador
    li $t2, 101 # maximo
loop:
    beq $t1, $t2, end # si t1 es igual a t2 (si contador llega a 101) saltar a end
    add $t0, $t0, $t1 # t0 = t0 + t1 
    addi $t1, $t1, 1 # t1 = t1 + 1

    j loop # si no se completo beq salta a loop
end:
    li $v0, 4 # carga salto de linea
    la $a0, nl # imprime salto de linea
    syscall # llama al sistema

    li $v0, 1 # carga numero
    move $a0, $t0 # muestra numero
    syscall # llama al sistema

    li $v0, 10 # exit
    syscall # llama al sistema