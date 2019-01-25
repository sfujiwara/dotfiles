autoload -U compinit
compinit

# antigen
source ~/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen theme gnzh
antigen theme vvakame/dotfiles themes/vv-custom
antigen apply

# Mac の homebrew 用の記述だけど Ubuntu でも害はないはず
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"
# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"
# Specify Python path for Google Cloud SDK
export CLOUDSDK_PYTHON=~/.pyenv/versions/2.7.13/bin/python

# Setting for peco
function peco-select-history() {
 local tac
 if which tac > /dev/null; then
     tac="tac"
 else
     tac="tail -r"
 fi
 BUFFER=$(\history -n 1 | \
     eval $tac | \
     awk '!a[$0]++' | \
     peco --query "$LBUFFER")
 CURSOR=$#BUFFER
 zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
