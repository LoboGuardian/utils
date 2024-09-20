#!/bin/bash

# Pedimos al usuario que ingrese el correo electrónico
read -p "Ingrese su correo electrónico: " email

# Generamos la clave SSH y configuramos el archivo config
ssh-keygen -t ed25519 -C "$email"

# Imprimimos la clave pública
cat ~/.ssh/id_ed25519.pub

# Obtenemos el hostname del equipo
hostname=$(hostname)

touch ~/.ssh/config

cat << EOF >> ~/.ssh/config
Host $hostname
  ForwardAgent yes

Host github.com
  User git
EOF

# Testing local key works
ssh -T git@github.com

# Testing SSH Agent forwading
echo "$SSH_AUTH_SOCK"

# Pedimos al usuario que ingrese el owner y el repo
read -p "Ingrese el owner del repositorio: " owner
read -p "Ingrese el nombre del repositorio: " repo

# Clonamos el repositorio
git clone git@github.com:$owner/$repo
