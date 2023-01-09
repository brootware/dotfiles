#!/bin/zsh

function backuporiginal {
    mkdir orignaldotfiles
    cp $HOME/.* orignaldotfiles
}

function installdotfiles {
    cp -a dotfilestoinstall/. ~/
}

backuporiginal
installdotfiles