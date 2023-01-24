#!/bin/zsh

function backup_original {
    rm -rf $HOME/orignaldotfiles
    mkdir $HOME/orignaldotfiles
    cp -a $HOME/.* $HOME/orignaldotfiles/.
    echo "Current dotfiles have been backed up to originaldotfiles/ folder in home directory."
}

function install_dotfiles {
    cp -a dotfilestoinstall/. $HOME/
    source ~/.zshrc
    echo "The dotfiles have been installed."
}

function backup_current_config {
    cp -a $HOME/.zshrc dotfilestoinstall/.
    cp -a $HOME/.bashrc dotfilestoinstall/.
    cp -a $HOME/.aliases dotfilestoinstall/.
    cp -a $HOME/.gitconfig dotfilestoinstall/.
    echo "Current dotfiles saved as new configurations."
}

function show_help {
    echo "Usage: $0 [-b] [-i] [-c] [-h]"
    echo "  -b   Backup original dotfiles"
    echo "  -i   Install dotfiles"
    echo "  -c   Save current dotfiles as new configurations"
    echo "  -h   Show this help menu"
}

if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

while getopts ":bich" opt; do
  case $opt in
    b) backup_original ;;
    i) install_dotfiles ;;
    c) backup_current_config ;;
    h) show_help; exit 0;;
    \?) echo "Invalid option -$OPTARG" ;;
  esac
done
