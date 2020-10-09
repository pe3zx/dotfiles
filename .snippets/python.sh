#!/bin/bash

mkdir ~/.ve/
mkdir ~/workspace/

sudo apt-get update

sudo apt-get install --no-install-recommends -y make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

git clone --depth=1 https://github.com/pyenv/pyenv.git ~/.pyenv
echo '\nexport PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
exec "$SHELL"

git clone --depth=1 https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshenv
exec "$SHELL"

git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
echo '\nexport WORKON_HOME=~/.ve' >> ~/.zshrc
echo 'export PROJECT_HOME=~/workspace' >> ~/.zshrc
exec "$SHELL"

pyenv install 2.7.18
pyenv install 3.8.2

pyenv virtualenv 2.7.18 tools2
pyenv activate tools2
pip install -U pip setuptools wheel ipython
pyenv deactivate

pyenv virtualenv 3.8.2 tools3
pyenv activate tools3
pip install -U pip setuptools wheel ipython
pyenv deactivate

pyenv global 3.8.2 2.7.18 tools3 tools2

echo '\npyenv virtualenvwrapper_lazy' >> ~/.zshrc
exec "$SHELL"

