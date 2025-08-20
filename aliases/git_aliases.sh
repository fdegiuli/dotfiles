# Opendiff garbage
alias orig='find . -name "*.orig"'

## Git aliases
alias g=git

# Compare local to remote branch
alias git-remote-log='git log origin/$(git rev-parse --abbrev-ref HEAD)'
alias git-remote-log-diff='git log origin/$(git rev-parse --abbrev-ref HEAD)..HEAD'
alias git-remote-diff='git diff $(git rev-parse --abbrev-ref HEAD)'
alias grl='git-remote-log'
alias grld='git-remote-log-diff'
alias grd='git-remote-diff'
alias grb='git branch -r'     # display remote branch

# Checkout
alias gc='git checkout '
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias grst="git restore"  # git checkout but only for files
alias gsw="git switch"    # git checkout but only for branches
gswr() { git fetch origin $1:$1; git switch $1 }  # Switch to a remote branch.  may need to add a --set-upstream for git pull to work?

# Log
alias gl='git log --pretty=oneline'
alias gls='git log --pretty=oneline --stat'
alias glol='git log --graph --abbrev-commit --oneline --decorate'

# Local status
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gds='git diff --staged'
alias gdm="git diff master..."

# stash
alias gst='git stash '
alias gsu='git stash save --keep-index --include-untracked' # Stash everything that's not staged

# Update
alias gp='git pull'
alias gpcb='git pull origin $(git branch --show-current)'
alias gpm='git checkout master; git pull'
alias grom='git fetch; git rebase origin/master'

# Rebase
alias gr='git rebase'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'

alias grh='git reset --hard'

# Commit
alias gcam="git commit -am"
alias gcane='git commit --amend --no-edit'
alias gcaane='git commit -a --amend --no-edit'

# Commit all with message and push
gcamp() { g add -A; g commit -m $1; g push; }

# Branches
alias gb='git branch '
# Delete every local branch merged into master -- relies on the remote server autodeleting merged branches
alias gbclean="git fetch --prune; git branch --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" { print \$1 }' | xargs -r git branch -D" 


# Misc
alias gsub="git submodule update --remote"                                                         # pull submodules
alias gj="git-jump"

# Fuzzy stuff
alias gaf="git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add"


# Move uncommited changes to new up-to-date branch
gnb() { gs; gpm; gcb $1; gs pop; }
# Destroy uncommited changes on current branch -- like hard reset and clean
gdrop() { gs; gs drop; }


## Hub
# alias git=hub
# alias pr='git push; hub pull-request'

## Gitlab
alias mr='git push -o merge_request.create'

## Git completion aliases for bash
#__git_complete gc _git_checkout
#__git_complete g _git
#__git_complete gs _git_stash
