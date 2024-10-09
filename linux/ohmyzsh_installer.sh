# Installing Oh My Zsh on Rocky Linux with Agnoster Theme

This guide will help you check for `wget` or `curl` on a Rocky Linux system, install Oh My Zsh, and set the Agnoster theme as your default.

## Step 1: Check for wget or curl

You can use either `wget` or `curl` to download the Oh My Zsh installation script. First, check if they are installed on your system:

### Check for `wget`
```bash
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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# After installing Oh My Zsh, you can set the Agnoster theme as your default theme by following these steps:

# Open the Zsh configuration file in a text editor (e.g., nano, vim, etc.):

# nano ~/.zshrc
# Find the line that starts with ZSH_THEME=. It will look something like this:

# ZSH_THEME="robbyrussell"
# Change it to:

# ZSH_THEME="agnoster"
# Save the changes and exit the editor.
# Step 4: Apply Changes
# To apply the changes you've made to the .zshrc file, run:
# source ~/.zshrc
