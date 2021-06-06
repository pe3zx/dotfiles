# vimrc

This is my collection of Vim configuration


## Setup

1. Clone this repository to use

```sh
git clone --depth=1 https://github.com/pe3zx/vimrc.git ~/.vim
```

2. If you're using GUI version, install [Hack font](https://sourcefoundry.org/hack/) with a following command

```sh
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip; unzip Hack-v3.003-ttf.zip; mkdir -p ~/.fonts/; mv ttf/Hack-* ~/.fonts/; fc-cache -frv

```

3. Setup Vundle

```sh
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

4. Create a symlink from `rc.vim` to `~/.vimrc` and have fun!

```sh
ln -s ~/.vim/rc.vim ~/.vimrc
```

## Inspiration

- [amix/vimrc - The ultimate Vim configuration: vimrc](https://github.com/amix/vimrc)
- [dtinth/.vimrc - My VIM Settings.](https://github.com/dtinth/.vimrc)
