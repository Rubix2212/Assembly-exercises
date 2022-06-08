.data
year: .asciiz "\nIngrese año: "
yes: .asciiz "\nSi, es año bisiesto.\n"
no: .asciiz "\nNo, no es año bisiesto.\n"

.text
.globl main
main:
    li $v0, 4 # cargo mensaje
    la $a0, year # muestro mensaje
    syscall # llamo al sistema

    li $v0, 5 # leo y guardo numero
    syscall # llamo al sistema
    move $t0, $v0 # muevo v0 a t0

    rem $t1, $t0, 4 # t0 % 4
    rem $t2, $t0, 100 # t0 % 100
    rem $t3, $t0, 400 # t0 % 400

    bne $t1, $zero nao # if( t0 % 4 !== 0 ) jump nao
    beq $t2, $zero, nao # if( t0 % 100 == 0 ) jump nao
sim:
    li $v0, 4
    la $a0, yes
    syscall

    j end
nao: 
    beq $t3, $zero, sim # if( t0 % 400 == 0 ) jump sim
    
    li $v0, 4 # cargo mensaje
    la $a0, no # muestro mensaje
    syscall # llamo al sistema
end:
    li $v0, 10 # exit
    syscall # llamo al sistema