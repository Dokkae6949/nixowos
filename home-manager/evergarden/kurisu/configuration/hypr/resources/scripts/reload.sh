#!/usr/bin/env sh

wallpaper=../images/wallpaper/active-wallpaper.png

pkill ags
pkill dunst
pkill swww
pkill swaync

hyprctl reload
ags &
# dunst &
swaync &
swww init &
swww img --transition-step 255 --transition-fps 60 --transition-duration 1 $wallpaper &
