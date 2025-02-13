# Pre-requisites
Same as Pre-requisites of [NVChad](https://nvchad.com/docs/quickstart/install)

# Setting up
Run the following command in your terminal
<details>
<summary>Linux</summary>

```terminal
mv ~/.config/nvim ~/.config/nvim-backup
mv ~/.local/share/nvim ~/.local/share/nvim-backup
git clone https://github.com/Suryansh-Dey/nvim-config.git ~/.config/nvim
```
</details>
<details>
<summary>Windows</summary>

```terminal
mv $HOME/AppData/Local/nvim $HOME/AppData/Local/nvim-backup
mv $HOME/AppData/Local/nvim-data $HOME/AppData/Local/nvim-data-backup
git clone https://github.com/Suryansh-Dey/nvim-config.git $HOME/AppData/Local/nvim
```
</details>

**Note:** `mv` commnds might raise error if no nvim config file is already there but ignore that. Following command will still do the job!

# Tip to find a keybinding
Go to `~/.config/nvim/lua/mappings.lua`, and search for the action. You will probably get it's corresponding keybinding here.

OR just google or chatGPT like: *what is the NVChad keymap for opening terminal*. (Answer: *`A-i` for fullscreen and `A-v` or `A-h` for verticle and horizontal terminal*)

If you need some feature which is not available in NVChad by default, check `~/.config/nvim/lua/custom/plugins.lua` with chatGPT. Probably you do have a plugin to get you cover. For eg. run `:MarkdownPreview` to preview markdown, thanks to "iamcco/markdown-preview.nvim" plugin.

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
