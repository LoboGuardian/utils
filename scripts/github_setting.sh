#!/bin/bash

# Check if the file id_ed25519.pub already exists
if [ -f ~/.ssh/id_ed25519.pub ]; then
  echo "The file id_ed25519.pub already exists."
  echo "Tu clave pública es:"
  cat ~/.ssh/id_ed25519.pub
  echo "Por favor copiela en el siguiente enlace"                                                                                                                                                              echo "https://github.com/settings/ssh/new"                                                                                                                                                                   cat ~/.ssh/id_ed25519.pub                                                                                                                                                                                    printf "%s " "Press enter to continue"                                                                                                                                                                       read ans
  # echo "Skipping SSH key generation."

else
  # Ask the user to enter the email
  read -p "Enter your email: " email

  # Generate the SSH key and configure the config file
  ssh-keygen -t ed25519 -C "$email"

  # Imprimimos la clave pública
  echo "Clave publica"
  echo "Por favor copiela en el siguiente enlace"
  echo "https://github.com/settings/ssh/new"
  cat ~/.ssh/id_ed25519.pub
  printf "%s " "Press enter to continue"
  read ans
fi

# Check if the .ssh/config file already exists
if [ -f ~/.ssh/config ]; then
  echo "The .ssh/config file already exists."
  echo "Skipping config file configuration."
else
  # Get the hostname of the computer
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

# Check if the username is already set
if ! git config --global user.name > /dev/null; then
  read -p "Enter your username: " username
  git config --global user.name "$username"
else
  echo "The username is already set to:"
  echo "$(git config --global user.name)"
fi

# Check if the email is already configureds
if ! git config --global user.email > /dev/null; then
  #read -p "Enter your email: " email
  git config --global user.email "$email"
else
  echo "The email is already configured as:"
  echo "$(git config --global user.email)"
fi

# Testing if local key works
echo "Testing if local key works"
ssh -T git@github.com

# Testing SSH Agent forwading
echo "Agen forwading show "
echo "$SSH_AUTH_SOCK"

# Ask if the user wants to clone a repository
read -p "Do you want to clone any repository? (Y/n): " clone_repo

if [ "$clone_repo" = "Y" ]; then
  # We ask the user to enter the owner and the repo
  read -p "Enter the owner of the repository: " owner
  read -p "Enter the name of the repository: " repo

  # We clone the repository
  git clone git@github.com:$owner/$repo.git
fi
