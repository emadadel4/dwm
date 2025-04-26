#!/bin/sh

# ============================================
# Install Required Packages
# ============================================

    sudo xbps-install -Su
    sudo xbps-install -S vim make libX11-devel pkg-config libXft-devel libXinerama-devel glib-devel font-inconsolata-otf git xsetroot gcc make xorg-server xinit xrandr xorg xauth kitty -y 

# ============================================
# Set Up suckless directories
# ============================================

    git clone https://github.com/emadadel4/dwm.git
    cd dwm/src/dwm
    sudo make clean install
    cd dwm/src/dmenu
    sudo make clean install

# ============================================
# END Set Up suckless directories
# ============================================

# ============================================
# Set Up Xinitrc
# ============================================

    
# ============================================
# END Set Up Xinitrc
# ============================================
