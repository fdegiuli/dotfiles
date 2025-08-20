#! /bin/bash
set -e

DIR="$( cd "$( dirname "${0}" )" >/dev/null 2>&1 && pwd )"
echo "Running install script from $DIR"
cd $DIR

## link .zshrc
echo "linking zshrc into home directory"
if [ -e "$HOME/.zshrc" ]; then
	EXT="$(echo $RANDOM | md5sum | head -c 6)"
	printf "%-40s" "~/.zshrc backup at ~/.zshrc.$EXT"
	mv "$HOME/.zshrc" "$HOME/.zshrc.$EXT"
fi
ln -s $DIR/zshrc ~/.zshrc

echo "Fetching submodules..."
git submodule init
git submodule update --remote

# This got hardcoded into zshrc but it's a cool way to add a line to the beginning of a file
# echo "export DOTFILES=$DIR" | cat - zsh/zshrc > ~/.zshrc

## install just PL10k
echo "getting p10k..."
rm -rf .p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .p10k
# echo "source $DIR/.p10k/powerlevel10k.zsh-theme" >>~/.zshrc

## git completion
echo "downloading git completion scripts..."
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

