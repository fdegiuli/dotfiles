## set the history to be super long
HISTSIZE=10000
HISTFILESIZE=100000
HISTTIMEFORMAT="%d/%m/%y %T "

## append to history, don't overwrite it
shopt -s histappend 

## save everything to history as it is entered, and read history before every line
# export PROMPT_COMMAND='history -a; history -c; history -r; $PROMPT_COMMAND'

## change the prompt
export PS1='\[[1m\]\u \W$ \[(B[m\]'
export BASE_PROMPT='\[[1m\]\u \W \[(B[m\]'

## add colors to ls
export CLICOLOR=1
export LSCOLORS=GxdxBxDxCxEgEdxbxgxcxd

## paths for homebrew
export PATH='/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin'
export PATH="/usr/local/sbin:$PATH"

## Git prompt + completion
# Find here: https://github.com/git/git/tree/master/contrib/completion
source ~/.git-prompt.sh
source ~/.git-completion.bash

## Fancier completion
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
#  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
#fi

export PROMPT_COMMAND='__git_ps1 "$BASE_PROMPT" "\\\$ "'
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=1

## Autocomplete ssh aliases
complete -o default -o nospace -W "$( grep '^Host' $HOME/.ssh/config | grep -v '*' | cut -d' ' -f2- )" scp sftp ssh rsync

source ~/.bash_aliases
