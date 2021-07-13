# Change default directory names from JP to EN.
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

./bin/apt.sh

# Install pyenv.
if [ ! -d "$HOME/.pyenv" ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
