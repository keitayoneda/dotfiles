#!/bin/sh

echo 'if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

export PS1='
#"'"'\[\033[1;32m\]\u@\h\[\033[1;32m\] \[\033[34m\]\w\[\033[1;31m\]$(__git_ps1 '"' (%s)'"')\[\033[31m\]\n>\[\e[m '"'" >> ./hoge
