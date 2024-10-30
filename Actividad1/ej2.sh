#!/bin/bash

# Verificar si se proporcionó un segundo parámetro
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <primer_parametro> <ruta_al_archivo>"
    exit 1
fi

# Asignar el segundo parámetro a una variable
archivo="$2"

# Mostrar el contenido del archivo
cat "$archivo"

# Guardar el código de salida del comando cat
codigo_salida=$?

# Mostrar el código de salida
echo "Código de salida del comando cat: $codigo_salida"

# Salir con el mismo código de salida
exit $codigo_salida
