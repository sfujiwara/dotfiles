# Change default directory names from JP to EN
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# Replace CapsLock with Ctrl
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"

# Install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
