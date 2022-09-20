## Use p10k -- leave near the top for fast prompt
source $DOTFILES/.p10k/powerlevel10k.zsh-theme

## add colors to ls
export CLICOLOR=1
export LSCOLORS=GxdxBxDxCxEgEdxbxgxcxd

## Homebrew paths
eval "$(/opt/homebrew/bin/brew shellenv)"

## History 
HISTSIZE=5000
SAVEHIST=100000                  # Size of the history file
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

## Load all the aliases
source $DOTFILES/aliases
source $DOTFILES/git_aliases

## Load Git completion
zstyle ':completion:*:*:git:*' script $DOTFILES/git-completion.bash
fpath=($DOTFILES $fpath)

## start the completion
autoload -Uz compinit && compinit

## Get any stuff specific to this computer
source ~/.profile
