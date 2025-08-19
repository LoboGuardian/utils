#!/bin/bash

# A script to install Microsoft Edge on Fedora from a menu.
# It handles the stable, beta, and dev channels and uses the correct
# repository command for different Fedora versions.

# Function to check if the user has sudo privileges
check_sudo() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "This script must be run with sudo or as root."
        echo "Please try again with: sudo ./install_edge.sh"
        exit 1
    fi
}

# Function to install a specific channel of Microsoft Edge
install_edge() {
    local channel=$1
    echo "Starting installation for Microsoft Edge ($channel channel)..."

    # --- Step 1: Import the Microsoft GPG key ---
    echo "Importing Microsoft GPG key..."
    rpm --import https://packages.microsoft.com/keys/microsoft.asc
    if [ $? -ne 0 ]; then
        echo "Error: Failed to import GPG key."
        exit 1
    fi

    # --- Step 2: Add the Microsoft Edge repository ---
    # Check Fedora version to use the correct command
    local fedora_version=$(grep -oP '(?<=Fedora release )[0-9]+' /etc/fedora-release 2>/dev/null || echo 0)
    
    echo "Adding Microsoft Edge repository..."
    if [[ "$fedora_version" -ge 41 ]]; then
        echo "Detected Fedora 41 or newer. Using 'from-repofile' command."
        dnf config-manager --addrepo --from-repofile='https://packages.microsoft.com/yumrepos/edge/config.repo'
    else
        echo "Detected Fedora version older than 41. Using standard 'add-repo' command."
        dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
    fi
    if [ $? -ne 0 ]; then
        echo "Error: Failed to add the repository."
        exit 1
    fi

    # --- Step 3: Refresh metadata (makecache) ---
    echo "Refreshing package metadata..."
    dnf makecache
    if [ $? -ne 0 ]; then
        echo "Error: Failed to refresh metadata."
        exit 1
    fi

    # --- Step 4: Install the selected channel ---
    local package_name
    case "$channel" in
        "stable")
            package_name="microsoft-edge-stable"
            ;;
        "beta")
            package_name="microsoft-edge-beta"
            ;;
        "dev")
            package_name="microsoft-edge-dev"
            ;;
        *)
            echo "Invalid channel selected."
            exit 1
            ;;
    esac

    echo "Installing package: $package_name..."
    dnf install "$package_name" -y
    if [ $? -eq 0 ]; then
        echo "Microsoft Edge ($channel channel) installed successfully!"
    else
        echo "An error occurred during installation."
        exit 1
    fi
}

# --- Main script execution ---

# Check for sudo privileges at the start
check_sudo

echo "Microsoft Edge Installation Script for Fedora"
echo "------------------------------------------------"
echo "Select the Microsoft Edge channel to install:"
echo "1) Stable"
echo "2) Beta"
echo "3) Dev (Nightly)"
echo "4) Exit"
echo "------------------------------------------------"

read -p "Enter your choice (1-4): " choice

case "$choice" in
    1)
        install_edge "stable"
        ;;
    2)
        install_edge "beta"
        ;;
    3)
        install_edge "dev"
        ;;
    4)
        echo "Exiting script. No changes were made."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run the script again and select a number from 1 to 4."
        exit 1
        ;;
esac
