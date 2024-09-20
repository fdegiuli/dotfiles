#! /bin/bash
set -e

DIR="$( cd "$( dirname "${0}" )" >/dev/null 2>&1 && pwd )"
echo "Running install script from $DIR"
cd $DIR

# This got hardcoded into zshrc but it's a cool way to add a line to the beginning of a file
# echo "export DOTFILES=$DIR" | cat - zshrc > ~/.zshrc

## install Homebrew and use it get a bunch of things
echo "installing homebrew..."
if command -v /opt/homebrew/bin/brew &> /dev/null
then
    echo "homebew is already installed"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "loading brewfile..."
brew bundle install --file=$DIR/brewfile

## Enable fzf
$(brew --prefix)/opt/fzf/install


## install OMZ + p10k
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
## echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

## install just PL10k
echo "getting p10k..."
rm -rf .p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .p10k
# echo "source $DIR/.p10k/powerlevel10k.zsh-theme" >>~/.zshrc

## git completion
echo "downloading git completion scripts..."
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

## link .zshrc
echo "linking zshrc into home directory"
if [ -e "$HOME/.zshrc" ]; then
	EXT="$(echo $RANDOM | md5sum | head -c 6)"
	printf "%-40s" "~/.zshrc backup at ~/.zshrc.$EXT"
	mv "$HOME/.zshrc" "$HOME/.zshrc.$EXT"
fi
ln -s zshrc ~/.zshrc