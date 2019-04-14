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
sudo pacman -S lightdm
# sudo pacman -S python-whither python-gobject python-pyqt5 zip # v3 broken
sudo pacman -S gtk3 webkit2gtk dbus-glib meson
# VS Code
sudo pacman -S code

# LightDM Web Greeter
## FIXME: https://github.com/Antergos/web-greeter/issues/164
## https://github.com/Antergos/web-greeter/issues/108
cd tools/lightdm-web-greeter/build
meson --prefix=/usr --libdir=lib ..
ninja
sudo ninja install

## system config

sudo ln -sf $PWD/etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/locale.conf /etc/

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
