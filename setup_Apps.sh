#!/usr/bin/env bash

echo "Some packages can be optionally be installed by choosing yes or no"
sleep 3
read -p "Press Enter to continue..."

echo "Update & Upgrade System"
sleep 2
sudo apt update; sudo apt upgrade -y

echo "VLC - Multimedia Player"
sleep 2
read -p "Do you want to install VLC? (y/n) " install_VLC
if [[ "$install_VLC" =~ ^[Yy]$ ]]; then
    echo "Installing VLC"
    sudo apt install vlc -y
else
    echo "Skipping VLC installation."
fi

echo "Gimp"
sleep 2
read -p "Do you want to install Gimp? (y/n) " install_Gimp
if [[ "$install_Gimp" =~ ^[Yy]$ ]]; then
    echo "Installing Gimp"
    sudo apt install gimp -y
else
    echo "Skipping Gimp installation."
fi

echo "Bitwarden"
sleep 2
read -p "Do you want to install Bitwarden? (y/n) " install_BW
if [[ "$install_BW" =~ ^[Yy]$ ]]; then
    echo "Installing Bitwarden"
    sudo flatpak install flathub com.bitwarden.desktop
else
    echo "Skipping Bitwarden installation."
fi

echo "Finished Setup"
sleep 2
neofetch
