# Git abbreviations for fish shell
# Converted from aliases/git_aliases.sh

# Opendiff garbage
abbr -a orig 'find . -name "*.orig"'

## Git abbreviations
abbr -a g git

# Compare local to remote branch
abbr -a git-remote-log 'git log origin/(git rev-parse --abbrev-ref HEAD)'
abbr -a git-remote-log-diff 'git log origin/(git rev-parse --abbrev-ref HEAD)..HEAD'
abbr -a git-remote-diff 'git diff (git rev-parse --abbrev-ref HEAD)'
abbr -a grl 'git-remote-log'
abbr -a grld 'git-remote-log-diff'
abbr -a grd 'git-remote-diff'
abbr -a grb 'git branch -r'     # display remote branch

# Checkout
abbr -a gc 'git checkout '
abbr -a gcb 'git checkout -b'
abbr -a gcm 'git checkout master'
abbr -a grst "git restore"  # git checkout but only for files
abbr -a gsw "git switch"    # git checkout but only for branches

# Log
abbr -a gl 'git log --pretty=oneline'
abbr -a gls 'git log --pretty=oneline --stat'
abbr -a glol 'git log --graph --abbrev-commit --oneline --decorate'

# Local status
abbr -a gs 'git status'
abbr -a gss 'git status -s'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged'
abbr -a gdm "git diff master..."

# stash
abbr -a gst 'git stash '
abbr -a gsu 'git stash save --keep-index --include-untracked' # Stash everything that's not staged
# Destroy uncommited changes on current branch -- like hard reset and clean
abbr -a gdrop 'gs; gs drop'


# Update
abbr -a gp 'git pull'
abbr -a gpcb 'git pull origin (git branch --show-current)'
abbr -a gpm 'git checkout master; git pull'
abbr -a grom 'git fetch; git rebase origin/master'

# Rebase
abbr -a gr 'git rebase'
abbr -a gri 'git rebase -i'
abbr -a grc 'git rebase --continue'
abbr -a gra 'git rebase --abort'

abbr -a grh 'git reset --hard'

# Commit
abbr -a gcam "git commit -am"
abbr -a gcane 'git commit --amend --no-edit'
abbr -a gcaane 'git commit -a --amend --no-edit'

# Branches
abbr -a gb 'git branch '
# Delete every local branch merged into master -- relies on the remote server autodeleting merged branches
abbr -a gbclean "git fetch --prune; git branch --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" { print \$1 }' | xargs -r git branch -D" 

# Misc
abbr -a gsub "git submodule update --remote"                                                         # pull submodules
abbr -a gj "git-jump"

# Fuzzy stuff
abbr -a gaf "git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add"

# Gitlab
abbr -a mr 'git push -o merge_request.create'

# Git functions
# Switch to a remote branch
function gswr
    git fetch origin $argv[1]:$argv[1]
    git switch $argv[1]
end

# Commit all with message and push
function gcamp
    g add -A
    g commit -m $argv
    g push
end

# Move uncommited changes to new up-to-date branch
function gnb
    gs
    gpm
    gcb $argv
    gs pop
end
