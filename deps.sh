#!/bin/bash
# Install external dependencies, require brew and golang installed

set -eux

# shell script
brew install shellcheck

# golang
brew install go
export GOPATH=$HOME/go-dev-tools
go get -u \
   github.com/alecthomas/gometalinter \
   github.com/nsf/gocode \
   github.com/rogpeppe/godef \
   golang.org/x/tools/cmd/goimports \
   golang.org/x/tools/cmd/gorename \
   golang.org/x/tools/cmd/gomvpkg \
   golang.org/x/tools/cmd/guru \
   github.com/jstemmer/gotags

gocode set autobuild true

gometalinter --install

# python
# sudo port install python27
# sudo port select --set python python27
# sudo port install py-flake8 py-pylint
# sudo port select --set flake8 flake8-27
# sudo port select --set pylint pylint27
# sudo port install py-virtualenvwrapper
# sudo port select --set virtualenv virtualenv27
brew install python
pip install flake8
pip install pylint
pip install virtualenvwrapper

brew install the_silver_searcher

# javascript
brew install nodejs
npm install standard -g
npm install tern -g

snippet_dir=~/.emacs.d/yasnippet-snippets
if [[ -d "$snippet_dir" ]]; then
    pushd "$snippet_dir"
    git pull
    popd
else
    git clone git@github.com:AndreaCrotti/yasnippet-snippets.git "$snippet_dir"
fi
