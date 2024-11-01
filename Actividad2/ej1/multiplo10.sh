#!/bin/bash

# Pedir al usuario que ingrese un número
echo "Introduce un número:"
read numero

# Verificar si el número es múltiplo de 10 usando el operador módulo
if (( numero % 10 == 0 )); then
    echo "$numero es múltiplo de 10."
else
    echo "$numero no es múltiplo de 10."
fi
