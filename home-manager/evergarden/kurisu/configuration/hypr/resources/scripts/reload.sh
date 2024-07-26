#!/usr/bin/env sh

pkill ags
pkill dunst
pkill swww
pkill swaync

hyprctl reload
ags &
# dunst &
swaync &
swww init &
