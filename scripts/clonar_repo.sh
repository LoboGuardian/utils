#!/bin/bash

# Pedimos al usuario que ingrese el owner y el repo
read -p "Ingrese el owner del repositorio: " owner
while [[ -z "$owner" ]]; do
  echo "El owner no puede estar vacío. Por favor, ingréselo nuevamente."
  read -p "Ingrese el owner del repositorio: " owner
done

read -p "Ingrese el nombre del repositorio: " repo
while [[ -z "$repo" ]]; do
  echo "El nombre del repositorio no puede estar vacío. Por favor, ingréselo nuevamente."
  read -p "Ingrese el nombre del repositorio: " repo
done

# Clonamos el repositorio
if git clone git@github.com:$owner/$repo; then
  echo "El repositorio se ha clonado exitosamente."
else
  echo "Hubo un error al clonar el repositorio."
fi
