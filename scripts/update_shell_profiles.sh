#!/bin/bash

# Define the content to be added to .bashrc and .zshrc
COMMON_CONTENT='
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc

# Custom Git clone function
# Usage: gitc <repository-name> to clone a GitHub repository using SSH
gitc() {
    git clone git@github.com:$1.git;  # Clones the specified repository from GitHub
}

# Alias to list Pipenv virtual environments and their associated projects
# Usage: pipenv-list will display the names of the virtual environments and their associated projects
alias pipenv-list="for venv in ~/.local/share/virtualenvs/*; do basename \$venv; cat \$venv/.project | sed 's/.*\t\1\n/'; done"

# Django server aliases
# Shortcuts for starting Django development servers using different Python versions.
alias dj="pipenv run python3 manage.py runserver"        # Start server with the default Python version from Pipenv
alias djo="pipenv run python3.11 manage.py runserver"  # Start server with Python 3.11
alias djn="pipenv run python3.12 manage.py runserver"   # Start server with Python 3.12

# Python aliases
# These aliases provide shortcuts for different Python versions
alias py="python3"         # Default alias for Python 3
alias py312="python3.12"  # Alias specifically for Python 3.12
alias py311="python3.11" # Alias specifically for Python 3.11
alias pym="py manage.py"   # Shortcut to run Django management commands


# Alias to switch to the light GTK theme in GNOME
# Usage: light will set the interface theme to Adwaita (light mode)
alias light="gsettings set org.gnome.desktop.interface gtk-theme Adwaita"

# Alias to switch to the dark GTK theme in GNOME
# Usage: dark will set the interface theme to Adwaita-dark (dark mode)
alias dark="gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark"
'
# Append the content to .bashrc if it doesn't already exist
if ! grep -Fxq "$COMMON_CONTENT" ~/.bashrc; then
    echo "$COMMON_CONTENT" >> ~/.bashrc
else
    echo "Content already exists in ~/.bashrc."
fi

# Append the content to .zshrc if it doesn't already exist
if ! grep -Fxq "$COMMON_CONTENT" ~/.zshrc; then
    echo "$COMMON_CONTENT" >> ~/.zshrc
else
    echo "Content already exists in ~/.zshrc."
fi

# Inform the user
echo "Custom functions and aliases have been added to your .bashrc and .zshrc."
echo "Please run 'source ~/.bashrc' or 'source ~/.zshrc' to apply the changes."
