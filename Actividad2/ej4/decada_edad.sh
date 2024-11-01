#!/bin/bash

# Obtener el año actual
anio_actual=$(date +%Y)

# Pedir la edad al usuario
echo "Introduce tu edad (entre 15 y 60 años):"
read edad

# Verificar que la edad está dentro del rango permitido
if (( edad < 15 || edad > 60 )); then
    echo "La edad debe estar entre 15 y 60 años."
    exit 1
fi

# Calcular el año de nacimiento
anio_nacimiento=$(( anio_actual - edad ))

# Calcular la década
decada=$(( anio_nacimiento / 10 * 10 ))

# Mostrar el resultado
echo "Si naciste en $anio_nacimiento, naciste en la década de $decada."
