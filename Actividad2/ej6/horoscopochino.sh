#!/bin/bash

# Pedir al usuario que introduzca el año de nacimiento
echo "Introduce el año en que naciste (4 cifras):"
read anio

# Validar que el año ingresado tenga 4 cifras
if ! [[ "$anio" =~ ^[0-9]{4}$ ]]; then
    echo "Por favor, introduce un año válido de 4 cifras."
    exit 1
fi

# Calcular el resto de la división del año entre 12
resto=$(( anio % 12 ))

# Determinar el animal correspondiente
case $resto in
    0) animal="La rata" ;;
    1) animal="El buey" ;;
    2) animal="El tigre" ;;
    3) animal="El conejo" ;;
    4) animal="El dragón" ;;
    5) animal="La serpiente" ;;
    6) animal="El caballo" ;;
    7) animal="La cabra" ;;
    8) animal="El mono" ;;
    9) animal="El gallo" ;;
    10) animal="El perro" ;;
    11) animal="El cerdo" ;;
    *) animal="Desconocido" ;;  # Aunque este caso no debería ocurrir
esac

# Mostrar el resultado
echo "Si naciste en el año $anio, tu animal del horóscopo chino es: $animal."
