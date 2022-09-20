source $DOTFILES/bashrc 
source $DOTFILES/aliases

eval $(thefuck --alias)

## iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## paths for homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
