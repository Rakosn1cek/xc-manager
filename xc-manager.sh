#!/bin/bash

VAULT_FILE="$HOME/.local/share/cmd_vault.txt"

# 1. Pipe file to rofi with improved visuals
# We added -theme-str to make it look cleaner and more like a modern Arch TUI
SELECTED=$(cat "$VAULT_FILE" | rofi -dmenu -i -p "󰆼 Vault" \
    -theme-str 'window {width: 40%;} listview {lines: 10;}' \
    -kb-custom-1 "Shift+Return")

# Capture the exit code to see if Shift+Enter was pressed
EXIT_CODE=$?

if [ -n "$SELECTED" ]; then
    CMD=$(echo "$SELECTED" | awk -F ' -> ' '{print $1}')
    
    # Logic: Shift+Enter (code 10) runs it, Enter (code 0) copies it
    if [ "$EXIT_CODE" -eq 10 ]; then
        # Launch in a terminal (assuming kitty, change to your favorite terminal if needed)
        kitty sh -c "$CMD; exec $SHELL" &
        notify-send "Vault" "Executing: $CMD"
    else
        echo -n "$CMD" | wl-copy
        notify-send "Vault" "Copied to clipboard"
    fi
fi
