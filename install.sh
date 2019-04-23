### Just some notes for myself
### DON'T RUN this without modifications
exit 1

## Packages

sudo pacman -Sy

## packages list: see packages.dsv
pacman -Qent --info

# X Window System
sudo pacman -S awesome xbacklight xorg-xmodmap
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
# VS Code
sudo pacman -S code
# Bluetooth
sudo pacman -S bluez bluez-utils

# don't install yarn with pacman as it would install nodejs
curl -o- -L https://yarnpkg.com/install.sh | bash

## system config

sudo ln -sf $PWD/etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/locale.conf /etc/
sudo ln -sf $PWD/etc/lightdm/lightdm.conf /etc/lightdm

## Services

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

## Tools

# unmute master with 'm' key
alsamixer
# configure WiFi 
sudo wifi-menu
# check installed packages
grep -i installed /var/log/pacman.log

### Misc

## screen locker
# physlock

## shutdown
## FIXME: shutdown hangs when using lightdm or shutdown command
# sudo systemctl poweroff

## reboot
# sudo systemctl reboot

## bluetooth config - interactive
# bluetoothctl

## run awesome in a nested X server for tests
## ctrl+shift to capture keyboard and mouse
# Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome
