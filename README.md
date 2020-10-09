# dotfiles

This repository is inspired by [StreakyCobra](https://news.ycombinator.com/item?id=11071754) about maintaining dotfiles repository with `git init --bare`. You can find more information about this technique on [Atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

```sh
git init --bare $HOME/.dotfiles
alias dt='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dt config status.showUntrackedFiles no
```

To setup the environment on new machine, use:

```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/pe3zx/dotfiles.git $HOME/.dotfiles-tmp
cp ~/.dotfiles-tmp/.gitmodules
rm -r ~/.dotfiles-tmp
alias dt='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

The repo contains:

- vim configuration based on [pe3zx/vimrc](https://github.com/pe3zx/vimrc)

