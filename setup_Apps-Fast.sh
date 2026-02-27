#!/usr/bin/env bash

sudo apt update; sudo apt upgrade -y

read -p "Do you want to install VLC? (y/n) " install_VLC
read -p "Do you want to install Gimp? (y/n) " install_Gimp
read -p "Do you want to install Bitwarden? (y/n) " install_BW

if [[ "$install_VLC" =~ ^[Yy]$ ]]; then
    sudo apt install vlc -y

if [[ "$install_Gimp" =~ ^[Yy]$ ]]; then
    sudo apt install gimp -y

if [[ "$install_BW" =~ ^[Yy]$ ]]; then
    sudo flatpak install flathub com.bitwarden.desktop

echo "Finished Setup"
