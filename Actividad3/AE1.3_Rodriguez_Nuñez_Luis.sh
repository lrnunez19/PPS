#!/bin/bash

# Validar el usuario antes de acceder al menú
function login {
  intentos=3
  while (( intentos > 0 )); do
    read -sp "Usuario: " usuario
    echo
    if [[ "$usuario" == "admin" && "$1" == "-root" ]]; then
      return 0
    elif grep -q "^.*:.*:.*:.*:$usuario$" usuarios.csv 2>/dev/null; then
      return 0
    else
      echo "Usuario no válido. Intentos restantes: $((--intentos))"
    fi
  done
  echo "Acceso denegado."
  exit 1
}

function menu {
  echo "1. Ejecutar Copia de Seguridad"
  echo "2. Dar de Alta Usuario"
  echo "3. Dar de Baja Usuario"
  echo "4. Mostrar Usuarios"
  echo "5. Mostrar Log del Sistema"
  echo "6. Salir"
  read -p "Seleccione una opción: " opcion
}

function copia {
  fecha=$(date +"%d%m%Y_%H-%M-%S")
  zip "copia_usuarios_${fecha}.zip" usuarios.csv
  echo "Copia de seguridad realizada: copia_usuarios_${fecha}.zip" >> log.log
  # Mantener solo las dos copias más recientes
  ls -t copia_usuarios_*.zip | tail -n +3 | xargs rm -- 2>/dev/null
}

function alta {
  read -p "Nombre: " nombre
  read -p "Primer Apellido: " apellido1
  read -p "Segundo Apellido: " apellido2
  read -p "DNI: " dni
  usuario=$(echo "${nombre:0:1}${apellido1:0:3}${apellido2:0:3}${dni:5:8}" | tr '[:upper:]' '[:lower:]')
  if grep -q ":$usuario$" usuarios.csv; then
    echo "El usuario ya existe."
  else
    echo "$nombre:$apellido1:$apellido2:$dni:$usuario" >> usuarios.csv
    echo "INSERTADO $nombre:$apellido1:$apellido2:$dni:$usuario $(date +"%d/%m/%Y %H:%M")" >> log.log
  fi
}

function baja {
  read -p "Nombre de Usuario a Eliminar: " usuario
  if grep -q ":$usuario$" usuarios.csv; then
    linea=$(grep ":$usuario$" usuarios.csv)
    grep -v ":$usuario$" usuarios.csv > temp && mv temp usuarios.csv
    echo "BORRADO $linea el $(date +"%d/%m/%Y %H:%M")" >> log.log
    echo "Usuario $usuario eliminado."
  else
    echo "El usuario no existe."
  fi
}

function mostrar_usuarios {
  echo "Usuarios en el sistema:"
  sort -t':' -k5 usuarios.csv | awk -F':' '{print $5}'
}

function mostrar_log {
  echo "Log del sistema:"
  cat log.log
}


printf "%s\n" "----------$(date +"%d/%m/%Y %H:%M")----------" >> log.log
# Llamada al login al inicio del script
login "$1"

while true; do
  menu
  case $opcion in
    1) copia ;;
    2) alta ;;
    3) baja ;;
    4) mostrar_usuarios ;;
    5) mostrar_log ;;
    6) echo "Saliendo..."; exit 0 ;;
    *) echo "Opción no válida" ;;
  esac
done
