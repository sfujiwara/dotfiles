autoload -U compinit
compinit

# antigen
source ~/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle pip
antigen bundle pyenv
antigen bundle ~/dotfiles/themes sfujiwara.zsh-theme --no-local-clone
antigen apply

# Use English on terminal.
export LANG=en_US.UTF-8

# sbin for Homebrew.
export PATH=/usr/local/sbin:$PATH

# Path for gettext.
export PATH="/usr/local/opt/gettext/bin:$PATH"

# pyenv
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Alias for Homebrew to solve warnings on Pyenv.
# alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# Poetry
export PATH=$HOME/.poetry/bin:$PATH

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# nodenv
if [ -d "$HOME/.nodenv" ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

if [ -d "$HOME/google-cloud-sdk" ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source "$HOME/google-cloud-sdk/path.zsh.inc"
  # The next line enables shell command completion for gcloud.
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Specify Python path for Google Cloud SDK
# export CLOUDSDK_PYTHON=~/.pyenv/versions/3.7.4/bin/python

# Rust.
if [ -d "$HOME/.cargo" ]; then
  export PATH=$HOME/.cargo/bin:$PATH
  source ~/.cargo/env
fi
