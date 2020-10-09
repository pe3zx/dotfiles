# dotfiles

This repository is inspired by [StreakyCobra](https://news.ycombinator.com/item?id=11071754) about maintaining dotfiles repository with `git init --bare`. You can find more information about this technique on [Atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

## Setup

```sh
git init --bare $HOME/.dotfiles
alias dt='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dt config status.showUntrackedFiles no
```

## Deploy

To setup the environment on new machine, use:

```sh
# Installed required packages
sudo apt update; sudo apt install -y vim git tmux curl wget zsh

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Deploy dotfiles
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/pe3zx/dotfiles.git $HOME/.dotfiles-tmp
cp ~/.dotfiles-tmp/.gitmodules
rm -r ~/.dotfiles-tmp
alias dt='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## Inside dotfiles

The repo contains:

- vim configuration based on [pe3zx/vimrc](https://github.com/pe3zx/vimrc)
    - The vim config has `rcnp.vim` for no-plugin version and can be configured with `ln -s ~/.vim/rcnp.vim ~/.vimrc`
- `.zshrc` for [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- `.tmux` from [gpakosz/.tmux](https://github.com/gpakosz/.tmux)
