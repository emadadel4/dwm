#!/bin/sh

# ============================================
# Install Required Packages
# ============================================
echo "\033[1;33m[+] Installing Required Packages...\033[0m"
sudo xbps-install -Su -y
sudo xbps-install -S vim make patch libX11-devel / 
pkg-config libXft-devel libXinerama-devel glib-devel /
font-inconsolata-otf git xsetroot gcc make xorg-server /
xinit xrandr xorg xauth kitty setxkbmap pipewire wireplumber /
libspa-bluetooth sxhkd NetworkManager network-manager-applet dbus -y 
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
# Installing fonts...
# ============================================
echo -e "\033[1;33m[+] Installing fonts...\033[0m"
curl -L -o fonts.tar.gz https://github.com/emadadel4/void-linux/raw/refs/heads/main/env-configs/xfce/emadadel/fonts.tar.gz
sudo tar -xvf fonts.tar.gz -C /usr/share/fonts/ --strip-components=1
sudo fc-cache -f -v
# ============================================
# END Installing fonts...
# ============================================
# ============================================
# Enabling services 
# ============================================
sudo rfkill unblock bluetooth
sudo ln -sf /etc/sv/dbus /var/service
sudo ln -sf /etc/sv/bluetoothd /var/service/
# ============================================
# END Enable services 
# ============================================
# ============================================
# Set Up Xinitrc
# ============================================
echo "\033[1;33m[+] Set Up .xinitrc\033[0m"
curl -o ~/.xinitrc https://raw.githubusercontent.com/emadadel4/dwm/refs/heads/main/src/scripts/.xinitrc
chmod +x ~/.xinitrc
sudo echo "source /usr/share/bash-completion/bash_completion" >> .bashrc
source ~/.bashrc
# ============================================
# END Set Up Xinitrc
# ============================================

# ============================================
#  Installing additional packaging...
# ============================================

read -r -d '' PkgList <<'EOF'
nano
bluez
blueman
libspa-bluetooth
vlc
uget
redshift
redshift-gtk
kitty
bash-completion
freerdp
SDL2_ttf
unzip
unrar
git
mesa-dri-32bit
mesa-vulkan-intel 
mesa-vulkan-intel-32bit 
vulkan-loader-32bit 
intel-video-accel
gnutls-32bit 
libgcc-32bit 
libstdc++-32bit 
libdrm-32bit 
libglvnd-32bit
amberol
fish-shell
nodejs
mesa-intel-dri 
libva-intel-driver 
telegram-desktop
EOF

echo -e "\033[1;33m[+] Installing base packages...\033[0m"
sudo xbps-install -S $PkgList

# ============================================
# END Installing additional packaging...
# ============================================
# ============================================
# Setup GPU drivers settings
# ============================================
echo -e "Setup GPU drivers settings"
echo "options i915 enable_dc=2 enable_fbc=1 fastboot=1 modeset=1" | sudo tee /etc/modprobe.d/intel-graphics.conf
# ============================================
# END Setup GPU drivers settings
# ============================================
echo -e "\n\033[32mInstallation completed!\033[0m"
