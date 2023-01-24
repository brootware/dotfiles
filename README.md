# dotfiles 🧰

My personal dotfiles to automate installing all the aliases and zsh configurations on a fresh machine 💻.


## How to use

Clone the repo. 

```zsh 
git clone https://github.com/brootware/dotfiles.git && cd dotfiles
```

Run the installation script.

```zsh
chmod +x installdotfiles.sh
./installdotfiles.sh
```

Help menu will be shown as below.

```zsh
Usage: show_help [-b] [-i] [-c] [-h]
  -b   Backup original dotfiles
  -i   Install dotfiles
  -c   Backup current config
  -h   Show this help menu
```

### To back up your original dotfiles

This will back up your original dotfiles in `originaldotfiles/` folder in your home directory.

```zsh
./installdotfiles.sh -b
```

### To install the dotfiles

This will install the dotfiles from this repo to your `$HOME/` directory.

```zsh
./installdotfiles.sh -i
```

This has been tested on wsl2 running on windows 10 and should work on Mac too.