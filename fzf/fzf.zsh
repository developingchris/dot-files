if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-file ~/.fzfignore --glob "!.git"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
