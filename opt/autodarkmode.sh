#!/bin/bash

# Add this in crontab -e
# 40 18 * * * /opt/autodarkmode.sh
# 0 7 * * * /opt/autodarkmode.sh

 
function set_light_mode () {
    echo "setting light mode"
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
}

function set_dark_mode () {
    echo "setting dark mode"
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
}

case "$1" in
    light)
        set_light_mode
        ;;
    dark)
        set_dark_mode
        ;;
    *)
        light_time="0655"
        dark_time="1830"
        d="$(date +"%H%M")"

        if [ "$d" -ge "$light_time" ] && [ "$d" -lt "$dark_time" ]; then
            set_light_mode
        else
            set_dark_mode
        fi
        ;;
esac