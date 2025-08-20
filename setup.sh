#! /bin/bash

# Function to handle errors
handle_error() {
    echo "Error occurred in command: $BASH_COMMAND"
    read -p "Do you want to continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
}

# Set up error handling
trap 'handle_error' ERR

DIR="$( cd "$( dirname "${0}" )" >/dev/null 2>&1 && pwd )"
echo "Running setup script from $DIR"
cd $DIR

export DOTFILES=$DIR

# Keep sudo alive
sudo -v

## Run macOS setup script
echo "Running macOS setup script..."
bash $DIR/setup/setup_mac.sh

## install Homebrew and use it get a bunch of things
echo "installing homebrew..."
if command -v /opt/homebrew/bin/brew &> /dev/null
then
    echo "homebrew is already installed"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "loading brewfile..."
brew bundle install --file=$DIR/setup/brewfile

## Setup fish shell
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/fish

fish $DIR/fish/install.fish
