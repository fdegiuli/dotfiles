## ls aliases
alias ls='ls '
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lah'
alias l='ls -F'
alias laf='ls -aF'

## Misc
alias playground='cd /Users/fdegiuli/dev/playground'
alias grep='ggrep'
alias hgrep='history | grep'
alias psagrep='ps aux | grep'
# Trims leading and trailing whitespace
alias trim="awk '{\$1=\$1}1'"
manpdf() { man -t $1 | open -f -a /System/Applications/Preview.app; }
