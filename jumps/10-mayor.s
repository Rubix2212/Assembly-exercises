.data
    prompt: .asciiz "\nIngrese un numero: "
    false: .asciiz "\nFalso\n"
    true: .asciiz "\nVerdadero\n"

# Escribir un programa que tome tres 
# números enteros positivos ingresados por el usuario. 
# Debe imprimir "falso" si alguno es igual o mayor a la 
# suma de los otros dos, o "verdadero" en caso contrario.

.text
.globl main
main:
    li $v0, 4 # carga mensaje
    la $a0, prompt # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda numero
    syscall # llama al sistema
    move $t0, $v0 # mueve v0 a t0
 
    li $v0, 4 # carga mensaje
    la $a0, prompt # muestra mensaje
    syscall # llama al sistema

    li $v0, 5 # lee y guarda numero
    syscall # llama al sistema
    move $t1, $v0 # mueve v0 a t1

    li $v0, 4 # carga numero
    la $a0, prompt # muestra numero
    syscall # llama al sistema

    li $v0, 5 # lee y guarda numero
    syscall # llama al sistema
    move $t2, $v0 # mueve v0 a t2

    add $s1, $t0, $t1 # ab = a + b
    add $s2, $t1, $t2 # bc = b + c
    add $s3, $t0, $t2 # ac = a + c

    bge $s1, $t3, falso	# si s1 es mayor o igual a t3 salta a falso
    bge $s2, $t0, falso	# si $s2 es mayor o igual $t1 salta a falso
    bge $s3, $t2, falso	# si $s1 es mayor o igual $t1 salta a falso

    li $v0, 4 # carga mensaje
    la $a0, true # muestra mensaje
    syscall # llama al sistema

    j end # salta a end
falso:
    li $v0, 4 # carga mensaje
    la $a0, false # muestra mensaje
    syscall # llama al sistema
end:
    li $v0, 10 # exit
    syscall # llama al sistema