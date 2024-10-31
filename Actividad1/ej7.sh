#!/bin/bash

# Verificar que se ha pasado al menos un parámetro
if [ "$#" -ne 1 ]; then
    echo "Error: Se requiere un parámetro: <ruta_archivo_o_directorio>"
    echo "Uso: $0 <ruta_archivo_o_directorio>"
    exit 1
fi

# Asignar el parámetro a una variable
RUTA="$1"

# Comprobar si la ruta existe
if [ -e "$RUTA" ]; then
    # Verificar si es un archivo
    if [ -f "$RUTA" ]; then
        echo "'$RUTA' es un archivo."
    # Verificar si es un directorio
    elif [ -d "$RUTA" ]; then
        echo "'$RUTA' es un directorio."
    else
        echo "'$RUTA' existe, pero no es ni un archivo ni un directorio estándar."
    fi
else
    echo "La ruta '$RUTA' no existe."
    exit 1
fi

exit 0
