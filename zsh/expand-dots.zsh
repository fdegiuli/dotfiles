# Based on http://stackoverflow.com/a/41420448/4757

function expand-multiple-dots() {
    local MATCH
    if [[ $LBUFFER =~ '(^| )\.\.\.+' ]]; then
        LBUFFER=$LBUFFER:fs%\.\.\.%../..%
    fi
}

function expand-multiple-dots-then-expand-or-complete() {
    zle expand-multiple-dots
    zle expand-or-complete
}

function expand-multiple-dots-then-accept-line() {
    zle expand-multiple-dots
    zle accept-line
}

# tab key
zle -N expand-multiple-dots
zle -N expand-multiple-dots-then-expand-or-complete
bindkey '^I' expand-multiple-dots-then-expand-or-complete
# enter key
# zle -N expand-multiple-dots-then-accept-line
# bindkey '^M' expand-multiple-dots-then-accept-line
