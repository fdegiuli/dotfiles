#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Running install script from $DIR"

echo "export DOTFILES=$DIR" >> ~/.profile
echo "source $DIR/.bash_profile" >> ~/.profile

# install Homebrew and use it get a bunch of things
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file=$DIR/brewfile

# Download the git completion files
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash


echo "Linking .inputrc"
ln -s $DIR/.inputrc ~/.inputrc

echo "Sourcing..."
source ~/.bash_profile

