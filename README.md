# dotfiles

[![CircleCI](https://circleci.com/gh/sfujiwara/dotfiles.svg?style=svg)](https://circleci.com/gh/sfujiwara/dotfiles)

```sh
cd ~
git clone --recursive https://github.com/sfujiwara/dotfiles.git
cd dotfiles
```

## Mac

### Symbolic Links

```bash
make symbolic-links
```

### Homebrew

```sh
make install-homebrew
make brew-bundle
```

### Set Z Shell as Default Shell

```bash
make use-zsh
```

### gcloud SDK

```bash
make install-gcloud-sdk
make install-python2-for-gcloud
```

## Ubuntu

### Install Makefile

```bash
apt update
apt -y install build-essential
```

### To Be Written
