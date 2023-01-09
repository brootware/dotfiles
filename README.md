# dotfiles
My personal dotfiles

## How to use

Clone the repo. 

```zsh 
git clone https://github.com/brootware/dotfiles.git && cd dotfiles
```

Run the installation script. The install script will backup all your dotfiles from `$HOME` directory to `$HOME/originaldotfiles/` folder in case something goes wrong and install all the configurations.

```zsh
chmod +x installdotfiles.sh
./installdotfiles.sh
```

This has been tested on wsl2 running on windows 10 and should work on Mac too.