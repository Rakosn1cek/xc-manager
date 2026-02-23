# XC-Manager 

A minimal, high-performance command vault for ZSH users. Stop searching through messy shell history; save the commands that actually work and retrieve them instantly.

## Features
* **Proactive Saving**: Run a command and save it immediately.
* **Retroactive Saving**: Save the last command you ran without retyping it.
* **FZF Integration**: Search your vault with fuzzy finding and live previews.
* **Ligature Friendly**: Uses standard ASCII `->` that renders as a sleek arrow in Nerd Fonts.

## Requirements:

**zsh**
**fzf**
**Nerd Font** (Optional, for the symbols)

## Installation:

### Option 1: The Easy Way (Recommended)

Clone this repo:
 
```zsh
git clone https://github.com/Rakosn1cek/xc-manager.git
```

Add this line to your ~/.zshrc:

```zsh
source ~/xc-manager/xc-manager.sh
```

Option 2: The Manual Way
If you don't want an extra file, you can simply copy the functions from xc-manager.sh and paste them directly into your ~/.zshrc.

## HISTORY SETTINGS (Ensures 'xc' can see previous commands)

```zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```
3. Reload your shell:

```zsh
source ~/.zshrc
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
