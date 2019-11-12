echo "You should check the install.sh file and modify it first."
exit 1

## Packages

sudo pacman -Sy $(cat packages.dsv | cut -d' ' -f1)

# X Window System
sudo pacman -S awesome xorg-xbacklight xorg-xmodmap
# CLI utils
sudo pacman -S xclip hub openssh vim sudo stow zsh autojump physlock
# WiFi
sudo pacman -S wpa_supplicant dialog iw elinks
# Fonts
sudo pacman -S powerline-fonts otf-fira-code noto-fonts-emoji
# HyperJS
sudo pacman -S libicns graphicsmagick xz yarn
# Sound
sudo pacman -S alsa-utils playerctl
# LightDM 
sudo pacman -S lightdm lightdm-gtk-greeter
# Bluetooth (bluetoothctl)
sudo pacman -S bluez bluez-utils

# NVM git install
stow nvm
cd nvm
. nvm.sh
cd ..

# don't install yarn with pacman as it would install nodejs
sudo pacman -S yarn hyper --assume-installed nodejs=12.3.0

# install vs code extensions
cat code-extensions.list | xargs -L 1 echo code --install-extension

## system config

sudo ln -sf $PWD/etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/locale.conf /etc/
sudo ln -sf $PWD/etc/lightdm/lightdm.conf /etc/lightdm

## Services

# disable Manjaro NetworkManager
sudo systemctl disable --now NetworkManager.service
sudo systemctl enable --now dhcpcd.service

sudo systemctl enable netctl-auto@interface.service
# enable a profile (in /etc/netctl/, maybe create with wifi-menu) to start at boot 
# sudo netctl enable my-profile 
sudo systemctl enable lightdm.service

## link user dotfiles
# this project should be clones in $HOME/dotfiles

stow awesome
stow git
stow hyper.js
stow vsconf
stow zsh
stow arandr
stow nvm

## Tools

# unmute master with 'm' key
alsamixer
# configure WiFi 
sudo wifi-menu
# check installed packages
grep -i installed /var/log/pacman.log

## run awesome in a nested X server for tests
## ctrl+shift to capture keyboard and mouse
Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome
