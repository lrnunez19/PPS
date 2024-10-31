#!/bin/bash

# A. Comprobar si se han recibido parámetros
if [ "$#" -eq 0 ]; then
    echo "No has introducido ningún parámetro"
    exit 1  # Retornar 1 en el caso A
else
    # B. Indicar la cantidad de parámetros recibidos
    echo "Has introducido $# parámetros."
    
    # B. Mostrar los parámetros recibidos
    echo "Parámetros recibidos: $@"
    exit 0  # Retornar 0 en el caso B
fi
