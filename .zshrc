autoload -U compinit && compinit
autoload -Uz colors && colors

# Antigen
source ~/dotfiles/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

zstyle ':completion:*:default' menu select=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#586e75"

# Use English on terminal
# export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

# Alias
alias ls='ls -F --color=auto'
alias nesterov="tmux splitw -v -l 16 && emacs -nw ."
alias jeffdean="tmux splitw -v -l 16 && tmux splitw -h -l 100 -t 0 && emacs -nw ."

# TSUBAME
export TSUBAME_USER=ug03757
alias tsubame="ssh ${TSUBAME_USER}@login.t4.gsic.titech.ac.jp -YC"

# GENKAI
export GENKAI_USER=ku40001280
alias genkai="ssh ${GENKAI_USER}@genkai.hpc.kyushu-u.ac.jp -YC"

# ASDF
# https://asdf-vm.com/guide/upgrading-to-v0-16.html
export ASDF_DATA_DIR=${HOME}/.asdf
export PATH=${ASDF_DATA_DIR}/shims:${PATH}

# Homebrew (only for Mac)
if [ `uname` = "Darwin" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
  export HOMEBREW_AUTO_UPDATE_SECS=60
fi

# direnv
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
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

# Poetry
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

#  [zsh]  [~] []

# Nerd icons
MACHINE_ICON=$'\uf108'
BRANCH_ICON=$'\ue0a0'
# BRANCH_ICON=$'\ue725'
FOLDER_ICON=$'\uea83 '
EDIT_ICON=$'\uf044'
NEWFILE_ICON=$'\uea7f'
TERMINAL_ICON=$'\uf489 '

# Prompt settings
# ===============
source ~/dotfiles/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM=auto

setopt prompt_subst

CURRENT_DIR="%F{magenta}${FOLDER_ICON}[%~]%f"
SHELL_INFO="%F{cyan}${TERMINAL_ICON}[$(basename ${SHELL})]%f"
FACE="%F{green}:D%f"

git_info() {
  local g="$(__git_ps1 "%s")"
  if [[ $g == *"*"* ]]; then
    echo "%F{yellow}${BRANCH_ICON}$(__git_ps1 "[%s]")%f"
  elif [[ $g == *"+"* ]]; then
    echo "%F{yellow}${BRANCH_ICON}$(__git_ps1 "[%s]")%f"
  else
    echo "%F{green}${BRANCH_ICON}[$(__git_ps1 "%s")]%f"
  fi
}

precmd() {
  if [ $? -eq 0 ]; then
    FACE="%F{green}:D%f"
  else
    FACE="%F{red}:(%f"
  fi
}

export PROMPT='${SHELL_INFO} ${CURRENT_DIR} $(git_info)
${FACE} '

# Load secrets file if exists.
if [ -e ${HOME}/dotfiles/secrets.sh ]; then
  source ${HOME}/dotfiles/secrets.sh
fi
