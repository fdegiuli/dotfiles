## set the history to be super long
export HISTSIZE=10000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth:erasedups

## append to history, don't overwrite it
shopt -s histappend 

## save everything to history as it is entered, and read history before every line
# export PROMPT_COMMAND='history -a; history -c; history -r; $PROMPT_COMMAND'

## change the prompt
export PS1='\[[1m\]\w$ \[(B[m\]'
export BASE_PROMPT='\[[1m\] \w \[(B[m\]'
PROMPT_DIRTRIM=3

## add colors to ls
export CLICOLOR=1
export LSCOLORS=GxdxBxDxCxEgEdxbxgxcxd

## Git prompt + completion
# Find here: https://github.com/git/git/tree/master/contrib/completion
source $DOTFILES/git-prompt.sh
source $DOTFILES/git-completion.bash

export PROMPT_COMMAND='__git_ps1 "$BASE_PROMPT" "\\\$ "'
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
# export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=1


## Bash-completion -- better, faster, and required for many packages
if [[ -e "/usr/local/share/bash-completion/bash_completion" ]]; then
	export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
	source "/usr/local/share/bash-completion/bash_completion"
elif [[ -e "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
	source "/usr/local/etc/profile.d/bash_completion.sh"
elif [[ -e "/etc/bash_completion" ]]; then
	source "/etc/bash_completion"
fi

# Make Tab autocomplete regardless of filename case
set completion-ignore-case on
# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on
set menu-complete-display-prefix on

# Flip through autocompletion matches with Shift-Tab.
bind "TAB: menu-complete"
bind "\C-q: complete"

## Autocomplete ssh aliases
complete -o default -o nospace -W "$( grep '^Host' $HOME/.ssh/config | grep -v '*' | cut -d' ' -f2- )" scp sftp ssh rsync
