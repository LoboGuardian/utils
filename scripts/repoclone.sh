#!/bin/bash

# Ask the user to enter the owner and the repo
read -p "Enter the owner of the repository:" owner
while [[ -z "$owner" ]]; do
  echo "The owner cannot be empty. Please enter it again."
  read -p "Enter the owner of the repository: " owner
done

read -p "Enter the name of the repository: " repo
while [[ -z "$repo" ]]; do
  echo "The name of the repository cannot be empty. Please enter it again."
  read -p "Enter the name of the repository: " repo
done

# Clone the repository
if git clone git@github.com:$owner/$repo; then
  echo "The repository has been cloned successfully."
else
  echo "There was an error cloning the repository."
fi
