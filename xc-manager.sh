#!/usr/bin/env zsh

# XC-Manager | Version: 0.1.1-beta
# ---------------------------------------------------------
readonly XC_VERSION="0.1.1-beta"

# XC-Manager: A minimalist Zsh/FZF vault for commands
# GitHub: https://github.com/Rakosn1cek/xc-manager

# --- Configuration (zstyle) ---
# Users can set these in their .zshrc. 
# Example: zstyle ':xc:*' separator "󰁔"
# Example: zstyle ':xc:*' fzf_colors "hl:4,hl+:12,info:2,prompt:5"
# ------------------------------

xc() {
    if [[ "$1" == "-v" || "$1" == "--version" ]]; then
        echo "XC-Manager version $XC_VERSION"
        return 0
    fi
        
    local vault_file="$HOME/.local/share/cmd_vault.txt"
    mkdir -p "$(dirname "$vault_file")"

    local sep
    zstyle -s ':xc:*' separator sep || sep="->"

    local cmd_to_save
    if [ $# -eq 0 ]; then
        cmd_to_save="${$(fc -ln -1)## #}"
    else
        cmd_to_save="$*"
    fi

    echo -n "Description for '$cmd_to_save': "
    read comment

    if [ -n "$comment" ]; then
        echo "$cmd_to_save $sep $comment" >> "$vault_file"
        echo "Saved to vault!"
    else
        echo "Cancelled. No description provided."
    fi
}

fzf-vault-widget() {
    local vault_file="$HOME/.local/share/cmd_vault.txt"
    [ -f "$vault_file" ] || touch "$vault_file"

    # -d " -> " tells fzf to split the line ONLY at the arrow
    # --with-nth=1 then tells it to ONLY show the command (the part before the arrow)
    local selected=$(cat "$vault_file" | fzf \
        --height 40% \
        --layout=reverse \
        --border \
        --prompt="⚡ Vault > " \
        --color="gutter:-1,border:8,header:4,info:2,pointer:5,marker:13,fg+:7,prompt:5,hl:12" \
        --header="[ Enter: Paste | Ctrl+C: Cancel ]" \
        --delimiter=" -> " \
        --with-nth=1 \
        --preview-window="up:3:wrap" \
        --preview 'line={}; echo ${line#* -> }')

    if [ -n "$selected" ]; then
        local cmd="${selected%% -> *}"
        LBUFFER="${cmd%"${cmd##*[![:space:]]}"}"
    fi
    zle redisplay
}

zle -N fzf-vault-widget
bindkey '^G' fzf-vault-widget
