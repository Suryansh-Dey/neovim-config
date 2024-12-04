# Setting up (linux)

Run the following command in your terminal

```terminal
mkdir ~/.config -p && cd ~/.config
mv nvim nvim-backup
git clone https://github.com/Suryansh-Dey/nvim-config.git
mv nvim-config nvim
```

**Note:** `mv nvim nvim-backup` might raise error if no nvim config file is already there but ignore that. Following command will still do the job

# NVChad's default keymap changes

1. `Ctrl-n` -> `Alt+f` for file tree
2. `<leader>rn` renames an identifier instead of toggling relative line number
3. `<leader>n` was remove. WHY THE FUCK YOU NEED A KEY BINDING TO TOGGLE LINE NUMBER? You may just use command `:set nu!` for that if you feel crazy some day.
