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
Usage: show_help [-i] [-s] [-h]
  -i   Backs up your original dotfiles and installs new ones.
  -s   Save current dotfiles as new configurations
  -h   Show this help menu
```

### To install the dotfiles

This will install the dotfiles from this repo to your `$HOME/` directory.

```zsh
./installdotfiles.sh -i
```

### To save the current dotfiles config as new installation files

This will save the current dotfiles as new installation files in `dotfilestoinstall/` directory of the repo.

```zsh
./installdotfiles.sh -s
```

This has been tested on wsl2 running on windows 10 and should work on Mac too.

## Windows auto dark mode

You can import the XML configuration files in `win11AutoDarkMode/` folder to window task scheduler to turn on dark mode at 6:30pm and off at 7:00am.