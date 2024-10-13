#!/bin/bash

# Check if user has root privileges
#if [[ $EUID -ne 0 ]]; then
#  echo "This script requires root privileges. Please run it with sudo."
#  exit 1
#fi

# Import Microsoft repository key and adding VS Code repository
echo "Importing Microsoft repository key and adding VS Code reposity..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Update package lists
echo "Updating package lists..."
sudo dnf check-update

# Ask user for installation preference
echo "Choose which version to install (enter 'code' or 'code-insiders'):"
select version in "code" "code-insiders"; do
  case $version in
    "code")
      echo "Installing Visual Studio Code..."
      sudo dnf install code || {
        echo "Failed to install Visual Studio Code. Please check your internet connection and try again."
        exit 1
      }
      echo "Installation complete!"
      break
      ;;
    "code-insiders")
      echo "Installing Visual Studio Code Insiders..."
      sudo dnf install code-insiders || {
        echo "Failed to install Visual Studio Code Insiders. Please check your internet connection and try again."
        exit 1
      }
      echo "Installation complete!"
      break
      ;;
    *)
      echo "Invalid choice. Please enter 'code' or 'code-insiders'."
      ;;
  esac
done
