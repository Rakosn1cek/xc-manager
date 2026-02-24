# XC-Manager 
VERSION = 0.1.1-beta

![XC-Manager Preview](preview.jpg)

A minimalist, dependency-free Zsh vault for your most used (and most complex) commands.

What's New in v0.1.1:

**Clean UI**: The main list now shows only the commands, keeping your workspace clutter-free.

**Smart Preview**: Detailed descriptions are instantly visible in a dedicated top-window preview.

**Native Zsh Logic**: Zero external dependencies—no awk, no sed. It uses pure Zsh parameter expansion for maximum speed.

**Custom Themes**: Full support for FZF color schemes via zstyle.

## Features
* **Proactive Saving**: Run a command and save it immediately.
* **Retroactive Saving**: Save the last command you ran without retyping it.
* **FZF Integration**: Search your vault with fuzzy finding and live previews.
* **Ligature Friendly**: Uses standard ASCII `->` that renders as a sleek arrow in Nerd Fonts.

## Requirements:

**zsh**

**fzf**

## Installation:

1. Clone this repo:
 
```zsh
git clone https://github.com/Rakosn1cek/xc-manager.git
```

2. Add this line to your ~/.zshrc:

```zsh
source ~/xc-manager/xc-manager.sh
```

## HISTORY SETTINGS (Ensures 'xc' can see previous commands)

```zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```
### Reload your shell:

```zsh
source ~/.zshrc
```
3. Configuration (Optional)
You can customize the look of your vault using Zsh's zstyle system:
Customize FZF colors

```zsh
zstyle ':xc:*' fzf_colors "gutter:-1,border:8,header:4,info:2,pointer:5,marker:13,fg+:7,prompt:5,hl:12"
```

## Usage:

4. Save the command you JUST ran (Recommended)
Just run any command as usual. If it works and you want to keep it, just type:

```zsh
xc
```
5. Run and Save at once
If the command is simple, you can prefix it:

```zsh
xc echo "Hello World"
```

6. Retrieving a command:

Press Ctrl + G anywhere in your terminal.

Use the arrow keys or type to filter.

The description appears in the preview box at the top.

Press Enter to load the command into your prompt.

## License

Distributed under the MIT License. See LICENSE for more information.

### Changelog

**v0.1.1-beta (Current)**

Refined TUI: Implemented fzf delimiters for a cleaner list view.

Smart Previews: Added a top-window preview showing only the description using native Zsh string expansion.

Styling Hook: Added zstyle support for custom separators and fzf color schemes.

Dependency-Free: Removed all external tool requirements (awk/sed) in favor of pure Zsh logic.

Bug Fix: Resolved an issue where commands with multiple spaces were being truncated in the preview.

**v0.1.0-alpha**

Initial Release: Basic command vaulting and history integration.

FZF Integration: Basic fuzzy search for stored commands.

### Roadmap

[ ] Native Delete Feature: Implement a keybinding (e.g., Alt+D) to remove entries directly from the FZF interface without opening the vault file.

[ ] Vault Cleanup: A command to remove duplicate entries or empty descriptions automatically.

[ ] Multi-Vault Support: Ability to switch between different vault files (e.g., work, personal, hyprland).

[ ] Export to Alias: A way to export a frequently used vault command directly to your .zshrc as a permanent alias.
