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

    cat > ~/.xinitrc << EOF
    #!/bin/sh
    xrandr --output HDMI-1 --set "Broadcast RGB" "Full" --mode 1920x1080 --rate 60 &
    exec dwm
    EOF
    chmod +x ~/.xinitrc
    
# ============================================
# END Set Up Xinitrc
# ============================================