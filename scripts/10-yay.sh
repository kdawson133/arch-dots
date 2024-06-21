#!/bin/sh
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
yay --version
cd
rm -rf ~/yay
