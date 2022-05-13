#!/bin/sh
# this script must be executed as root user
username=$SUDO_USER
userhome=$(getent passwd $SUDO_USER | cut -d: -f6)

pacman --noconfirm -Syu

# remove guest utils provided by the box (they do not work in the GUI environment)
pacman --noconfirm -R virtualbox-guest-utils-nox

# feel free to add/remove packages as you need
pacman --noconfirm -S \
    base-devel net-tools gvim wget git unzip openssh zsh zsh-completions \
    dialog alsa-utils pulseaudio \
    xorg-server xorg-xfontsel xorg-xrdb xorg-setxkbmap xorg-xinit xf86-video-intel xf86-input-synaptics xf86-input-libinput \
    i3 lightdm lightdm-gtk-greeter dmenu \
    ttf-inconsolata terminus-font \
    xclip feh rxvt-unicode chromium \
    jdk11-openjdk \
    virtualbox-guest-utils

# add user to the audio group
usermod -a -G audio "${username}"

# set the default shell
chsh -s /usr/bin/zsh

# enable display manager
systemctl enable lightdm.service
systemctl start lightdm.service

