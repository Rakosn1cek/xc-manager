## XC-Manager
**Version: 0.3.0-beta**

A high-performance, minimal dependency Zsh vault for managing complex commands.

## New in v0.3.0-beta
* **Multi-Vault Support**: Separate commands into logical groups (e.g., work, home, projects).
* **Context Switching**: Use `xc use <name>` to toggle the active vault. Your Ctrl+G widget and xc commands automatically target the selected context.
* **Visual Indicators**: The TUI and CLI clearly display which vault is currently active to prevent accidental command execution or deletion.

## Features
* **Proactive Saving**: Run a command and save it immediately.
* **Retroactive Saving**: Save the last command you ran without retyping it.
* **FZF Integration**: Search your vault with fuzzy finding and live previews.
* **Ligature Friendly**: Uses standard ASCII -> that renders as a sleek arrow in Nerd Fonts.
* **Zero-Lag**: Uses Zsh autoload for near-instant shell startup.
* **Smart History**: Save the last command or select from your recent history.
* **Safe Maintenance**: Built-in transparent cleanup for duplicates.
* **Distro Agnostic**: Works on Arch, Fedora, Debian, and macOS.

## Requirements
* **zsh**
* **fzf**

## Installation
**Clone the repository**:
```zsh
git clone https://github.com/Rakosn1cek/xc-manager.git
```
**Add to your ~/.zshrc**:
```zsh
# Add to function path and autoload
fpath=(~/arch-projects/XC-Manager/autoload $fpath)
autoload -Uz xc fzf-vault-widget

# Initialize the widget
zle -N fzf-vault-widget
bindkey '^G' fzf-vault-widget

# Ensure history settings allow xc to see previous commands
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```
**Reload your shell**:
```zsh
source ~/.zshrc
```
**Initialize the vault (First time only)**:
```zsh
xc init
```
## Usage
**Managing Contexts (Multi-Vault)**

XC-Manager allows you to isolate commands into different vaults.
* **Switch or Create**: Use `xc use <name>` to toggle your active context.
* **Example**: `xc use work` (If it doesn't exist, a new work.txt is created automatically).
* **Automatic Selection**: Once a vault is active, any command saved via `xc` or `xc select` is instantly routed to that specific file.
* **Visual Confirmation**: Running `xc use` without arguments highlights the active vault.

**Saving Commands**
* **Capture last command**: Run `xc` to save the command you just executed.
* **Select from history**: Run `xc select` to browse your last 100 commands for saving.
* **Cleanup**: Run `xc clean` to scrub duplicates and empty entries from the active vault.

**Retrieving Commands**
* **Launch TUI**: Press `Ctrl + G` anywhere in your terminal.
* **Filter**: Type to fuzzy search. The description appears in the preview box.
* **Execute**: Press Enter to load the command into your prompt.
* **Delete**: Press `Alt + D` inside the TUI to delete the selected entry.

**Utilities**
* **Check version**: `xc -v`

## Configuration (Optional)
**Customize the look of your vault using Zsh's zstyle system**:
```zsh
zstyle ':xc:*' fzf_colors "gutter:-1,border:8,header:4,info:2,pointer:5,marker:13,fg+:7,prompt:5,hl:12"
```
## Roadmap
[x] Modular Architecture: Refactored to Zsh autoload for instant startup.

[x] Native Delete Feature: Alt+D keybinding to remove entries directly from the TUI.

[x] Vault Cleanup: Automatic removal of duplicates or empty descriptions.

[x] Multi-Vault Support: Ability to switch between different context files.

[ ] Export to Alias: Export vault commands directly to .zshrc as permanent aliases.

[ ] Global Search: Search across all vaults simultaneously.

## License
Distributed under the MIT License. See LICENSE for more information.

## Changelog
For a detailed history of changes and version milestones, please see CHANGELOG.md.
