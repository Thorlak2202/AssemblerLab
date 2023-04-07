.data
prompt1: .asciiz "Ingrese su primer numero: \n"
prompt2: .asciiz "Ingrese su segundo numero: \n"
prompt3: .asciiz "Ingrese su tercer numero: \n"
result: .asciiz "El numero menor es: \n"

.text
.globl main

main:
# Imprimir en pantalla la primera petición (usamos el syscall 4 print_string)
li $v0, 4
la $a0, prompt1
syscall

# Leer el valor ingresado en $v0 (usamos el syscall 5 read_int)
li $v0, 5
syscall

# Mover el valor de $v0 a $t0
move $t0,$v0

# Imprimir en pantalla la segunda petición (usamos el syscall 4 print_string)
li $v0, 4
la $a0, prompt2
syscall

# Leer el valor ingresado en $v0 (usamos el syscall 5 read_int)
li $v0, 5 
syscall

# Mover el valor de $v0 a $t1
move $t1,$v0 

# Imprimir en pantalla la tercera petición (usamos el syscall 4 print_string)
li $v0, 4
la $a0, prompt3
syscall

# Leer el valor ingresado en $v0 (usamos el syscall 5 read_int)
li $v0, 5 
syscall

# Mover el valor de $v0 a $t2
move $t2,$v0

# Aqui guardamos en t1 el numero menor tras la comparación de el primero y segundo valor ingresados
ble $t1, $t0, MIN1
move $t1, $t0

MIN1:
# Aqui guardamos en t1 el numero menor tras la comparación de el menor de la comparación anterior y el tercer valor ingresados
ble $t1, $t2, MIN2
move $t1, $t2    

# Imprimimos el mensaje previo al resultado (usamos el syscall 4 print_string)
MIN2: 
li $v0, 4 
la $a0, result
syscall

# Imprimimos el resultado (usamos el syscall 1 print_int)
li $v0, 1 
move $a0, $t1 
syscall

# CODIGO DE CIERRE (usamos el syscall 10 exit)
cierre: li $v0, 10 
syscall 
