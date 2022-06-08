.data
year: .asciiz "Ingrese año: "
.text
.globl main
main:
    li $v0, 4
    la $a0, year
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal year_leap

    move $a0, $v0
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall

year_leap:
    rem $t0, $a0, 4
    rem $t1, $a0, 100
    rem $t2, $a0, 400

paso1:
    beq $t0, $zero, paso2

    j paso5
paso2:
    beq $t1, $zero, paso3

    j paso4
paso3:
    beq $t2, $zero, paso4

    j paso5
paso4:
    li $v0, 1

    j return
paso5:
    li $v0, 0
return:
    jr $ra