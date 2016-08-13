sudo apt-get -y install tree
sudo apt-get -y install curl
sudo apt-get -y install git
sudo apt-get -y install emacs
sudo apt-get -y install zsh
sudo apt-get -y install nautilus-dropbox

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils

# R
sudo apt-get -y install r-base                # 本体
sudo apt-get -y install libgmp-dev            # gmp パッケージ使うのに必要
sudo apt-get -y install libcurl4-openssl-dev  # readr パッケージ使うのに必要

# LaTeX
sudo apt-get -y install texlive-lang-cjk
sudo apt-get -y install texlive-fonts-recommended  # NIPS のフォーマットを使うときに必要
sudo apt-get -y install texlive-fonts-extra        # bbm を使うときに必要

# Atom
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install atom

# PyCharm
sudo add-apt-repository -y ppa:mystic-mirage/pycharm
sudo apt-get update
sudo apt-get -y install pycharm-community

# OpenCV
# sudo apt-get install libopencv-dev python-opencv

# Haskell
# sudo apt-get -y install haskell-platform
# sudo apt-get -y install leksah

# Java
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java7-installer

# Fonts
# sudo apt-get install fonts-inconsolata

# Image editting
# sudo apt-get install inkscape
# sudo apt-get install gimp
# sudo apt-get install pstoedit # For LaTeX in Inkscape
