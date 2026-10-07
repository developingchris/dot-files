# ctrl-t, ctrl-r, alt-c key bindings and ** completion. Loaded last so
# oh-my-zsh's key bindings don't clobber ctrl-r.
if type fzf &> /dev/null; then
    source <(fzf --zsh)
fi
