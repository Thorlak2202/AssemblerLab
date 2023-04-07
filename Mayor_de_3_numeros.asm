.data
prompt1: .asciiz "Ingrese su primer numero: \n"
prompt2: .asciiz "Ingrese su segundo numero: \n"
prompt3: .asciiz "Ingrese su tercer numero: \n"
result: .asciiz "El numero mayor es: \n"

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

# mover el valor de $v0 a $t0
move $t0,$v0

# Imprimir en pantalla la segunda petición (usamos el syscall 4 print_string)
li $v0, 4
la $a0, prompt2
syscall

# Leer el valor ingresado en $v0 (usamos el syscall 5 read_int)
li $v0, 5 
syscall

# mover el valor de $v0 a $t1
move $t1,$v0 

# Imprimir en pantalla la tercera petición (usamos el syscall 4 print_string)
li $v0, 4
la $a0, prompt3
syscall

# Leer el valor ingresado en $v0 (usamos el syscall 5 read_int)
li $v0, 5 
syscall

# mover el valor de $v0 a $t2
move $t2,$v0

# Aqui guardamos en t1 el numero mayor tras la comparación de el primero y segundo valor ingresados
bge $t1, $t0, MAX1
move $t1, $t0

MAX1:
# Aqui guardamos en t1 el numero mayor tras la comparación de el mayor de la comparación anterior y el tercer valor ingresados
bge $t1, $t2, MAX2
move $t1, $t2    

# imprimimos el mensaje previo al resultado (usamos el syscall 4 print_string)
MAX2: 
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
