#!/usr/bin/env bash

echo "This is a automatic setup for your new Linux Mint OS"
sleep 2
echo "1. The System gets updated to the latest releases."
sleep 2
echo "2. The firewall will be configured to enhance the security of the system"
sleep 2
echo "3. Some packages can be optionally be installed by choosing yes or no"
sleep 2
echo "4. Download and installation of a Windows like Linux Mint Theme"
sleep 2
echo "Important! You will be prompted to enter your password to update the system."
sleep 2
read -p "Press Enter to continue..."

echo "Update & Upgrade System"
sleep 2
sudo apt update; sudo apt upgrade -y
clear

echo "Firewall Setup"
sleep 2

echo "Install Firewall"
sleep 2
sudo apt install ufw -y

echo "Add default Rules"
sleep 2
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "Delete IPv6 Connection"
sleep 2
sudo ufw delete 2

echo "Enable Firewall"
sleep 2
sudo ufw enable

echo "Check Firewall Status"
sleep 2
sudo ufw status verbose

echo "Preload - Load you most used applications faster"
sleep 2
read -p "Do you want to install Preload? (y/n) " install_Preload
if [[ "$install_Preload" =~ ^[Yy]$ ]]; then
    echo "Installing Preload"
    sudo apt install preload -y
    echo "Check Status"
    sudo cat /var/log/preload.log
else
    echo "Skipping Preload installation."
fi

echo "VLC - Multimedia Player"
sleep 2
read -p "Do you want to install VLC? (y/n) " install_VLC
if [[ "$install_VLC" =~ ^[Yy]$ ]]; then
    echo "Installing VLC"
    sudo apt install vlc -y
else
    echo "Skipping VLC installation."
fi

echo "Windows 11 like Theme Setup"
sleep 2

echo "Download Theme"
sleep 2
cd /home/"$USER"/Downloads
wget https://github.com/luisrguerra/fluent11-icon-theme/archive/refs/tags/0.6.zip
wget https://github.com/vinceliuice/Fluent-gtk-theme/archive/refs/tags/2025-04-17.zip

echo "Extract Theme"
sleep 2
unzip 0.6.zip
unzip 2025-04-17.zip

echo "Remove Zip"
sleep 2
sudo rm -rf 0.6.zip
sudo rm -rf 2025-04-17.zip

echo "Change ownership in downloads"
sleep 2
sudo chown -R "$SUDO_USER":sudo Fluent-gtk-theme-2025-04-17
sudo chown -R "$SUDO_USER":sudo fluent11-icon-theme-0.6

echo "Install Theme"
sleep 2
bash Fluent-gtk-theme-2025-04-17/install.sh

echo "Copy Icons in icon folder"
sleep 2
mkdir -p /home/"$USER"/.icons
cp -r fluent11-icon-theme-0.6/fluent11 /home/"$USER"/.icons
cp -r fluent11-icon-theme-0.6/fluent11-light /home/"$USER"/.icons
cd ..

echo "Change ownership in icons folder"
sleep 2
cd /home/"$USER"/.icons
sudo chown -R "$SUDO_USER":sudo fluent11
sudo chown -R "$SUDO_USER":sudo fluent11-light
cd ..

echo "Set Windows like Cursor"
sleep 2
gsettings set org.cinnamon.desktop.interface cursor-theme "DMZ-White"
gsettings get org.cinnamon.desktop.interface cursor-theme

echo "Set Application Theme"
sleep 2
gsettings set org.cinnamon.desktop.interface gtk-theme "Fluent-Light"

echo "Set Desktop Theme"
sleep 2
gsettings set org.cinnamon.theme name "Fluent-Light"

echo "Set Icon Theme"
sleep 2
gsettings set org.cinnamon.desktop.interface icon-theme "fluent11"

#------------------------------------------------------------------------------------------------

echo "New Font"
sleep 2
cd /home/"$USER"/Downloads
wget https://github.com/rsms/inter/releases/download/v4.1/Inter-4.1.zip

echo "Extract Font"
sleep 2
mkdir -p /home/"$USER"/Downloads/Inter-4.1
unzip Inter-4.1.zip -d Inter-4.1

echo "Remove Zip"
sleep 2
sudo rm -rf Inter-4.1.zip

echo "Change ownership in downloads"
sleep 2
sudo chown -R "$SUDO_USER":sudo Inter-4.1

echo "Copy Inter in font folder"
sleep 2
mkdir -p /home/"$USER"/.local/share/fonts
cp -r Inter-4.1/Inter.ttc /home/"$USER"/.local/share/fonts
cp -r Inter-4.1/InterVariable.ttf /home/"$USER"/.local/share/fonts
cp -r Inter-4.1/InterVariable-Italic.ttf /home/"$USER"/.local/share/fonts
cd ..

echo "Change ownership in fonts folder"
sleep 2
cd /home/"$USER"/.local/share/fonts
sudo chown -R "$SUDO_USER":sudo Inter.ttc
sudo chown -R "$SUDO_USER":sudo InterVariable.ttf
sudo chown -R "$SUDO_USER":sudo InterVariable-Italic.ttf
cd ..

echo "Set the main Interface (UI) Font"
sleep 2
gsettings set org.cinnamon.desktop.interface font-name "Inter Display Regular 12"

echo "Set the Document Font"
sleep 2
gsettings set org.gnome.desktop.interface document-font-name "Inter Display Regular 11"

echo "Set the Desktop Font"
sleep 2
gsettings set org.nemo.desktop font "Inter Display Medium 12"

echo "Set the Title Font"
sleep 2
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font "Inter Display Bold 13"

#---------------------------------------------------------------------------------

echo "New PC is ready"
sleep 2
neofetch
