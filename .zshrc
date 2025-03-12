autoload -U compinit
compinit

# Antigen
source ~/dotfiles/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

zstyle ':completion:*:default' menu select=1

# Use English on terminal
export LANG=en_US.UTF-8

# Alias
alias ls="ls --color=auto"

# TSUBAME
export TSUBAME_USER=ug03757
alias tsubame="ssh ${TSUBAME_USER}@login.t4.gsic.titech.ac.jp -YC"

# GENKAI
export GENKAI_USER=ku40001280
alias genkai="ssh ${GENKAI_USER}@genkai.hpc.kyushu-u.ac.jp -YC"

# ASDF
# https://asdf-vm.com/guide/upgrading-to-v0-16.html
export PATH=${HOME}/.asdf/bin:${PATH}
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

# Nerd icons
MACHINE_ICON=$'\uf108'
BRANCH_ICON=$'\ue0a0'
# BRANCH_ICON=$'\ue725'
FOLDER_ICON=$'\uea83'
EDIT_ICON=$'\uf044'
NEWFILE_ICON=$'\uea7f'

source ~/dotfiles/git-prompt.sh

# Prompt settings
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}${EDIT_ICON} "
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}${NEWFILE_ICON} "
zstyle ':vcs_info:*' formats "%F{green}%c%u${BRANCH_ICON}[%b]%f"
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
export PROMPT='%F{cyan}%n@%m%f %F{magenta}${FOLDER_ICON} [%~]%f ${vcs_info_msg_0_}
${FACE} '
