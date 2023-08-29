# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES=/Users/fdegiuli/dotfiles
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

# zsh-specific aliases
alias -g ...='../..'
alias -g ....='../../..'
alias hgrep='history 0 | grep'

## Load Git completion
zstyle ':completion:*:*:git:*' script $DOTFILES/git-completion.bash
fpath=($DOTFILES $fpath)

## start the completion
autoload -Uz compinit && compinit

## Get any stuff specific to this computer
source ~/.profile

source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
source /Users/fdegiuli/grail/ui/lims/env.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
