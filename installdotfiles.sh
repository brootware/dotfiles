#!/bin/zsh

function backuporiginal {
    mkdir orignaldotfiles
    cp ~/.* orignaldotfiles
}

function installdotfiles {
    cp -a dotfilestoinstall/. ~/
}

backuporiginal
installdotfiles