#! /bin/bash
set -e

DIR="$( cd "$( dirname "${0}" )" >/dev/null 2>&1 && pwd )"
echo "Running install script from $DIR"
cd $DIR

ls

echo "copying .zshrc..."
echo "export DOTFILES=$DIR" | cat - zshrc > ~/.zshrc

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


## install OMZ + p10k
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
## echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

## install just PL10k
echo "getting p10k..."
rm -rf .p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .p10k
# echo "source $DIR/.p10k/powerlevel10k.zsh-theme" >>~/.zshrc

## pretty stuff
echo "downloading syntax highlighting scripts..."
brew install zsh-syntax-highlighting
echo 'source #{HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

## autosuggestions
echo "downloading autosuggestions script..."
rm -rf zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions
echo "source $DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

## git completion
echo "downloading git completion scripts..."
curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh