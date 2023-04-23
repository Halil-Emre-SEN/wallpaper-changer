#!/bin/sh
#
RESIMLERIM_KLASORU=/home/he/Resimler/wallpaper

RESIM_DOSYASI="$(find "$RESIMLERIM_KLASORU" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) | shuf -n 1)"

RUID=$(who | awk 'FNR == 1 {print $1}')

# Translate Real Username to Real User ID
RUSER_UID=$(id -u ${RUID})

# Set gsettings for the Real User
sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.background picture-uri-dark "file://$RESIM_DOSYASI"
sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.background picture-uri "file://$RESIM_DOSYASI"


