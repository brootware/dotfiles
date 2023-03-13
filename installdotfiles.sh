#!/bin/zsh

function install_dotfiles {
    rm -rf $HOME/orignaldotfiles
    mkdir $HOME/orignaldotfiles
    mv $HOME/.aliases $HOME/orignaldotfiles/.
    mv $HOME/.bashrc $HOME/orignaldotfiles/.
    mv $HOME/.zshrc $HOME/orignaldotfiles/.
    mv $HOME/.gitconfig $HOME/orignaldotfiles/.
    echo "Current dotfiles have been backed up to originaldotfiles/ folder in home directory."
    ln -s $(pwd)/dotfilestoinstall/.aliases ~/.aliases
    ln -s $(pwd)/dotfilestoinstall/.bashrc ~/.bashrc
    ln -s $(pwd)/dotfilestoinstall/.zshrc ~/.zshrc
    ln -s $(pwd)/dotfilestoinstall/.gitconfig ~/.gitconfig
    source ~/.zshrc
    echo "The dotfiles have been installed."
}

function save_current_config {
    cp -a $HOME/.zshrc dotfilestoinstall/.
    cp -a $HOME/.bashrc dotfilestoinstall/.
    cp -a $HOME/.aliases dotfilestoinstall/.
    cp -a $HOME/.gitconfig dotfilestoinstall/.
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
    h) show_help; exit 0;;
    \?) echo "Invalid option -$OPTARG" ;;
  esac
done
