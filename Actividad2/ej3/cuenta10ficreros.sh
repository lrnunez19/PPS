#!/bin/bash

# Verificar si se proporcionó un parámetro
if [ -z "$1" ]; then
    echo "Por favor, proporciona un directorio como parámetro."
    exit 1
fi

# Verificar si el parámetro es un directorio válido
if [ ! -d "$1" ]; then
    echo "El parámetro proporcionado no es un directorio válido."
    exit 1
fi

# Contar solo los archivos en el directorio (excluyendo subdirectorios)
num_ficheros=$(find "$1" -maxdepth 1 -type f | wc -l)

# Verificar si hay más de 10 archivos
if (( num_ficheros > 10 )); then
    echo "Hay más de 10 archivos en el directorio $1."
else
    echo "No hay más de 10 archivos en el directorio $1."
fi
