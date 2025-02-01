#!/bin/bash

function link_config_folder {
  rm -rf ~/.config/$1
  ln -s ~/dotfiles/$1 ~/.config/$1
}

total_steps=6
step=0

echo "[$step/$total_steps]Beginning environment setup..."

step=step+1

sleep 3

echo "[$step/$total_steps]Installing prerequisite..."

sudo pacman --noconfirm -Syu git base-devel

step=step+1

echo "[$step/$total_steps]Installing the font..."

sudo pacman --noconfirm -Syu ttf-jetbrains-mono-nerd

step=step+1

echo "[$step/$total_steps]Setting up Hyprland..."

link_config_folder "hypr"

hyprctl reload # Reload Hyprland

step=step+1
echo "[$step/$total_steps]Installing yay..."

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd ..

sudo rm -r yay

step=step+1

echo "[$step/$total_steps]Installing eww..."

yay --noconfirm -Syu eww

link_config_folder "eww"

step=step+1

echo "[$step/$total_steps]Installing neovim..."

sudo pacman --noconfirm -Syu neovim

link_config_folder "nvim"
