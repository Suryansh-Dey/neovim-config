# Setting up (linux)

Run the following command in your terminal

```terminal
mkdir ~/.config -p && cd ~/.config
mv nvim nvim-backup
git clone https://github.com/Suryansh-Dey/nvim-config.git
mv nvim-config nvim
```

**Note:** `mv nvim nvim-backup` might raise error if no nvim config file is already there but ignore that. Following command will still do the job

# Tip to find a keybinding

go to `~/.config/nvim/lua/core/mappings.lua` and `~/.config/nvim/lua/custom/mappings.lua`, and search for the action. You will probably get it's corresponding keybinding here.

# NVChad's default keymap changes

1. `Ctrl-n` -> `Alt+f` for file tree
2. `<leader>rn` renames an identifier instead of toggling relative line number
3. `<leader>ra` and `<leader>n` was removed. You need doctor if need keymap for toggling line numbers. You may just use command `:set nu!` for that if you feel crazy some day.
4. `<leader>v` and `<leader>h` was removed. Just use `<A-v>` and `<A-h>`.
