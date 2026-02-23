# XC-Manager 

A minimal, high-performance command vault for Bash/Zsh users. Stop searching through messy shell history; save the commands that actually work and retrieve them instantly.

## Features
* **Proactive Saving**: Run a command and save it immediately.
* **Retroactive Saving**: Save the last command you ran without retyping it.
* **FZF Integration**: Search your vault with fuzzy finding and live previews.
* **Ligature Friendly**: Uses standard ASCII `->` that renders as a sleek arrow in Nerd Fonts.

## Dependencies:
Ensure you have the following installed on your system:
* **zsh**: The primary shell environment.
* **fzf**: For the fuzzy search interface.
* **wl-clipboard** (Wayland) or **xsel** (X11): For clipboard functionality.
* **A Nerd Font**: Recommended for best visual experience (ligatures).
* **fzf-vault-widget** relies on Zsh's **LBUFFER** and **zle**.

## Installation:

1. Clone this repository:

```zsh
   git clone https://github.com/Rakosn1cek/xc-manager.git ~/arch-projects/XC-Manager
```

2. Add the functions to your ~/.zshrc:

## HISTORY SETTINGS (Ensures 'xc' can see previous commands)

```zsh
HISTFILE=~/.zsh_history

HISTSIZE=10000

SAVEHIST=10000

setopt appendhistory
```

## THE COMMAND VAULT (XC)

```zsh
function xc() {
    local vault_file="$HOME/.local/share/cmd_vault.txt"
    mkdir -p "$(dirname "$vault_file")"

    local cmd_to_save=""
    if [ $# -eq 0 ]; then
        cmd_to_save=$(fc -ln -1 | sed 's/^[ \t]*//;s/[ \t]*$//')
    else
        "$@"; local exit_status=$?
        cmd_to_save="$*"
        [[ $exit_status -ne 0 ]] && return $exit_status
    fi

    cmd_to_save=$(echo "$cmd_to_save" | sed 's/^[ \t]*//;s/[ \t]*$//')
    echo -e "\033[0;32mCommand:\033[0m $cmd_to_save"
    vared -p "Edit? > " cmd_to_save
    echo -e "\033[0;32mComment:\033[0m"
    read -r comment
    
    [[ -z "$comment" ]] && { echo "✘ Cancelled"; return 1; }

    # Using ' ┃ ' as the professional separator
    echo "$cmd_to_save  ->  $comment" >> "$vault_file"
    echo "✔ Saved."
}

fzf-vault-widget() {
    local vault_file="$HOME/.local/share/cmd_vault.txt"
    [[ ! -f "$vault_file" ]] && return

    # --with-nth 1: Keeps the list clean (command only)
    # --nth 1..: Allows searching by both command AND description
    # --preview: Shows the description in the box above
    local selected=$(cat "$vault_file" | \
        fzf --height 45% --layout=reverse --border --prompt="Vault ❯ " \
        --color="prompt:#875faf,border:#444444" \
        --delimiter ' -> ' \
        --with-nth 1 \
        --nth 1.. \
        --preview 'echo {2}' --preview-window=up:1:wrap)

    if [ -n "$selected" ]; then
        # Grab only the command part for the terminal prompt
        LBUFFER=$(echo "$selected" | awk -F ' -> ' '{printf "%s", $1}' | sed 's/[[:space:]]*$//')
    fi
    zle reset-prompt
}
zle -N fzf-vault-widget
bindkey '^g' fzf-vault-widget
```

3. Reload your shell:

```zsh
source ~/.zshrc
```

## Usage:

4. Saving a command

To run and save a command at once

```zsh
xc sudo pacman -Syu
```

To save the very last command you executed:

```zsh
xc
```

5. Retrieving a command:

Press Ctrl + G anywhere in your terminal.

Use the arrow keys or type to filter.

The description appears in the preview box at the top.

Press Enter to load the command into your prompt.

## License

Distributed under the MIT License. See LICENSE for more information.
