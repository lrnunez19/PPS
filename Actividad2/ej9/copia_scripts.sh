#!/bin/bash

# Verificar que se ha pasado un parámetro (el directorio)
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

# Asignar el directorio pasado como parámetro a una variable
directorio=$1

# Verificar que el directorio existe
if [ ! -d "$directorio" ]; then
    echo "El directorio '$directorio' no existe."
    exit 1
fi

# Obtener la fecha actual en el formato ddmmaaaa
fecha=$(date +%d%m%Y)

# Nombre del archivo tar de salida
nombre_copia="copia_scripts_$fecha.tar"

# Crear el archivo tar con los scripts .sh
tar -cvf "$nombre_copia" -C "$directorio" *.sh 2>/dev/null

# Comprobar si la creación del archivo tar fue exitosa
if [ $? -eq 0 ]; then
    echo "Copia realizada con éxito: $nombre_copia"
else
    echo "No se encontraron archivos .sh en el directorio '$directorio'."
fi
