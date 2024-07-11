autoload -U compinit
compinit

# Antigen.
source ~/dotfiles/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

zstyle ':completion:*:default' menu select=1

# Use English on terminal.
export LANG=en_US.UTF-8

# TSUBAME user name.
export TSUBAME_USER=ug03757
alias tsubame="ssh ug03757@login.t4.gsic.titech.ac.jp -YC"

# Homebrew.
if [ `uname` = "Darwin" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)

  # ASDF script for Mac.
  ASDF_SCRIPT="$(brew --prefix asdf)/libexec/asdf.sh"
else
  # ASDF script for Ubuntu.
  ASDF_SCRIPT="$HOME/.asdf/asdf.sh"
fi

# Execute ASDF script.
if [ -d "$HOME/.asdf" ]; then
  . ${ASDF_SCRIPT}
fi

# Add path to Go installed according to official instructions:
# https://go.dev/doc/install
export PATH=$PATH:/usr/local/go/bin

# Path for Go tool binaries installed with `go install` command.
if type go > /dev/null 2>&1; then
  export PATH=$PATH:$(go env GOPATH)/bin
fi

# Path for gettext.
export PATH="/usr/local/opt/gettext/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# Setup pyenv.
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# Poetry
# export PATH=$HOME/.poetry/bin:$PATH  # For old versions
export PATH=$HOME/.local/bin:$PATH

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
fi

# Prompt settings.
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() {
  if [ $? -eq 0 ]; then
    FACE="%F{green}:D%f"
  else
    FACE="%F{red}:(%f"
  fi
  vcs_info
}
setopt prompt_subst
export PROMPT='%F{cyan}%n@%m%f %F{magenta}%~%f ${vcs_info_msg_0_}
${FACE} '
