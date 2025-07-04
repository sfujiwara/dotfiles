# wget \
#   -O ${HOME}/dotfiles/git-prompt.sh \
#   -nc \
#   -q \
#   https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
# wget \
#   -O ${HOME}/dotfiles/git-completion.bash \
#   -nc \
#   -q \
#   https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# source ${HOME}/dotfiles/git-completion.bash
# source ${HOME}/dotfiles/git-prompt.sh

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
        FACE="\[\e[32m\]:)\[\e[m\]"
    else
        FACE="\[\e[31m\]:(\[\e[m\]"
    fi
    PS1="\[\e[34m\]\u@\h\[\e[m\] \[\e[35m\]\w\[\e[m\]\[\e[33m\]\n${FACE} "
}
