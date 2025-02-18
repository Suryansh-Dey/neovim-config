![UI](https://github.com/user-attachments/assets/9b20431b-ab4d-4e61-b6c4-5b9519154623)

# Supported languages
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="5%"/> Python
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" width="5%"/> HTML
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg" width="5%"/> CSS
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="5%"/> JavaScript
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" width="5%"/> TypeScript
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
Same as Pre-requisites of [NvChad](https://nvchad.com/docs/quickstart/install)

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

*`mv` commnds might raise error if no nvim config file is already there but ignore that. Following command will still do the job!*  
Now run `:MasonInstallAll` command in neovim  
All done!!
# Tip to find a keybinding
Go to `~/.config/nvim/lua/mappings.lua`, and search for the action. You will probably get it's corresponding keybinding here.

OR just google or chatGPT like: *what is the NVChad keymap for opening terminal*. (Answer: *`A-i` for fullscreen and `A-v` or `A-h` for verticle and horizontal terminal*)

If you need some feature which is not available in NVChad by default, check `~/.config/nvim/lua/plugins/init.lua` with chatGPT. Probably you do have a plugin to get you cover. For eg. run `:MarkdownPreview` to preview markdown, thanks to "iamcco/markdown-preview.nvim" plugin.

# NVChad's default keymap changes
1. `Ctrl-n` -> `Alt+f` for file tree
2. `<leader>v` and `<leader>h` was removed. Just use `<A-v>` and `<A-h>`.

**NOTE**: The 'f' motion is remapped to `leap-forward` of leap plugin. *Just use 't' motion or 'f' with just one extra letter making you sure about the motion!*

## nvim-surround remaps
Since `s` is used for `leap-backward`, following remaps were done:
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
## nvim-tree remaps
1. `f` -> `<leader>f` since f is used for leap-forward
2. `s` -> `<leader>s` since s is used for leap-backward
# Daily usage
Refer to the [wiki](https://github.com/Suryansh-Dey/neovim-config/wiki) tab to know how I use it to be blazingly fast!
