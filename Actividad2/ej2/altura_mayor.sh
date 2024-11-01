#!/bin/bash

# Pedir la altura de tres personas en centímetros
echo "Introduce la altura de la primera persona (en cm):"
read altura1
echo "Introduce la altura de la segunda persona (en cm):"
read altura2
echo "Introduce la altura de la tercera persona (en cm):"
read altura3

# Encontrar la mayor altura
if (( altura1 >= altura2 && altura1 >= altura3 )); then
    mayor_altura=$altura1
elif (( altura2 >= altura1 && altura2 >= altura3 )); then
    mayor_altura=$altura2
else
    mayor_altura=$altura3
fi

# Convertir la mayor altura a metros
altura_m=$(awk "BEGIN {print $mayor_altura/100}")

# Mostrar el resultado
echo "La mayor altura es ${altura_m} metros."
