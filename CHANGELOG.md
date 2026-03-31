# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.1] - 2026-03-31
### Fixed
- Resolved an issue where placeholders ({{variable}}) were injected into the ZLE buffer without user input.
- Switched to a direct TTY read method to ensure interactive prompts work correctly within Zsh widgets.
- Improved trailing whitespace trimming for vault commands.

## [0.7.0] - 2026-03-27

### Added
- **Interactive Template Engine**: Support for `{{placeholder}}` syntax in vaulted commands.
- **Global Variable Swapping**: Logic to detect matching placeholder names and prompt the user only once per unique variable.
- **Interactive Sync List**: `xc sync` now fetches an `index.txt` and provides an `fzf` interface for vault discovery.
- **New Community Vaults**: Added `docker-dev`, `security-audit`, `vim-neovim`, `git-pro`, and `templates`.

### Changed
- **LBUFFER Integration**: Updated `list` and `search` functions to process placeholders before sending commands to the Zsh Line Editor.
- **Help Menu**: Expanded the help output to include a "Templating" guide and updated command descriptions.
- **Sync Logic**: Standardised on `.txt` extensions for all remote vault files to ensure predictable downloads.

### Fixed
- Fixed a bug where `search` would accidentally include vault descriptions in the placeholder processing logic.
- Improved the duplicate guard to handle semantic spacing variations in commands.

---

## [0.6.2] - 2026-03-23
### Added
- Implemented Zsh-native semantic normalization using (z) and (j: :) expansion to collapse extra spaces in captured commands.

### Fixed
- Updated duplicate guard to use anchor-based grep (^cmd ->), fixing a bug where existing commands with descriptions weren't being caught as duplicates.
- Fixed a variable mismatch in the add function to ensure it correctly references the active vault file path.

---

## [0.6.1] - 2026-03-20
### Fixed
- **Duplicate Prevention**: Added a literal string guard (`grep -Fxq`) to prevent saving the same command multiple times into a single vault.
- **Global Search Noise**: Implemented `awk` deduplication in the Global Search (`Ctrl+A`) to ensure unique commands across overlapping vaults.

### Changed
- **Global Search Policy**: Reinforced "Read-Only" mode for Global Search as a safety measure to prevent accidental buffer injection of sensitive maintenance commands.

---

## [0.6.0] - 2026-03-20
### Added
- **Vault Sync Engine**: Integrated `xc sync` to pull remote definitions from GitHub.
- **Power Library**: 8 new community-curated vaults (Arch, Hyprland, Git, Docker, etc.).
- **Zsh/Fzf Protocol**: Optimized `LBUFFER` handling for synced command execution.

### Fixed
- Resolved ordering issue where descriptions were appearing before commands in synced files.
- Hardened `xc use` to prevent directory traversal when switching vaults.

---

## [0.5.3-beta] - 2026-03-17

### Added
- **xc alias**: New command to promote any vaulted entry to a permanent Zsh alias in ~/.local/share/xc/aliases.zsh.
- **xc search**: Global search functionality to query all .txt vaults simultaneously using fzf and grep.
- **xc --help**: Integrated help menu with command usage and option flags.
- **Argument Routing**: Refactored the main logic to correctly handle list, select, and add without overlapping.

### Fixed (Critical)
- **TTY State Recovery**: Resolved a major regression where the terminal remained in raw mode after fzf exited. Replaced stty echo with stty sane in the ZLE widget to restore the kernel line discipline.
- **Backspace/Enter Unresponsiveness**: Fixed the "Dead Key" bug by ensuring the terminal returns to canonical mode after TUI interactions.
- **Input Buffer Contamination**: Implemented a TTY "drain" loop (read -t 0.05) to prevent ghost \n characters from skipping the Description prompt after a selection.

### Changed
- **Default Behavior**: Running xc with no arguments now consistently grabs the last executed command from history.
- **Version Tracking**: Updated internal variables and help output to reflect v0.5.3-beta.

---

## [0.5.0-beta] - 2026-03-09

### Major Features
- **Alias Export Engine**: Convert any saved command into a permanent Zsh alias with `Alt-E`.
- **Modular Storage**: Support for `~/.zsh_aliases` to keep your `.zshrc` clean.
- **User Choice**: New environment variable XC_ALIAS_TARGET allows users to choose where aliases are saved.
- **Safety First**: Built-in Collision Detection prevents overwriting system commands or existing aliases.
- **Visual Feedback**: Restored terminal echo during alias naming to prevent typos.

### Fixed
- **Terminal Echo Visibility**: Restored `stty echo` during the alias naming process so users can see what they are typing without exiting the TUI.
- **String Parsing**: Resolved an issue where trailing comments in the alias file would break the shell's ability to source the alias.

### Improved
- **Marker System**: Aliases are neatly grouped under a # --- XC-Manager Aliases --- header.
- **Instant Activation**: New aliases are available in the current session immediately after creation.

---

## [0.4.0-beta] - 2026-03-05

### Added
- **Global Search Mode**: Toggle between active vault and global view using Ctrl-A and Ctrl-R.
- **Dynamic TUI Headers**: The header now updates in real-time to show available actions based on search mode.
- **Read-Only Safety**: Deletion is automatically disabled in Global Search to protect data across vaults.

---

## [0.3.0-beta] - 2026-03-02

### Added
- **Multi-Vault System**: Introduced the ability to switch between different command silos (e.g., work, home, projects).
- **Contextual State Tracking**: Added a state tracker in ~/.cache/xc_active_vault to persist the active vault across terminal sessions.
_ **Smart Switcher**: New xc use <name> command to list, create, and switch between vaults.
- **TUI Awareness**: The Ctrl+G widget now displays the active vault name in the header and dynamically loads the correct source file.
- **Visual Active Indicator**: The xc use list now marks the current vault with an asterisk (*) and an (active) label.

### Changed
- **Directory Migration**: Moved vault storage from ~/.local/share/cmd_vault.txt to a dedicated directory at ~/.local/share/xc/.
- **Code Optimization**: Replaced external calls to ls and sed in the core logic with native Zsh globbing (*.txt(N)) and string modifiers (${f:t:r}).
- **Improved Error Handling**: Added checks to ensure the vault directory and state files exist before execution, preventing shell hangs.

## Fixed
- Fixed a parse error in the if/elif chain where extra fi tags were breaking the command logic.
- Resolved an issue where the fzf-vault-widget would fail if the default vault file was missing.

---

## [0.2.3-beta] - 2026-03-01

### Added
- **The Time Machine (`xc select`)**: New history selector using `fzf` to pick from the last 100 shell commands.
- **Intelligent Cleanup (`xc clean`)**: Maintenance command to scrub duplicates and "ghost" entries.
- **Transparent Logging**: Real-time terminal output during cleanup showing exactly which lines were removed.
- **Command Preview**: The `Ctrl+G` widget now features a bottom-window preview of the raw command.

### Changed
- **Pure Zsh Architecture**: Core logic rewritten to use native Zsh associative arrays, removing `awk` dependencies.
- **TUI Prioritization**: The vault list now displays Descriptions first for better scannability.
- **Variable Scoping**: Improved local variable handling within the `autoload` environment.

---

## [0.2.2-beta] - 2026-02-15

### Added
- **Live Deletion**: Support for `Alt-D` inside the TUI to remove entries without closing the window.
- **Custom Vault Path**: Support for `XC_VAULT_PATH` environment variable.
- **Surgical Initialization**: `xc init` now uses `touch -a` to preserve timestamps.

### Fixed
- **Off-by-One Error**: Resolved a line-indexing bug where the wrong command was deleted during filtering.
- **Search-Safe Deletion**: Integrated `{n}` index targeting for absolute deletion accuracy.

---

## [0.2.1-beta] - 2026-02-01

### Added
- **Instant Loading**: Implemented Zsh `autoload` pattern for zero-impact shell startup.
- **Theme Support**: Integrated `zstyle` hooks for custom `fzf` color schemes.

---

## [0.1.1-beta] - 2026-01-20

### Fixed
- **Truncation Bug**: Resolved issue where commands with multiple spaces were cut off in previews.

### Changed
- **Dependency Reduction**: Removed early `sed` requirements in favor of pure string expansion.

---

## [0.1.0-alpha] - 2026-01-14

### Added
- **Initial Release**: Basic command vaulting, history capture, and `fzf` search.
