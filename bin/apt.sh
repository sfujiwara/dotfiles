sudo apt -y install tree
sudo apt -y install curl
sudo apt -y install emacs
sudo apt -y install zsh
sudo apt -y install gnome-tweaks
sudo apt -y install docker
sudo apt -y install docker-compose
sudo apt -y install cowsay
sudo apt -y install sl

# Install Google Chrome.
# curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt update
sudo apt install google-chrome-stable


# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb
