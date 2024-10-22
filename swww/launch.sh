  3 #!/bin/bash

WALLPAPER=~/Pictures/Wallpapers/Background-With-Logo.png

# Kill all existing instances
killall swww-daemon

# Initialise daemon
swww-daemon &

# Load background
swww img $WALLPAPER &

# Generate colorscheme
wal -i $WALLPAPER &
