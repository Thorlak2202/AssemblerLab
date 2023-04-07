.data

mensaje: .asciiz "Este script imprimirá los primeros n numeros de la serie fibonacci, entre 1 y 45 \n"
prompt1: .asciiz "Ingrese un valor entre 1 y 45: "
calculando: .asciiz "Calculando..."
etiqueta: .asciiz "\nLa serie Fibonaci es: "
espacio: .asciiz " "

.text

main:
    la $a0, mensaje        #Imprimimos la descripción
    li $v0, 4
    syscall

    la $a0, prompt1        #Imprimimos el prompt
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    subi $s0, $v0, 1
    add $s7, $s0, 0
    add $s3, $v0, 0

    addi $s1, $s1, 1
    addi $s2, $s2, 1

    la $a0, calculando        #Imprimimos el calculando
    li $v0, 4
    syscall

    la $a0, etiqueta          #Imprimimos la etiqueta
    syscall

    addi $a0, $zero, 1
    li $v0, 1
    syscall

    jal fibonacci

exit:       
    li, $v0, 10         #Cerrar ejecucion
    syscall

fibonacci:
    beq $s0, 0, fibonacciExit
    subi $s0, $s0, 1

    add $t0, $s2, $zero
    add $s2, $s1, $s2
    add $s1, $t0, $zero

    la $a0, espacio
    li $v0, 4
    syscall

    add $a0, $s1, $zero
    li $v0, 1
    syscall

    bnez $s0, fibonacci

fibonacciExit:
    jr $ra

print:
    add $t0, $0, $a0
    add $a0, $s0, $a0

    li $v0, 1
    syscall

    la $a0, espacio
    li $v0, 4
    syscall

    add $s0, $t0, $0
    jr $ra