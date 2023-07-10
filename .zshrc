autoload -U compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

compinit

# antigen
source ~/dotfiles/antigen/antigen.zsh
# antigen use oh-my-zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle pip
# antigen bundle pyenv
# antigen bundle ~/dotfiles/themes sfujiwara.zsh-theme --no-local-clone
antigen apply

# Use English on terminal.
export LANG=en_US.UTF-8

# sbin for Homebrew.
export PATH=/usr/local/sbin:$PATH

# Path for gettext.
export PATH="/usr/local/opt/gettext/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# Setup pyenv.
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# Setup nodenv.
if [ -d "$HOME/.pyenv" ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
  # $HOME/.nodenv/bin/nodenv init
fi

# Alias for Homebrew to solve warnings on Pyenv.
# alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# Poetry
# export PATH=$HOME/.poetry/bin:$PATH  # For old versions
export PATH=$HOME/.local/bin:$PATH

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

eval "$(direnv hook zsh)"

if [ -d "$HOME/.nodenv" ]; then
  export PATH="$HOME/.tfenv/bin:$PATH"
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

source ${HOME}/dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_STATESEPARATOR=" "
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_COMPRESSSPARSESTATE=true
GIT_PS1_DESCRIBE_STYLE="branch"
prompt() {
  if [ $? -eq 0 ]; then
      FACE="%F{green}:D%f"
  else
    FACE="%F{red}:(%f"
  fi
  PROMPT="%F{cyan}%n@%m%f %F{magenta}%~%f%F{yellow}$(__git_ps1)%f"$'\n'"${FACE} "
}
add-zsh-hook precmd prompt
