source $DOTFILES/.bashrc 
source $DOTFILES/.bash_aliases

eval $(thefuck --alias)

## iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## paths for homebrew
export PATH="/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export HISTCONTROL=ignoreboth:erasedups

