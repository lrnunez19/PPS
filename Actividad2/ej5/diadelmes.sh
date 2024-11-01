#!/bin/bash

# Obtener el mes actual como un número (1-12)
mes_actual=$(date +%m)

# Inicializar el número de días
numero_dias=0

# Determinar el número de días en el mes actual
if [ "$mes_actual" -eq 1 ] || [ "$mes_actual" -eq 3 ] || [ "$mes_actual" -eq 5 ] || [ "$mes_actual" -eq 7 ] || [ "$mes_actual" -eq 8 ] || [ "$mes_actual" -eq 10 ] || [ "$mes_actual" -eq 12 ]; then
    numero_dias=31
elif [ "$mes_actual" -eq 4 ] || [ "$mes_actual" -eq 6 ] || [ "$mes_actual" -eq 9 ] || [ "$mes_actual" -eq 11 ]; then
    numero_dias=30
elif [ "$mes_actual" -eq 2 ]; then
    numero_dias=28  # Consideramos que febrero tiene 28 días
fi

# Obtener el nombre del mes actual
nombre_mes=$(date +%B)

# Mostrar el resultado en el formato requerido
echo "Estamos en $nombre_mes, un mes con $numero_dias días."
