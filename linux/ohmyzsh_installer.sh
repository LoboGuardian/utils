#!/bin/bash

# Installing Oh My Zsh on Rocky Linux with Agnoster Theme

# This scrip will help you check for `wget` or `curl` on a Rocky Linux system, install Oh My Zsh, and set the Agnoster theme as your default.

# Check for wget or curl
# You can use either `wget` or `curl` to download the Oh My Zsh installation script. First, check if they are installed on your system:

### Check for `wget`
if command -v wget > /dev/null 2>&1; then
    echo "wget is installed"
else
    echo "wget is not installed"
fi

if command -v curl > /dev/null 2>&1; then
    echo "curl is installed"
else
    echo "curl is not installed"
fi

# Ask user for their preferred method
echo "Which tool would you like to use to install Oh My Zsh?"
echo "1) curl"
echo "2) wget"
read -p "Please enter 1 or 2: " choice


case $choice in
    1)
        if command -v curl > /dev/null 2>&1; then
            echo "Using curl to install Oh My Zsh..."
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        else
            echo "curl is not installed. Please install curl or choose wget."
        fi
        ;;
    2)
        if command -v wget > /dev/null 2>&1; then
            echo "Using wget to install Oh My Zsh..."
            sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
        else
            echo "wget is not installed. Please install wget or choose curl."
        fi
        ;;
    *)
        echo "Invalid choice. Please run the script again and choose either 1 or 2."
        ;;
esac

# Optionally, you can set the Agnoster theme as your default
if [ -d "$HOME/.oh-my-zsh/themes" ]; then
    echo "Setting Agnoster theme as your default..."
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' $HOME/.zshrc
    echo "Agnoster theme set. Please restart your terminal session."
else
    echo "Oh My Zsh installation might have failed. Please check logs."
fi

# To apply the changes you've made to the .zshrc file, run:
source ~/.zshrc
