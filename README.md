![Modern UI with git integration](https://github.com/user-attachments/assets/269a7232-c476-4d92-a64d-be19635df1c3)
A fully-featured, blazing-fast Neovim setup designed for modern developers with multi-cursor support. This configuration integrates the latest plugins, a sleek UI, and more—built on top of [NvChad](https://nvchad.com) for maximum efficiency.

# Supported languages
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="5%"/> Python
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" width="5%"/> HTML
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg" width="5%"/> CSS
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original.svg" width="5%"/>Tailwindcss
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" width="5%"/> TypeScript
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg" width="5%"/> React
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" width="5%"/> C++
<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/rust-lang/www.rust-lang.org/master/static/images/rust-social-wide-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/rust-lang/www.rust-lang.org/master/static/images/rust-social-wide-light.svg">
    <img alt="The Rust Programming Language: A language empowering everyone to build reliable and efficient software"
         src="https://raw.githubusercontent.com/rust-lang/www.rust-lang.org/master/static/images/rust-social-wide-light.svg"
         width="10%">
  </picture> Rust
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/lua/lua-original.svg" width="5%"/> Lua

**Markdown**, **JSON**
# Pre-requisites
- gcc/g++
- npm
- Pre-requisites of [NvChad](https://nvchad.com/docs/quickstart/install)

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
Now run `:MasonInstallAll` command in neovim  
All done!! *Refer [troubleshooting](https://github.com/Suryansh-Dey/neovim-config/wiki/Troubleshooting) for help.*
# Tip to find a keybinding
Go to `~/.config/nvim/lua/mappings.lua`, and search for the action. You will probably get it's corresponding keybinding here.
- `desc` tells what this key binding does so you can search using `/` to get related keybinding.
- The second argument of `map` represents the key stoke needed for the action.

OR just google or chatGPT like: *what is the NVChad keymap for opening terminal*. (Answer: *`A-i` for full screen and `A-v` or `A-h` for vertical and horizontal terminal*)

If you need some feature which is not available in config already, just open an [GitHub issue](https://github.com/Suryansh-Dey/neovim-config/issues)! I love configuring neovim and maintaining this repository.

# Default keymap changes
1. The `s` motion is remapped to *flash-jump*.
2. The `m` key is remapped to *Ctrl-o*. Use `<leader>m` for mark.
3. The `M` key is remapped to *Ctrl-i*.

## NVChad's default keymap changes
1. `Ctrl-n` -> `Alt+f` for file tree
2. `<leader>q` -> `<leader>lq` to put diagnostics in location list.
3. `<leader>ph` -> `<leader>gh` to see git change.
4. `<leader>pt` -> `<leader>ft` to find terminal.
5. `<leader>x` -> `Alt-x` to close buffer.
6. `]c` -> `]h` to jump to next hunk.
7. `[c` -> `[h` to jump to previous hunk.

### nvim-surround remaps
Since `s` is used for *flash-jump*, following remaps were done:
``` lua
{
normal = "<leader>s", --"ys"
normal_cur = "<leader>ss", --"yss"
normal_line = "<leader>S", --"yS"
normal_cur_line = "<leader>SS", --"ySS"
delete = "d<leader>", --"ds"
change = "c<leader>", --"cs"
}
```
### nvim-tree remaps
2. `s` -> `<leader>s` since s is used for *flash-jump*
# Daily usage
Refer to the [wiki](https://github.com/Suryansh-Dey/neovim-config/wiki/Key-bindings-to-get-started) tab to know how I use it to be blazingly fast!
