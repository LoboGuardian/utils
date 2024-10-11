#!/bin/bash

# Initial message
echo "Choose the version of Zed you want to install:"
echo "1. Stable version"
echo "2. Preview version"

# Read user option
read -p "Option (1 or 2): " option

# Determine the installation command based on the option
if [ "$option" -eq 1 ]; then
    command="curl -f https://zed.dev/install.sh | sh"
elif [ "$option" -eq 2 ]; then
    command="curl -f https://zed.dev/install.sh | ZED_CHANNEL=preview sh"
else
    echo "Invalid option. Please choose 1 or 2."
    exit 1
fi

# Run the installation command
eval $command

# Additional commands (optional)
# Here you can add commands to verify the installation,
# configure Zed, or perform other related tasks.

# For example, to check the installed version:
zed --version

echo "Zed installation completed."
