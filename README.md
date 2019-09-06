# dotfiles

[![CircleCI](https://circleci.com/gh/sfujiwara/dotfiles.svg?style=svg)](https://circleci.com/gh/sfujiwara/dotfiles)

```sh
cd ~
git clone --recursive https://github.com/sfujiwara/dotfiles.git
cd dotfiles
```

## Mac

```sh
make install-homebrew
make install-gcloud-sdk
make symbolic-link
make brew-bundle
```

## Ubuntu 16.04

```sh
sh setup_ubuntu_16.04.sh
```

# Change default shell

```sh
chsh -s /bin/zsh
```
