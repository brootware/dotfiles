# dotfiles 🧰

My personal dotfiles to automate installing all the aliases and zsh configurations on a fresh machine 💻.


## How to use

Install Zsh and OhMyZsh for Ubuntu

```bash
sudo apt install zsh curl git -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Homebrew for MacOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### To install the dotfiles

This will install the dotfiles from this repo to your `$HOME/` directory after making a backup.
Ensure you installed `curl` and `git` first and run the bootstrap installation script.

```bash
curl https://raw.githubusercontent.com/brootware/dotfiles/main/bootstrap.sh > bootstrap.sh && chmod +x bootstrap.sh
./bootstrap.sh -i
```

OR, you can download the git repo and install as instructed below.

```bash
# Clone dotfiles repo and navigate into it
git clone https://github.com/brootware/dotfiles.git && cd dotfiles

# Install dotfiles
./install
```

This has been tested on wsl2 running on windows 10 and should work on Mac too.

## Windows auto dark mode

You can import the XML configuration files in `win11AutoDarkMode/` folder to window task scheduler to turn on dark mode at 6:30pm and off at 7:00am.
