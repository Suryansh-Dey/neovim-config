<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c8595cd0-8c76-414d-849b-2732a0964928" />

A dead minimal (by look) but extremely powerful configuration, helping you at work instead of distracting you from work.

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
- **Blazingly fast**: Use nvim-treesitter new main branch which uses built in treesitter from nvim core. Making it fastest!
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
- **Firenvim**: Embed Neovim in your browser text areas

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
- **tree-sitter-cli**: **Necessary** for tree-sitter syntax highlighting to work
- **gcc/g++**: For C/C++ compilation
- **npm**: For markdown-preview plugin and other Node.js tools
- **cargo**: For Rust development (optional, if using Rust)
- **live-server**: For HTML live preview (optional, install via npm: `npm install -g live-server`)
- **unizp**: Used by many plugins

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

After installation, run `:MasonToolsInstall` command in neovim to install LSP and tools.  
Then run `TSInstallAll` to install treesitter parser.

All done!! *Refer [troubleshooting](https://github.com/Suryansh-Dey/neovim-config/wiki/Troubleshooting) for help.*

## Configuration Details
- **Leader Key**: `<Space>` (spacebar)
- **Auto-complete**: Use `<Enter>` to take completion, `<TAB>` to activate or cycle through options. If you want auto show options, comment this line
https://github.com/Suryansh-Dey/neovim-config/blob/ab458b096a785d7e105dd67ea075b849e1e8bd47/lua/plugins/blink.lua?plain=1#L47
- **Session Management**: Auto-session saves your workspace automatically (excludes home, Projects, Downloads directories)
- **Snippets**: Custom snippets available for C++, JavaScript, and TypeScript (located in `~/.config/nvim/snippets/` directory)

# Keybindings

All daily keybindings, custom ergonomic remaps, and plugin shortcuts are comprehensively documented in:
👉 **[Key bindings to get started](https://github.com/Suryansh-Dey/neovim-config/wiki/Key-bindings-to-get-started)**

### Discovering Keymaps Inside Neovim
- Press `<leader>wK` to open **WhichKey** and browse all registered shortcuts.
- Press `<leader>wk` to look up keymaps by prefix.
- Search `lua/mappings.lua` directly for any specific custom action.

If you need a feature or mapping that is not available yet, feel free to open a [GitHub issue](https://github.com/Suryansh-Dey/neovim-config/issues)!

