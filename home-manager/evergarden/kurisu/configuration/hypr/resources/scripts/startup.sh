#!/usr/bin/env bash

wallpaper=../images/wallpaper/active-wallpaper.png

function if_process_exists() {
  if pgrep $1 2>/dev/null; then
    echo "Process $1 found"
    eval "$@"
  fi
}

function cleanup() {
  echo "Cleaning up"

  rm -rf ~/.cache/swww/

  if_process_exists swww "swww kill"
  if_process_exists waybar "pkill waybar"
  if_process_exists dunst "pkill dunst"
  if_process_exists swaync "pkill swaync"
}

# init

swww init &
swww img --transition-step 255 --transition-fps 60 --transition-duration 1 $wallpaper

# waybar &
ags &

# dunst &
swaync &

wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store & #Stores only image data
