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

# sbin for Homebrew.
export PATH=/usr/local/sbin:$PATH

# Path for gettext.
export PATH="/usr/local/opt/gettext/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias for Homebrew to solve warnings on Pyenv.
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# Poetry
export PATH=$HOME/.poetry/bin:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# Polyaxon
export POLYAXON_NO_OP=true

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"
# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"

# Specify Python path for Google Cloud SDK
export CLOUDSDK_PYTHON=~/.pyenv/versions/2.7.9/bin/python

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
