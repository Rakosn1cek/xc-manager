## XC-Manager
**Version: 0.5.0-beta**

A high-performance, minimal dependency Zsh vault for managing complex commands.

## New in v0.5.0-beta
### The "Alias Export" Update ⚡
Convert your saved commands into permanent Zsh aliases instantly with Alt-E.
* **Modular by Default**: Keeps your .zshrc clean by saving to ~/.zsh_aliases.
* **User Choice**: Prefer a single config? Set `export XC_ALIAS_TARGET="$HOME/.zshrc"` to save directly to your main file.
* **Safety First**: Built-in collision detection prevents overwriting system commands or existing aliases.
* **Instant Activation**: New aliases are live the second you create them—no shell restart required.

Existing users: To enable this feature, simply add `[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases` to your `.zshrc`.

## Features
* **Proactive Saving**: Run a command and save it immediately.
* **Retroactive Saving**: Save the last command you ran without retyping it.
* **FZF Integration**: Search your vault with fuzzy finding and live previews.
* **Alias Export Engine**: Convert any saved command into a permanent Zsh alias instantly with Alt-E.
* **Collision Detection**: Built-in safety checks prevent you from accidentally overwriting system commands or existing aliases.
* **Modular Configuration**: Choose your "Source of Truth"—save to ~/.zshrc or keep it clean with a dedicated ~/.zsh_aliases file.
* **Instant Activation**: Exported aliases are injected into your current session immediately—no shell restart required.
* **Ligature Friendly**: Uses standard ASCII -> that renders as a sleek arrow in Nerd Fonts.
* **Zero-Lag**: Uses Zsh autoload for near-instant shell startup.
* **Smart History**: Save the last command or select from your recent history.
* **Safe Maintenance**: Built-in transparent cleanup for duplicates.
* **Distro Agnostic**: Works on Arch, Fedora, Debian, and macOS.
* **Toggable Search**: Seamlessly switch between local vault and global search using Ctrl-A and Ctrl-R without exiting the TUI.

## Requirements
* **zsh**
* **fzf**
* **sed** (The line-editor for deletions)
* **grep** (The standard search tool)

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
bindkey 'Ctrl-G' fzf-vault-widget

# Ensure history settings allow xc to see previous commands
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```
**To enable the Alias feature, add to your .zshrc.** 
```zsh
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
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

**Search across all vaults**
* **Global Search**: Pressing `Ctrl-A` while in the TUI (Ctrl-G) will expand your search to every vault in your collection. This mode is for searching and selecting commands only for safety. Delete (Alt-D) is disabled by default.

**Exporting Aliases (v0.5.0+)**
* **Open the vault**: `Ctrl-G`(or your custom binding).
* **Highlight a command**: and press `Alt-E`.
* **Type a name for your alias and hit Enter.**
* **The alias is now saved and active!**
**Remember, as of v0.5.0-beta**
Aliases are saved by default to ~/.zsh_aliases. If you prefer to save them directly into your main config file, add this to your .zshrc:
```zsh
export XC_ALIAS_TARGET="$HOME/.zshrc"
```

**Utilities**
* **Check version**: `xc -v`

## Configuration (Optional)
**Customize the look of your vault using Zsh's zstyle system**:
```zsh
zstyle ':xc:*' fzf_colors "gutter:-1,border:8,header:4,info:2,pointer:5,marker:13,fg+:7,prompt:5,hl:12"
```
## Recommended Integrations
**Alias Browser (als)**
If you want an easy way to browse and run your newly created aliases using `fzf`, I highly recommend checking out my show-aliases.sh script. It searches both your .zshrc and .zsh_aliases to give you a unified, interactive menu.

* **View Script**: on GitHub [Show-Aliases Script](https://github.com/Rakosn1cek/dotfiles-rk1/tree/main/shell-common/custom-scripts/Show-Aliases)
* **Key Feature**: Seamlessly displays XC-Manager exports alongside your manual system aliases.

## Roadmap
[x] Modular Architecture: Refactored to Zsh autoload for instant startup.

[x] Native Delete Feature: Alt+D keybinding to remove entries directly from the TUI.

[x] Vault Cleanup: Automatic removal of duplicates or empty descriptions.

[x] Multi-Vault Support: Ability to switch between different context files.

[x] Export to Alias: Export vault commands directly to .zshrc as permanent aliases.

[x] Global Search: Search across all vaults simultaneously.

## Maintenance & Stability
This project follows the KISS (Keep It Simple, Stupid) principle. Because it relies on standard Unix tools and native Zsh functions, it is designed to be "set and forget".
- **Feature Complete**: v0.5.0-beta contains the core intended workflow. I don't plan on adding heavy dependencies or feature bloat.
- **Long-term Support**: As an Arch user, I use this tool daily. I will provide active maintenance for bug fixes and Zsh compatibility updates.
- **Plain Text Forever**: Your vaults are stored in simple .txt files. Your data remains portable and human readable regardless of the tool.

## Support & Feedback
- **Bug Reports**: If something isn't working, especially with the Alias Export engine, please open an [Issue](https://github.com/Rakosn1cek/XC-Manager/issues).
- **Feature Ideas**: To discuss the roadmap or suggest a polish, head over to the[Discussions](https://github.com/Rakosn1cek/XC-Manager/discussions) tab.
- **Community Snippets**: Have a complex one-liner you've vaulted? Share it in the "Show and Tell" discussion.

## License
Distributed under the MIT License. See LICENSE for more information.

## Changelog
For a detailed history of changes and version milestones, please see CHANGELOG.md.

## Support the Project
If XC-Manager makes your workflow faster or your `.zshrc` cleaner, please consider giving it a Star on GitHub! It helps other Arch users find the project and keeps the development of features like v0.5.0-beta going.

*Project Note: This documentation and parts of the shell optimization were proofread and refined with the help of LLMs to ensure clarity and performance.*

[**⭐ Star XC-Manager on GitHub**](https://github.com/Rakosn1cek/XC-Manager)

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-ffdd00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/Rakosn1cek)
