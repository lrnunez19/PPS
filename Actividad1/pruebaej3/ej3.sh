#!/bin/bash

# Verificar que se han pasado dos parámetros
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <ruta_directorio> <ruta_fichero>"
    exit 1
fi

# Asignar los parámetros a variables
DIRECTORIO="$1"
ARCHIVO="$2"

# Crear el directorio (si no existe ya)
if [ ! -d "$DIRECTORIO" ]; then
    mkdir -p "$DIRECTORIO"
    echo "Directorio '$DIRECTORIO' creado."
else
    echo "El directorio '$DIRECTORIO' ya existe."
fi

# Verificar si el archivo existe antes de copiar
if [ -f "$ARCHIVO" ]; then
    cp "$ARCHIVO" "$DIRECTORIO"
    echo "Archivo '$ARCHIVO' copiado en '$DIRECTORIO'."
else
    echo "Error: El archivo '$ARCHIVO' no existe."
    exit 1
fi
