export ZSH="/home/user/.oh-my-zsh"
export LANG=en_US.UTS-8

ZSH_THEME="clean"

plugins=(git common-aliases docker git-extras)

source $ZSH/oh-my-zsh.sh

alias upgrade='sudo apt update; sudo apt upgrade -y; sudo apt dist-upgrade -y'
alias clean='bleachbit --list | grep -E "[a-z]+\.[a-z]+" | xargs bleachbit -c'
alias sclean='sudo bleachbit --list | grep -E "[a-z]+\.[a-z]+" | xargs bleachbit -c'
# alias mg='sudo vmhgfs-fuse .host:/ <mount-point> -o subtype=vmhgfs-fuse,allow_other'
# alias gssh='eval $(ssh-agent -s); ssh-add <key>'

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
