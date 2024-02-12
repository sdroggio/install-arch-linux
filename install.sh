#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm

# Install base-devel if not already installed, necessary for building packages
sudo pacman -S --needed --noconfirm base-devel git

# Install yay (Yet Another Yogurt) - An AUR Helper
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install packages with pacman and yay
sudo pacman -S --noconfirm tmux neovim kitty chromium rofi sway
yay -S --noconfirm hyprland

# To start Hyprland by default, you might want to configure your .xinitrc or .bash_profile
# For example, adding exec hyprland to your .xinitrc will start Hyprland when you run startx
echo "exec hyprland" >> ~/.xinitrc

# Set Kitty as the default terminal emulator
# This will set the TERMINAL environment variable to 'kitty' in your .bashrc or .zshrc file, depending on your shell
if [ -n "$(command -v zsh)" ]; then
    echo "export TERMINAL=kitty" >> ~/.zshrc
elif [ -n "$(command -v bash)" ]; then
    echo "export TERMINAL=kitty" >> ~/.bashrc
fi

# Note: This script does not include detailed configuration for each package.
# You should configure them manually as per your needs.

echo "Installation and basic configuration completed."
