#!/usr/bin/env zsh

# XC-Manager: A minimalist Zsh/FZF vault for commands
# GitHub: https://github.com/Rakosn1cek/xc-manager

xc() {
    local vault_file="$HOME/.local/share/cmd_vault.txt"
    mkdir -p "$(dirname "$vault_file")"

    local cmd_to_save
    if [ $# -eq 0 ]; then
        # Native Zsh history access (strips leading whitespace)
        # ${var## #} removes leading spaces natively
        cmd_to_save="${$(fc -ln -1)## #}"
    else
        cmd_to_save="$*"
    fi

    echo -n "Description for '$cmd_to_save': "
    read comment

    if [ -n "$comment" ]; then
        echo "$cmd_to_save -> $comment" >> "$vault_file"
        echo "Saved to vault!"
    else
        echo "Cancelled. No description provided."
    fi
}

fzf-vault-widget() {
    local vault_file="$HOME/.local/share/cmd_vault.txt"
    [ -f "$vault_file" ] || touch "$vault_file"

    local selected=$(cat "$vault_file" | fzf --height 40% --layout=reverse --border --preview 'echo {2..}' --preview-window=up:3:wrap)

    if [ -n "$selected" ]; then
        # Native Zsh string splitting (Removes everything after ' -> ')
        local cmd="${selected%% -> *}"
        # Native Zsh whitespace trimming
        LBUFFER="${cmd%"${cmd##*[![:space:]]}"}"
    fi
    zle redisplay
}

zle -N fzf-vault-widget
bindkey '^G' fzf-vault-widget
