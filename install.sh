# Just some notes for myself - not testing directly

## Packages

sudo pacman -Sy

# X Window System
sudo pacman -S awesome xbacklight xorg-xmodmap
# CLI utils
sudo pacman -S xclip hub openssh vim sudo stow zsh autojump
# WiFi
sudo pacman -S wpa_supplicant dialog iw elink
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

## system config

sudo ln -sf $PWD/etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/locale.conf /etc/
sudo ln -sf $PWD/etc/lightdm/lightdm.conf /etc/lightdm

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
