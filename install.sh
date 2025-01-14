#!/bin/bash

set -e

install_package() {
    pacman -Qs "$1" > /dev/null || sudo pacman -S --noconfirm "$1"
}

packages=(
    bspwm
    alacritty
    sxhkd
    ranger
    neovim
    feh
    gnome-keyring
    xorg-xsetroot
    xorg-xrandr
    ttf-dejavu
    fzf
)

for pkg in "${packages[@]}"; do
    install_package "$pkg"
done

directories=(
    "$HOME/.config/bspwm"
    "$HOME/.config/alacritty"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

declare -A files_to_move=(
    ["$HOME/bspwm/dotfiles/bspwmrc"]="$HOME/.config/bspwm"
    ["$HOME/bspwm/dotfiles/sxhkdrc"]="$HOME/.config/bspwm"
    ["$HOME/bspwm/dotfiles/alacritty.toml"]="$HOME/.config/alacritty"
    ["$HOME/bspwm/dotfiles/.xsession"]="$HOME/"
)

for src in "${!files_to_move[@]}"; do
    [ -f "$src" ] && mv "$src" "${files_to_move[$src]}"
done

declare -A files_to_chmod=(
    ["$HOME/.config/bspwm/bspwmrc"]=1
    ["$HOME/.xsession"]=1
    ["$HOME/bspwm/scripts/*.sh"]=1
    ["$HOME/bspwm/firefox/*.sh"]=1
)

for file in "${!files_to_chmod[@]}"; do
    chmod +x $file
done

echo -e "Additional packages for installation:\n1 | yay\n2 | cava\n3 | spotify\n4 | neofetch\n5 | openrgb\n6 | openjdk\n7 | gradle\n8 | vscode\n9 | flameshot"

read -p "Enter package numbers for installation: " -a selected_additional_indices

declare -A package_commands=(
    [1]="git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm"
    [2]="yay -S --noconfirm cava"
    [3]="yay -S --noconfirm spotify"
    [4]="sudo pacman -S --noconfirm neofetch"
    [5]="yay -S --noconfirm openrgb"
    [6]="sudo pacman -S --noconfirm jdk-openjdk"
    [7]="sudo pacman -S --noconfirm gradle"
    [8]="sudo pacman -S --noconfirm vscode"
    [9]="sudo pacman -S --noconfirm flameshot"
)

for index in "${selected_additional_indices[@]}"; do
    if [[ -n "${package_commands[$index]}" ]]; then
        eval "${package_commands[$index]}"
    else
        echo "Incorrect number: $index"
    fi
done

sudo pacman -S --noconfirm ly && sudo systemctl enable ly.service

echo "Excellent. You can reboot the system now."

exit 0
