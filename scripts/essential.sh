#!/bin/sh

#update & install default packages
sudo apt-get update 
sudo apt-get upgrade -y

sudo apt-get install -y wget curl vim nano tmux rsync
sudo apt-get install -y bash-completion
sudo apt-get install -y build-essential libstdc++-11-dev ninja-build
sudo apt-get install -y automake gcc cmake
sudo apt-get install -y glibc-source glibc-tools
sudo apt-get install -y doxygen graphviz

#show git branch name on prompt
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ${HOME}/.git-completion.sh
curl -O  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ${HOME}/.git-prompt.sh 

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

PS1="\[\033[1;32m\]\u@\h\[\033[1;32m\] \[\033[34m\]\w\[\033[1;31m\]$(__git_ps1 " (%s)")\[\033[31m\]\n>\[\e[m " ' >> ~/.bashrc
source ~/.bashrc
