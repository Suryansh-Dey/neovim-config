# Setting up (linux)
Run the following command in your terminal
```terminal
mkdir ~/.config -p && cd ~/.config
mv nvim nvim-backup
git clone https://github.com/Suryansh-Dey/nvim-config.git
mv nvim-config nvim
```
**Note:** `mv nvim nvim-backup` might raise error if no nvim config file is already there but ignore that. Following command will still do the job
