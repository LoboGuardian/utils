#!/bin/bash

# Verificamos si ya existe el archivo id_ed25519.pub
if [ -f ~/.ssh/id_ed25519.pub ]; then
  echo "El archivo id_ed25519.pub ya existe."
  echo " Saltando la generación de la clave SSH."
else
  # Pedimos al usuario que ingrese el correo electrónico
  read -p "Ingrese su correo electrónico: " email

  # Generamos la clave SSH y configuramos el archivo config
  ssh-keygen -t ed25519 -C "$email"

  # Imprimimos la clave pública
  echo "Clave publica"
  echo "Por favor copiela en el siguiente enlace"
  echo "https://github.com/settings/ssh/new"
  cat ~/.ssh/id_ed25519.pub
  sleep 5
fi

# Verificamos si ya existe el archivo .ssh/config
if [ -f ~/.ssh/config ]; then
  echo "El archivo .ssh/config ya existe."
  echo " Saltando la configuración del archivo config."
else
  # Obtenemos el hostname del equipo
  hostname=$(hostname)

  touch ~/.ssh/config

  cat << EOF >> ~/.ssh/config
Host $hostname
  ForwardAgent yes

Host github.com
  User git
EOF
  sleep 5
fi

# Testing if local key works
echo "Testing if local key works"
ssh -T git@github.com

# Testing SSH Agent forwading
echo "Agen forwading show "
echo "$SSH_AUTH_SOCK"

# Preguntamos si el usuario desea clonar un repositorio
read -p "¿Desea clonar algún repositorio? (Y/n): " clone_repo

if [ "$clone_repo" = "Y" ]; then
  # Pedimos al usuario que ingrese el owner y el repo
  read -p "Ingrese el owner del repositorio: " owner
  read -p "Ingrese el nombre del repositorio: " repo

  # Clonamos el repositorio
  git clone git@github.com:$owner/$repo.git
fi
