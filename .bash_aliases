## ls aliases
alias ls='ls '
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lah'
alias l='ls -F'
alias laf='ls -aF'

## Get that zsh magic
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Opendiff garbage
alias orig='find . -name "*.orig"'

## Git aliases
alias g=git
alias git-remote-log='git log origin/$(git rev-parse --abbrev-ref HEAD)'
alias git-remote-log-diff='git log origin/$(git rev-parse --abbrev-ref HEAD)..HEAD'
alias git-remote-diff='git diff $(git rev-parse --abbrev-ref HEAD)'
alias grl='git-remote-log'
alias grld='git-remote-log-diff'
alias grd='git-remote-diff'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gs='git stash'
alias gcm='git checkout master'
alias gpm='git checkout master; git pull'
# alias git=hub
# alias pr='git push; hub pull-request'
gnb() { gs; gpm; gcb $1; gs pop; }

# Git completion aliases
__git_complete gc _git_checkout
__git_complete g _git
__git_complete gs _git_stash

## Misc
alias s='subl'
alias playground='cd /Users/fdegiuli/dev/playground'
alias grep='ggrep'
alias hgrep='history | grep'
alias psagrep='ps aux | grep'
