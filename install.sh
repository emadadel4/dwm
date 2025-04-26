#!/bin/sh

# ============================================
# Install Required Packages
# ============================================

    echo "\033[1;33m[+] Installing Required Packages...\033[0m"

    sudo xbps-install -Su
    sudo xbps-install -S vim make libX11-devel pkg-config libXft-devel libXinerama-devel glib-devel font-inconsolata-otf git xsetroot gcc make xorg-server xinit xrandr xorg xauth kitty -y 

# ============================================
# Set Up suckless directories
# ============================================

    echo "\033[1;33m[+] Set Up suckless directories...\033[0m"

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

    echo "\033[1;33m[+] Set Up .xinitrc\033[0m"

    curl -o ~/.xinitrc https://raw.githubusercontent.com/emadadel4/dwm/refs/heads/main/src/scripts/.xinitrc
    chmod +x ~/.xinitrc
    
# ============================================
# END Set Up Xinitrc
# ============================================

echo -e "\n\033[32mInstallation completed!\033[0m"