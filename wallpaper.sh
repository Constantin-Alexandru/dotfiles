#!/bin/bash

# The directory of the wallpapers
wallpaper_dir="$HOME/dotfiles/wallpapers"

# Check that the directory exists
if [ ! -d "$wallpaper_dir" ]; then
  echo "Error: Directory '$wallpaper_dir' not found."
  exit 1
fi

# Get a list of all files in the directory (excluding subdirectories)
files=("$wallpaper_dir"/*)

# Get the number of files
num_files="${#files[@]}"

# Check if there are any files in the directory
if [ "$num_files" -eq 0 ]; then
  echo "Error: No wallpapers found in '$wallpaper_dir'."
  exit 1
fi

# Generate a random index within the range of the number of files
random_index=$(( RANDOM % num_files ))

# Get the randomly selected file
random_file="${files[$random_index]}"

hyprpaper

hyprctl hyprpaper preload "$random_file"
hyprctl hyprpaper wallpaper ",$random_file"
