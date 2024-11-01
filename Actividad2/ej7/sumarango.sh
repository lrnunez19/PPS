#!/bin/bash

# Pedir al usuario que introduzca dos números
echo "Introduce el primer número:"
read num1

echo "Introduce el segundo número:"
read num2

# Comprobar cuál número es menor y ajustar los valores
if [ "$num1" -gt "$num2" ]; then
    # Intercambiar valores si num1 es mayor que num2
    temp=$num1
    num1=$num2
    num2=$temp
fi

# Inicializar la variable de suma
suma=0

# Calcular la suma de los números en el rango
for (( i=num1; i<=num2; i++ )); do
    suma=$(( suma + i ))
done

# Mostrar el resultado
echo "La suma de los números desde $num1 hasta $num2 es: $suma"
