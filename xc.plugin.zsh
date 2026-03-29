#!/usr/bin/env zsh

# 1. Add the plugin's function directory to fpath
# This allows Zsh to find 'xc' and 'fzf-vault-widget'
fpath+=( "${0:A:h}/autoload" )

# 2. Define the functions for autoloading
autoload -Uz xc fzf-vault-widget

# 3. Register the widget with ZLE (Zsh Line Editor)
zle -N fzf-vault-widget

# 4. Bind the widget to Ctrl+G
bindkey '^G' fzf-vault-widget
