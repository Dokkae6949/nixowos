#!/usr/bin/env sh

wallpaper=../images/wallpaper/active-wallpaper.png

pkill ags
pkill swww

hyprctl reload
ags &
swww init &
swww img --transition-step 255 --transition-fps 60 --transition-duration 1 $wallpaper &
