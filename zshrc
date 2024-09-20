# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES=/Users/fdegiuli/dotfiles


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
for f in $DOTFILES/aliases/*; do source "$f"; done

# zsh-specific aliases
alias -g ...='../..'
alias -g ....='../../..'
alias hgrep='history 0 | grep'
alias whence='whence -f'

source $DOTFILES/expand-dots.zsh


# Load Git completion
zstyle ':completion:*:*:git:*' script $DOTFILES/git-completion.bash
fpath=($DOTFILES/zsh-completions/src $fpath)


# Uncomment if you turn off zsh-autocomplete
# autoload -Uz compinit && compinit

# Load fancy autocomplete
source $DOTFILES/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# reset up and down arrow
() {
   local -a prefix=( '\e'{\[,O} )
   local -a up=( ${^prefix}A ) down=( ${^prefix}B )
   local key=
   for key in $up[@]; do
      bindkey "$key" up-line-or-history
   done
   for key in $down[@]; do
      bindkey "$key" down-line-or-history
   done
}

# source $DOTFILES/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^I^I' autosuggest-accept



eval $(thefuck --alias)

# Install fzf things
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--bind=left:accept --no-mouse'
# make up arrow show the history
bindkey '^[[A' fzf-history-widget


# export PATH="$DOTFILES/git-fuzzy/bin:$PATH"

## Use p10k
# move to the top for fast prompt
source $DOTFILES/.p10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Get any stuff specific to this computer
source ~/.profile


export PATH="$PATH:/Users/$USER/tools"
export PATH=$PATH:/Users/fdegiuli/tools

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
