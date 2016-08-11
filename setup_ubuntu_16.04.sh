# ドキュメント, ミュージックなどの最初からあるディレクトリ名を英語にする
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# CapsLock を Ctrl キーにする
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"

# Home に設定ファイルのシンボリックリンクを貼る
./ln.sh

# apt-get で色々入れる
./apt.sh

# pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# pyenv-virtualenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
