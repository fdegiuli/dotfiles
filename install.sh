#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Running install script from $DIR"

echo "export DOTFILES=$DIR" >> ~/.bash_profile
echo "source $DIR/.bash_profile" >> ~/.bash_profile

# Download the git completion files
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

brew install thefuck
# brew install bash-completion@2

echo "Linking .inputrc"
ln -s $DIR/.inputrc ~/.inputrc

echo "Sourcing..."
source ~/.bash_profile

