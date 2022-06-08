.data # data es donde se va a ingresar variables de texto que despues van a ser leídas
mensaje: .asciiz "\nHolaa \n" # Declaro vmensaje  [ "Holaa (salto de linea)" ] 


.text
.globl main
main:
    li $v0, 4 # li = cargue. 4 = string (mensaje)
    la $a0, mensaje # muestra el mensaje cargado
    syscall # llama al sistema (sirve para que el sistema ejecute lo anterior escrito)

    
    li $v0, 10 # li = cargue. 10 = exit 
    syscall 