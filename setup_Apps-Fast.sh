#!/usr/bin/env bash

read -p "Do you want to install VLC? (y/n) " install_VLC
read -p "Do you want to install Gimp? (y/n) " install_Gimp
read -p "Do you want to install Bitwarden? (y/n) " install_BW

sudo apt update; sudo apt upgrade -y

#Remove Bloatware
sudo apt remove warpinator -y
sudo apt remove hypnotix -y

if [[ "$install_VLC" =~ ^[Yy]$ ]]; then
    sudo apt install vlc -y
fi

if [[ "$install_Gimp" =~ ^[Yy]$ ]]; then
    sudo apt install gimp -y
fi

if [[ "$install_BW" =~ ^[Yy]$ ]]; then
    sudo flatpak install flathub com.bitwarden.desktop -y
fi

echo "Finished Setup"
