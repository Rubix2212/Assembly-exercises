# main llama a argumentos(1, 2, 3, 4, 5) e imprime el resultado
# argumentos equivale en C a
# int argumentos(int a, int b, int c, int d, int e) {
#   return (a + b) + (c + d) - e;
# }
.text
.globl main
main:
  li $a0, 1
  li $a1, 2
  li $a2, 3
  li $a3, 4
  li $t0, 5
  jal argumentos
  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall 
argumentos:
  add $a0, $a0, $a1
  add $a2, $a2, $a3
  add $a2, $a0, $a2
  sub $v0, $a2, $t0

  jr $ra