 User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging featur>
# export SYSTEMD_PAGER=

unset rc
gitc () {
   git clone git@github.com:$1.git;
}

# Theme changer
alias light="gsettings set org.gnome.desktop.interface gtk-theme Adwaita"
alias dark="gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark"

# Just in case for django
alias djs='pipenv run python3.11 manage.py runserver'
alias djc='pipenv run python3.12 manage.py runserver'
