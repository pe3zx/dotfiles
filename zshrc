alias ohmyzsh="mate ~/.oh-my-zsh"

export ZSH="/home/user/.oh-my-zsh"
export LANG=en_US.UTS-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ZSH_THEME="clean"

plugins=(git common-aliases git-extras docker)

source $ZSH/oh-my-zsh.sh

alias upgrade='sudo apt update; sudo apt upgrade -y; sudo apt dist-upgrade -y'
alias gssh='eval $(ssh-agent -s); ssh-add <key>'
alias dt='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias clean='bleachbit --list | grep -E "[a-z]+\.[a-z]+" | xargs bleachbit -c'
alias sclean='sudo bleachbit --list | grep -E "[a-z]+\.[a-z]+" | xargs bleachbit -c'
