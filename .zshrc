autoload -U compinit
compinit

# antigen
source ~/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme gnzh
antigen apply

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
source '/home/shuhei/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/home/shuhei/google-cloud-sdk/completion.zsh.inc'
