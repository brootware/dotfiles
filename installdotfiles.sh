#!/bin/zsh

function install_dotfiles {
    rm -rf $HOME/orignaldotfiles
    mkdir $HOME/orignaldotfiles
    mv $HOME/.aliases $HOME/orignaldotfiles/.
    mv $HOME/.bashrc $HOME/orignaldotfiles/.
    mv $HOME/.zshrc $HOME/orignaldotfiles/.
    mv $HOME/.vimrc $HOME/orignaldotfiles/.
    mv $HOME/.gitconfig $HOME/orignaldotfiles/.
    mv $HOME/.lscolors $HOME/orignaldotfiles/.
    mv $HOME/.smartdots $HOME/orignaldotfiles/.
    echo "Current dotfiles have been backed up to originaldotfiles/ folder in home directory."
    ln -s $(pwd)/home/.aliases ~/.aliases
    ln -s $(pwd)/home/.bashrc ~/.bashrc
    ln -s $(pwd)/home/.zshrc ~/.zshrc
    ln -s $(pwd)/home/.vimrc ~/.vimrc
    ln -s $(pwd)/home/.gitconfig ~/.gitconfig
    ln -s $(pwd)/home/.lscolors ~/.lscolors
    ln -s $(pwd)/home/.smartdots ~/.smartdots
    source ~/.zshrc
    echo "The dotfiles have been installed."
}

function save_current_config {
    cp -a $HOME/.zshrc home/.
    cp -a $HOME/.vimrc home/.
    cp -a $HOME/.bashrc home/.
    cp -a $HOME/.aliases home/.
    cp -a $HOME/.gitconfig home/.
    cp -a $HOME/.lscolors home/.
    cp -a $HOME/.smartdots home/.
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