#!/bin/bash

function link_config_folder {
  rm -rf ~/.config/$1
  ln -s ~/dotfiles/$1 ~/.config/$1
}

total_steps=10
step=0

echo "[$step/$total_steps]Beginning environment setup..."

step=$((step + 1)) 

sleep 3

echo "[$step/$total_steps]Installing prerequisites..."

sudo pacman --noconfirm -Syu git base-devel

step=$((step + 1)) 

echo "[$step/$total_steps]Installing SDDM..."

sudo pacman --noconfirm -Syu sddm

sudo systemctl enable sddm.service

step=$((step + 1)) 

echo "[$step/$total_steps]Setting up kitty..."

git clone https://github.com/dracula/kitty.git dracula-kitty

cp dracula-kitty/dracula.conf dracula-kitty/diff.conf ~/.config/kitty/

sudo rm -r dracula-kitty

link_config_folder "kitty"

step=$((step + 1)) 

echo "[$step/$total_steps]Installing the fonts..."

sudo pacman --noconfirm -Syu ttf-jetbrains-mono-nerd noto-fonts-emoji

step=$((step + 1)) 

echo "[$step/$total_steps]Setting up Hyprland..."

link_config_folder "hypr"

hyprctl reload # Reload Hyprland

step=$((step + 1)) 

echo "[$step/$total_steps]Installing yay..."

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si --noconfirm

cd ..

sudo rm -r yay

step=$((step + 1)) 

echo "[$step/$total_steps]Installing eww..."

yay --noconfirm -Syu eww

link_config_folder "eww"

step=$((step + 1)) 

echo "[$step/$total_steps]Installing neovim..."

sudo pacman --noconfirm -Syu neovim

link_config_folder "nvim"

echo "[$step/$total_steps]Installing zathura..."

sudo pacman --noconfirm -Syu zathura zathura-pdf-mupdf

link_config_folder "zathura"

step=$((step + 1)) 

echo "[$step/$total_steps] Installing tofi..."

yay --noconfirm -Syu tofi

step=$((step + 1)) 

echo "[$step/$total_steps] Installing hyprpaper..."

sudo pacman --noconfirm -Syu hyprpaper

echo "$step/$total_steps] Installing clipman..."

sudo pacman --noconfirm -Syu clipman
