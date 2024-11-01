#!/bin/bash

# Archivo de log para registrar errores
log_file="usuarios.log"

# Función para mostrar información del usuario
mostrar_info_usuario() {
    local usuario=$1

    # Comprobar si el usuario existe en el sistema
    if id "$usuario" &>/dev/null; then
        # Obtener y mostrar información del usuario
        uid=$(id -u "$usuario")
        gid=$(id -g "$usuario")
        dir_trabajo=$(getent passwd "$usuario" | cut -d: -f6)

        echo "Información del usuario: $usuario"
        echo "UID: $uid"
        echo "GID: $gid"
        echo "Directorio de trabajo: $dir_trabajo"
    else
        # Mensaje si el usuario no existe
        echo "El usuario '$usuario' no existe."
        echo "El usuario '$usuario' no existe." >> "$log_file"
    fi
}

# Bucle principal del script
while true; do
    echo "Introduce el nombre de usuario:"
    read usuario

    # Mostrar información del usuario
    mostrar_info_usuario "$usuario"

    # Preguntar si quiere introducir otro usuario o salir
    echo "¿Deseas introducir otro usuario? (s/n)"
    read respuesta

    if [[ "$respuesta" != "s" && "$respuesta" != "S" ]]; then
        echo "Saliendo del programa."
        break
    fi
done
