# Just some notes for myself - not testing directly

sudo pacman -Sy code  \
    awesome xbacklight xorg-xmodmap xclip \
    wpa_supplicant dialog iw elink \
    hub openssh vim sudo stow zsh autojump \
    powerline-fonts otf-fira-code noto-fonts-emoji \
    libicns graphicsmagick xz yarn \
    alsa-utils playerctl

# system config
sudo ln -sf $PWD/etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/
sudo ln -sf $PWD/etc/locale.conf /etc/

# link user dotfiles
# this project should be clones in $HOME/dotfiles
stow awesome
stow git
stow hyper.js
stow vsconf
stow zsh

# unmute master with 'm' key
alsamixer

# configure WiFi 
sudo wifi-menu
