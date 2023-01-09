#!/bin/zsh

function backuporiginal {
    mkdir $HOME/orignaldotfiles
    cp -a $HOME/.* $HOME/orignaldotfiles/.
}

function installdotfiles {
    cp -a dotfilestoinstall/. $HOME/
}

function backupcurrentconfig{
    cp -a $HOME/.zshrc dotfilestoinstall/.
    cp -a $HOME/.bashrc dotfilestoinstall/.
}

backuporiginal
installdotfiles

# TODO add argument such that you can invoke to backup current config