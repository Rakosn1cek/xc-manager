# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
