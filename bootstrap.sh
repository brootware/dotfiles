#!/bin/bash

function install_dotfiles {
  rm -rf $HOME/orignaldotfiles
  mkdir $HOME/orignaldotfiles
  mv $HOME/.aliases $HOME/orignaldotfiles/.
  mv $HOME/.bashrc $HOME/orignaldotfiles/.
  mv $HOME/.zshrc $HOME/orignaldotfiles/.
  mv $HOME/.vimrc $HOME/orignaldotfiles/.
  mv $HOME/.gitconfig $HOME/orignaldotfiles/.
  echo "Current dotfiles have been backed up to originaldotfiles/ folder in home directory."

  # Clone zsh-autosuggestion repo into local zsh plugin directory for use
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

  # Clone dotfiles repo and navigate into it
  git clone https://github.com/brootware/dotfiles.git && cd dotfiles

  OSKIND=$(grep '^NAME\|^VERSION' /etc/os-release | sed 's/.*=//' | head -1)
  if [[ "$OSKIND" == *"Darwin"* ]]; then
    # macOS specific
    brew install ansible
    ansible-playbook dotbootstrap/mac_setup.yml --ask-become-pass 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  elif [[ "$OSKIND" == *"Ubuntu"* ]] || [[ "$OSKIND" == *"Linux Mint"* ]]; then
	  sudo apt-get install -y ansible
    ansible-playbook dotbootstrap/debian_linux_setup.yml --ask-become-pass
  elif [[ "$OSKIND" == *"Fedora"* ]]; then
	  sudo dnf install -y ansible
	  ansible-playbook dotbootstrap/linux_baseline.yml --ask-become-pass
    ansible-playbook dotbootstrap/rpm_linux_setup.yml --ask-become-pass
  elif [[ "$OSKIND" == *"microsoft"* ]] || [[ "$OSKIND" == *"Kali GNU/Linux"* ]]; then
    # Install dotfiles
    ./install

    # Set git config author details
    git config --global user.email "$(whoami)@$(hostname).com" 
    git config --global user.name "$(whoami)"
  else
    echo -e "\nUnsupported operating system: $OSKIND. This installation is only available on Ubuntu/Linux Mint, Mac OS and WSL2."
    exit 1
  fi

  # Install dotfiles
  ./install

  # Set git config author details
  git config --global user.email "$(whoami)@$(hostname).com" 
  git config --global user.name "$(whoami)"
}

function save_current_config {
  cp -a $HOME/.zshrc home/.
  cp -a $HOME/.vimrc home/.
  cp -a $HOME/.bashrc home/.
  cp -a $HOME/.aliases home/.
  cp -a $HOME/.gitconfig home/.
  echo "Current dotfiles saved as new configurations."
}

function show_help {
  echo "Usage: $0 [-i] [-s] [-h]"
  echo "  -i   Backs up your original dotfiles and installs new ones."
  echo "  -s   Save current dotfiles as new configurations"
  echo "  -h   Show this help menu"
}

if [ $# -eq 0 ]; then
  show_help
  exit 0
fi

while getopts ":ish" opt; do
  case $opt in
  i) install_dotfiles ;;
  s) save_current_config ;;
  h)
    show_help
    exit 0
    ;;
  \?) echo "Invalid option -$OPTARG" ;;
  esac
done
