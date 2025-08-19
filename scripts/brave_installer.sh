#!/bin/bash

# A simple bash script to install Brave Browser using the official curl commands.

# Function to install the Brave browser
install_brave() {
    local channel=$1
    echo "Installing Brave Browser ($channel channel)..."

    # Use a case statement to determine the correct curl command
    case "$channel" in
        "normal")
            curl -fsS https://dl.brave.com/install.sh | sh
            ;;
        "beta")
            curl -fsS https://dl.brave.com/install.sh | CHANNEL=beta sh
            ;;
        "nightly")
            curl -fsS https://dl.brave.com/install.sh | CHANNEL=nightly sh
            ;;
        *)
            echo "Invalid channel specified. Please use 'normal', 'beta', or 'nightly'."
            exit 1
            ;;
    esac

    if [ $? -eq 0 ]; then
        echo "Brave Browser ($channel channel) installed successfully!"
    else
        echo "An error occurred during installation."
        exit 1
    fi
}

# Display a menu to the user
echo "Brave Browser Installation Script"
echo "-----------------------------------"
echo "Select the Brave channel to install:"
echo "1) Normal (Stable)"
echo "2) Beta"
echo "3) Nightly"
echo "4) Exit"
echo "-----------------------------------"

read -p "Enter your choice (1-4): " choice

case "$choice" in
    1)
        install_brave "normal"
        ;;
    2)
        install_brave "beta"
        ;;
    3)
        install_brave "nightly"
        ;;
    4)
        echo "Exiting script."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run the script again and select a number from 1 to 4."
        exit 1
        ;;
esac