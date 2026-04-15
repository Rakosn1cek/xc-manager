
## XC - command vault manager
**Version: 0.9.0**

[![Awesome Zsh Plugins](https://img.shields.io/badge/Awesome-Zsh%20Plugins-brightgreen)](https://github.com/unixorn/awesome-zsh-plugins)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/shell-zsh-brightgreen.svg)](https://github.com/Rakosn1cek/xc-manager)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Rakosn1cek/xc-manager)](https://github.com/Rakosn1cek/xc-manager/releases)

![XC-Manager TUI](https://github.com/Rakosn1cek/xc-manager/blob/main/preview-2.png)

**XC in Action:**
<p align="center">
  <video src="https://github.com/user-attachments/assets/d67640fb-4e9e-4d36-b7a1-d588a24ab9a6" width="700" controls muted autoplay loop>
    Your browser does not support the video tag.
  </video>
</p>

XC is a lightweight, Zsh-native vault manager for command execution. It’s for anyone who live in the CLI and need a fast, searchable, and now secure way to manage their most important one-liners. No bloat, no complex dependencies. Just your commands, vaulted.

**Status:** Feature Complete [v0.9.0]
XC command vault manager has officially reached its feature-complete milestone. All planned functionality, including template engines, global search, and GPG security, is now implemented and stable.

**Recent Fixes & Updates** [0.9.0]
- **Vault Security**: Integrated GPG symmetric encryption. Use `xc lock` and `xc unlock` to protect sensitive commands, API keys, and environment variables.
- **Pre-flight Safety**: Added extension-aware logic to prevent accidental operations on encrypted vaults.
- **Raw Input Capture**: Added `xc add --raw` to handle complex commands. This bypasses shell evaluation, allowing you to save `curl`, `jq`, and nested subshells exactly as they are written without the shell stripping quotes or expanding variables.
- **Community Vaults**: Expanded the curated collection via `xc sync`. All community vaults now contain at least 50 useful commands and strings.

---

**Installation:**

Arch Linux (AUR)
`yay -S xc-manager-git`

**Manual Installation**
Clone the repository:
`git clone https://github.com/Rakosn1cek/xc-manager.git ~/.zsh-plugins/xc-manager`

**Add to ~/.zshrc:**
```zsh
source ~/.zsh-plugins/xc-manager/xc.plugin.zsh
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
```

**All distros including MacOS**
```zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```
**Optional UI Customisation**
```zsh
zstyle ':xc:*' separator "->" 
zstyle ':xc:*' fzf_colors "fg:7,hl:4,fg+:15,hl+:12,info:2,prompt:5,pointer:12"
```

**Initialise (First time only):**
`xc init`

---

**Dependencies:**

To ensure all features work as intended, make sure the following are installed:

- **Zsh**: The core shell environment (version 5.8+ recommended).
- **fzf**: Powering the fuzzy search and interactive selection.
- **GnuPG**: Required for the `lock` and `unlock` encryption features.
- **curl**: Necessary for synchronising community vaults via `xc sync`.

**Arch Linux:**
```zsh
pacman -S zsh fzf gnupg curl
```
---

**Community Sync:**
Pull any curated, Arch Wiki-verified "Problem-Solution" vaults directly from the repository.

| Vault | Command | Description |
| :--- | :--- | :--- |
| **Arch Linux** | `xc sync arch` | Fixes for PGP keyrings, .pacnew merges, and kernel maintenance. |
| **Cloud** | `xc sync cloud` | Multi-cloud session handling and general CLI authentication tools. |
| **Debian** | `xc sync debian` | Apt repository tracking, kernel upgrades, and package maintenance. |
| **Digital Ocean** | `xc sync digital-ocean` | Droplet lifecycle, block storage, and Kubernetes cluster management. |
| **Docker Dev** | `xc sync docker-dev` | Container lifecycle management and aggressive resource cleanup. |
| **Fedora** | `xc sync fedora` | DNF transaction history, security updates, and repository management. |
| **General Nix** | `xc sync general-nix` | Essential POSIX utilities for permissions, disk usage, and IO. |
| **Git Pro** | `xc sync git-pro` | Advanced recovery, reflog navigation, and surgical commit tools. |
| **Hyprland** | `xc sync hyprland` | Wayland specific fixes for NVIDIA, portals, and window rules. |
| **Linux Mint** | `xc sync linux-mint` | Mint-specific update management and desktop environment tools. |
| **MacOS** | `xc sync macos` | High-utility BSD maintenance, Gatekeeper fixes, and hidden system tweaks. |
| **Networking** | `xc sync networking` | Connectivity diagnostics, DNS lookups, and interface auditing. |
| **OpenSUSE** | `xc sync opensuse` | Zypper distribution upgrades, process tracking, and system repair. |
| **Oracle Cloud** | `xc sync oracle-cloud` | Compute instance launching, VCN networking, and object storage. |
| **Pentesting** | `xc sync pentesting` | Web fuzzing, exploit database searches, and network enumeration. |
| **Security Audit** | `xc sync security-audit` | Local hardening, SUID discovery, and system integrity logs. |
| **Sysadmin** | `xc sync sysadmin` | System load monitoring, user management, and log filtering. |
| **Templates** | `xc sync templates` | Interactive snippets using placeholders for Git, SSH, and more. |
| **Ubuntu** | `xc sync ubuntu` | Snap package management, PPA handling, and HWE support status. |
| **Vim/Neovim** | `xc sync vim-neovim` | High-speed motions, global search/replace, and health checks. |

---

**Features:**
- Template Engine: Support for {{placeholders}} with interactive prompts.
- Alias Export: Convert any vaulted command into a permanent Zsh alias with `Alt+E`.
- Global Search: Toggle between local vault and global search using Ctrl+A and `Ctrl+R`.
- Proactive Saving: Run `xc` to save the command you just executed.
- FZF Integration: Fuzzy search with live previews.
- Distro Agnostic: Works on Arch, Fedora, Debian, and macOS.
- Vault Security: Symmetric GPG encryption to protect sensitive commands and API keys.
- Save commands with {{variables}} to create templates. XC prompts for input during execution.
- Global Swap: Using the same name (e.g. cp {{file}} {{file}}.bak) prompts once and updates all instances.
- Individual Control: Use unique names (e.g. mv {{old}} {{new}}) to prompt for each value separately.

---

**Usage Guide:**

- Launch TUI: Press Ctrl+G anywhere in your terminal.
- Switch Vault: Use `xc use <name>` to change your active context (e.g. xc use work).
- List Vaults: Run `xc list` to see your available vault files.
- Delete Entry: Press `Alt+D` inside the TUI.
- Global Search: Press `Ctrl+A` to search across all vaults inside the TUI.
- Create Aliases: Select command to export -> press `Alt+E` -> Enter alias name -> Save 
- Sync Vaults: Run `xc sync` to browse the community index.
- Save Command: Run `xc` after successful command -> Enter descriptions -> Save
- Select Command from History: Run `xc select` -> choose command to save -> Enter descriptions -> Save
- Capture Raw Text: Run `xc add --raw` -> paste complex command -> Press Enter -> then `Ctrl+D` to enter descriptions -> Save
- Check Version: Run `xc -v` 

**Security & Encryption**
- For vaults containing sensitive environment variables, API keys, or internal IPs, XC now supports symmetric encryption via GPG.
- Lock a vault: `xc lock` encrypts the active vault and removes the plain text file.
- Unlock a vault: `xc unlock` restores the vault to plain text for editing/searching.
- Protection: XC will automatically block search and add operations if a vault is locked, preventing binary data corruption or accidental plain text writes.

> *Note 1:
Aliases are saved by default to ~/.zsh_aliases. If you prefer to save them directly into your main config file, add this to your .zshrc:
`export XC_ALIAS_TARGET="$HOME/.zshrc"`
Vaults are saved by default in `$HOME/.local/share/xc`.
The active state (which vault you are currently using) is tracked in `$HOME/.cache/xc_active_vault`*

> *Note 2:
**Optional Integrations**
Alias Browser (als)
If you want an easy way to browse and run your newly created aliases using `fzf`, Check out my show-aliases.sh script.
It searches both your .zshrc and .zsh_aliases to give you a unified, interactive menu.
View Script: on GitHub [Show-Aliases Script](https://github.com/Rakosn1cek/dotfiles-rk1/tree/main/shell-common/custom-scripts/Show-Aliases)*

---

**Roadmap**

[x] Community Sync Engine

[x] Dynamic Placeholders

[x] Encrypted Vaults (GPG/age support)

**Long-term research**

[ ] Cross-Shell Research (Bash/Fish wrappers)

> **Note:** I have reached the original goals for this project and will not be personally pursuing cross-shell support. If you are interested in implementing Bash or Fish wrappers, contributions and PRs are welcome.

**License**
Distributed under the MIT License. See LICENSE for more information.

**Support & Feedback**
- Bug Reports: If something isn't working, please open an [Issue](https://github.com/Rakosn1cek/XC-Manager/issues).
- Feature Ideas: To discuss the roadmap or suggest a polish, head over to the[Discussions](https://github.com/Rakosn1cek/XC-Manager/discussions) tab.
- Community Snippets: Have a complex one-liner you've vaulted? Share it in the "Show and Tell" discussion.

If XC-Manager has made your CLI life easier, consider giving it a star on GitHub! It helps other developers find the tool.

[⭐ Star XC on GitHub](https://github.com/Rakosn1cek/XC-Manager)
