<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c8595cd0-8c76-414d-849b-2732a0964928" />

A dead minimal but extremely powerful configuration, helping you at work instead of distracting you from work.

# Supported languages

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="5%"/> **Python** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" width="5%"/> **HTML** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg" width="5%"/> **CSS** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original.svg" width="5%"/> **Tailwindcss** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" width="5%"/> **TypeScript** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="5%"/> **JavaScript** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" width="5%"/> **C++** 
<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/rust-lang/www.rust-lang.org/master/static/images/rust-social-wide-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/rust-lang/www.rust-lang.org/master/static/images/rust-social-wide-light.svg">
    <img alt="The Rust Programming Language: A language empowering everyone to build reliable and efficient software"
         src="https://raw.githubusercontent.com/rust-lang/www.rust-lang.org/master/static/images/rust-social-wide-light.svg"
         width="10%">
  </picture> **Rust** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" width="5%"/> **Java** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/lua/lua-original.svg" width="5%"/> **Lua** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg" width="5%"/> **React** 
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg" width="5%"/> **C** 

**Markdown** (with preview), **JSON**

# Features

## Core Features
- **LSP Support**: Full language server protocol support with auto-installation via Mason
- **Treesitter**: Advanced syntax highlighting and text objects
- **Auto-session**: Automatically saves and restores your editing sessions
- **Flash.nvim**: Smart cursor jumping for fast navigation
- **Blink.cmp**: Fast and intelligent code completion
- **Neo-tree**: Modern file explorer with git integration
- **Telescope**: Powerful fuzzy finder for files, buffers, grep, and more
- **Git Integration**: Gitsigns for inline git diff indicators and git operations
- **Terminal Integration**: Nvterm with toggleable vertical/horizontal/floating terminals
- **Multi-cursor**: Efficient multi-cursor editing support
- **Auto-pairs**: Automatic bracket/parenthesis pairing
- **Comment Toggle**: Easy commenting with context-aware comment strings
- **Tokyo Night Theme**: Beautiful color scheme with custom highlights
- **Lualine**: Minimal and fast statusline

## Code Execution
Built-in executors for quick code execution:
- **Python**: `python <file>`
- **JavaScript/TypeScript**: `node <file>`
- **C++**: Compiles with debug flags and runs (supports input.txt/output.txt)
- **C**: Compiles and runs
- **Rust**: `cargo run` and `cargo test`
- **HTML**: Live server
- **Java**: Direct execution

Use `<leader>Xi`, `<leader>Xv`, or `<leader>Xh` to execute in floating, vertical, or horizontal terminal respectively.
Use `<leader>xi`, `<leader>xv`, or `<leader>xh` for test execution (where applicable).

# Pre-requisites
- **gcc/g++**: For C/C++ compilation
- **npm**: For markdown-preview plugin and other Node.js tools
- **cargo**: For Rust development (optional, if using Rust)
- **live-server**: For HTML live preview (optional, install via npm: `npm install -g live-server`)

# Installation
Run the following command in your terminal
<details>
<summary>Linux</summary>
<details>
<summary>Clean cache of old setup</summary>
    
 ```bash
 rm -rf ~/.local/state/nvim
 rm -rf ~/.local/share/nvim
 ```
</details>

```bash
mv ~/.config/nvim ~/.config/nvim-backup
mv ~/.local/share/nvim ~/.local/share/nvim-backup
git clone https://github.com/Suryansh-Dey/neovim-config.git ~/.config/nvim && nvim
```
</details>
<details>
<summary>Windows</summary>
In powershell
<details>
<summary>Clean cache of old setup</summary>
    
```powershell
rm -Force $HOME\AppData\Local\nvim-data
```
</details>

```powershell
mv $HOME/AppData/Local/nvim $HOME/AppData/Local/nvim-backup
mv $HOME/AppData/Local/nvim-data $HOME/AppData/Local/nvim-data-backup
git clone https://github.com/Suryansh-Dey/neovim-config.git $HOME/AppData/Local/nvim && nvim
```
</details>

*`mv` commands might raise error if no nvim config file is already there but ignore that. Following command will still do the job!*

After installation, run `:MasonToolsInstall` command in neovim to install all LSP servers and tools.

All done!! *Refer [troubleshooting](https://github.com/Suryansh-Dey/neovim-config/wiki/Troubleshooting) for help.*

## Configuration Details
- **Leader Key**: `<Space>` (spacebar)
- **Lazy Loading**: Plugins are loaded on-demand for optimal performance
- **Session Management**: Auto-session saves your workspace automatically (excludes home, Projects, Downloads directories)
- **Snippets**: Custom snippets available for C++, JavaScript, and TypeScript (located in `snippets/` directory)

# Tip to find a keybinding
Go to `~/.config/nvim/lua/mappings.lua`, and search for the action. You will probably get it's corresponding keybinding here.
- `desc` tells what this key binding does so you can search using `/` to get related keybinding.
- The second argument of `map` represents the key stoke needed for the action.

If you need some feature which is not available in config already, just open an [GitHub issue](https://github.com/Suryansh-Dey/neovim-config/issues)! I love configuring neovim and maintaining this repository.

# Default keymap changes
1. The `s` motion is remapped to *flash-jump* (smart cursor jumping).
2. The `J` key is remapped to *Ctrl-e* (scroll to down).
3. The `K` key is remapped to *Ctrl-y* (scroll to up).
4. The `H` key is remapped to *K* (shows documentation).
5. The `L` key is remapped to *J* (concatenate lines).
6. The `U` key is remapped to *Ctrl-r* (redo).
7. Use `<leader>m` for setting marks (since `m` is used for surround).

### nvim-surround remaps
Since `s` is used for *flash-jump*, following remaps were done:
``` lua
{
normal = "m",        -- Add surround (original: "ys")
normal_cur = "M",     -- Add surround to current line (original: "yss")
visual = "m",         -- Add surround in visual mode
visual_line = "M",    -- Add surround in visual line mode
delete = "md",        -- Delete surround (original: "ds")
change = "mc",        -- Change surround (original: "cs")
}
```

### neo-tree remaps
- `s` -> triggers *flash-jump* (since `s` is used for flash-jump globally)
- `<leader>s` -> system open (open file with system default application)

### Blink.cmp remaps
- `<Tab>` -> opens and cycles through completion menu
- `<S-Tab>` -> cycles backward through completion menu
- `<CR>` -> accepts completion (with smart handling for ambiguous completions)

# Common Keybindings

## Navigation
- `<leader>ff` - Find files
- `<leader>fa` - Find all files (including hidden)
- `<leader>fw` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fo` - Find oldfiles
- `<leader>fz` - Fuzzy find in current buffer
- `s` - Flash jump (smart cursor jumping)
- `<C-h/j/k/l>` - Navigate between windows
- `<Tab>` / `<S-Tab>` - Cycle through buffers

## File Management
- `<A-f>` - Toggle file tree (neo-tree)
- `<leader>e` - Focus file tree
- `<leader>b` - New buffer
- `<M-x>` - Close buffer
- `<leader>a` - Switch to previous buffer
- `<leader>1-9` - Jump to buffer by number

## Git
- `]g` / `[g` - Jump to next/prev git hunk
- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gd` - Preview hunk
- `<leader>gb` - Blame line
- `<leader>gc` - Git commits
- `<leader>gt` - Git status

## Code Actions
- `<leader>/` - Toggle comment
- `<C-s>` - Format and save
- `<leader>ct` - Set filetype for LSP
- `gcc` - Toggle comment on current line
- `gbc` - Toggle block comment

## Terminal
- `<A-v>` - Toggle vertical terminal
- `<A-h>` - Toggle horizontal terminal
- `<A-i>` - Toggle floating terminal
- `<leader>v` - New vertical terminal
- `<leader>h` - New horizontal terminal
- `<C-x>` - Exit terminal mode

## Other
- `<leader>y` - Clipboard history
- `<leader>Y` - Clipboard history (system clipboard)
- `<leader>wK` - Show all keybindings (which-key)
- `<Esc>` - Clear search highlights

# Daily usage
Refer to the [wiki](https://github.com/Suryansh-Dey/neovim-config/wiki/Key-bindings-to-get-started) tab to know how I use it to be blazingly fast!
