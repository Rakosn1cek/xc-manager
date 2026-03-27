## XC-Manager
**Version: 0.7.0**
[![Awesome Zsh Plugins](https://img.shields.io/badge/Awesome-Zsh%20Plugins-brightgreen)](https://github.com/unixorn/awesome-zsh-plugins)

![XC-Manager TUI](https://github.com/Rakosn1cek/xc-manager/blob/main/preview-2.png)

### XC-Manager in Action
<p align="center">
  <video src="https://github.com/user-attachments/assets/d67640fb-4e9e-4d36-b7a1-d588a24ab9a6" width="700" controls muted autoplay loop>
    Your browser does not support the video tag.
  </video>
</p>

A high-performance, minimal dependency Zsh vault for managing complex commands.

## What's New in v0.7.0 
### Interactive Templating & Sync Engine
The v0.7.0 release transforms XC-Manager from a static command vault into a dynamic template engine. 

### Interactive Placeholders
You can now save commands with `{{variables}}`. When you execute a templated command, XC-Manager will intelligently prompt you for input.
* **Smart Global Swap**: If you use the same placeholder name multiple times (e.g., `cp {{file}} {{file}}.bak`), the engine only asks you once and updates all instances globally.
* **Manual Control**: Use different names (e.g., `mv {{old}} {{new}}`) to be prompted for each individual value.

### Community "Package Manager"
The `sync` command has been completely redesigned. 
* **`xc sync`**: Now pulls an interactive index from the community repository. You can discover, preview, and install curated vaults via `fzf` without needing to manually track remote filenames.
* **Expanded Vaults**: New curated vaults for Docker, Security Auditing, Nix, and Neovim are now available.
* **macOS Power Kit**: Massive thanks to the r/MacOS community for contributing the "Graybeard" BSD one-liners that make this the most comprehensive macOS vault in the engine.

### Core Improvements
* **Surgical Logic**: Refined string manipulation for faster placeholder swapping.
* **Duplicate Guards**: Improved logic to prevent identical commands from cluttering your vaults.

---

## Community Sync

Stop searching the web for the same syntax. XC-Manager now includes a built-in sync engine to pull curated, Arch Wiki-verified "Problem-Solution" vaults directly from this repository.

| Vault | Command | Description |
| :--- | :--- | :--- |
| **Arch Linux** | `xc sync arch` | Fixes for PGP keyrings, .pacnew merges, and kernel maintenance. |
| **Debian** | `xc sync debian` | Apt repository tracking, kernel upgrades, and package maintenance. |
| **Docker Dev** | `xc sync docker-dev` | Container lifecycle management and aggressive resource cleanup. |
| **Fedora** | `xc sync fedora` | DNF transaction history, security updates, and repository management. |
| **General Nix** | `xc sync general-nix` | Essential POSIX utilities for permissions, disk usage, and IO. |
| **Git Pro** | `xc sync git-pro` | Advanced recovery, reflog navigation, and surgical commit tools. |
| **Hyprland** | `xc sync hyprland` | Wayland specific fixes for NVIDIA, portals, and window rules. |
| **MacOS** | `xc sync macos` | High-utility BSD maintenance, Gatekeeper fixes, and hidden system tweaks |
| **Networking** | `xc sync networking` | Connectivity diagnostics, DNS lookups, and interface auditing. |
| **OpenSUSE** | `xc sync opensuse` | Zypper distribution upgrades, process tracking, and system repair. |
| **Security Audit** | `xc sync security-audit` | Local hardening, SUID discovery, and system integrity logs. |
| **Templates** | `xc sync templates` | Interactive snippets using placeholders for Git, SSH, and more. |
| **Vim/Neovim** | `xc sync vim-neovim` | High-speed motions, global search/replace, and health checks. |

---

## Features
* **Interactive Template Engine**: Support for {{placeholders}} that prompt for user input during execution. [v0.7.0]
* **Global Variable Mapping**: Identical placeholder names trigger a single prompt to save keystrokes. [v0.7.0]
* **Vault Package Manager**: Interactive sync interface to browse and download community-curated vaults. [v0.7.0]
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

### Requirements
* **zsh**
* **fzf**
* **sed** (The line-editor for deletions)
* **grep** (The standard search tool)

### Installation
**Clone the repository**:
```zsh
git clone https://github.com/Rakosn1cek/xc-manager.git
```
**Add to your ~/.zshrc**:
```zsh
# Add to function path and autoload
fpath=(/path/to/XC-Manager/autoload $fpath)
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
### Usage

**Community Sync (v0.7.0)**
* **Interactive Sync**: Run xc sync without arguments to browse and select from the community index via fzf.
* **Templates**: Run xc sync templates to download pre-configured interactive snippets for Git, SSH, and Docker.

**Interactive Templating (New in v0.7.0)**
* **Dynamic Prompts**: Save commands with {{var}} syntax. Selecting these will trigger interactive prompts for each unique variable.
* **Global Mapping**: Identical placeholder names (e.g., cp {{file}} {{file}}.bak) will only prompt you once and swap all instances globally.
* **Integration**: Placeholder logic is fully supported in both the standard TUI (Ctrl-G) and Global Search.
* **Safety Guard**: Hitting Enter on an empty prompt will cancel the execution, keeping your command line clean and preventing syntax errors.

**Community Sync (v0.6.0)**
XC-Manager now features a built-in sync engine to pull curated "Problem-Solution" vaults directly from the community repository.
* **Sync a Vault**: Run xc sync <category> (e.g., xc sync arch or xc sync hyprland).
* **Available Categories**: arch, hyprland, general-nix, git-pro, docker-dev, networking, vim-neovim, security-audit, templates.
* **Update**: Re-running sync will pull the latest verified fixes from the upstream repo.

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
* **Deduplication**: As of v0.6.1, redundant commands across multiple vaults are filtered out to reduce visual noise.
* **Safety First**: Global Search remains **Read-Only**. Because this search can pull from high-risk maintenance vaults (like `arch` or `security`), it serves as a reference to prevent accidental execution of sensitive commands.

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

### Configuration (Optional)
**Customize the look of your vault using Zsh's zstyle system**:
```zsh
zstyle ':xc:*' fzf_colors "gutter:-1,border:8,header:4,info:2,pointer:5,marker:13,fg+:7,prompt:5,hl:12"
```
### Recommended Integrations
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

[x] Community Sync Engine (v0.6.0): Built-in distribution system to pull curated, Wiki-verified vaults (Arch, Hyprland, Git, etc.) directly from GitHub.

[x] Dynamic Placeholders: Support for {{variable}} prompting within vaulted commands.

[ ] Encrypted Vaults: Support for gpg or age encrypted .txt files for sensitive commands.

[ ] Cross-Shell Research: Investigating a POSIX-compliant core for Bash and Fish support.

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
