#!/bin/bash

# Pedimos al usuario que ingrese el owner y el repo
read -p "Ingrese el owner del repositorio: " owner
read -p "Ingrese el nombre del repositorio: " repo

# Clonamos el repositorio
git clone git@github.com:$owner/$repo
