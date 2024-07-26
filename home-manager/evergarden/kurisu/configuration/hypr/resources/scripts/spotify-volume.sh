#!/usr/bin/env bash

# check command line arguments first
if [ $# != 1 ]; then
    echo "Usage ${0} up|down|mute"
    exit 1
fi

if [ $1 != "up" -a $1 != "down" -a $1 != "mute" ]; then
    echo "Usage ${0} up|down|mute"
    exit 1
fi

# Get the Spotify sink-input ID (select the first one)
spotify_id=$(wpctl status | grep "spotify" | tail -1 | awk '{print $1}' | tr -d .)

# Check if the Spotify ID was found
if [ -z "$spotify_id" ]; then
    echo "Spotify not found in wpctl status"
    exit 1
fi

echo "Spotify is sink-input $spotify_id"

case $1 in
    up)
        wpctl set-volume "$spotify_id" 5%+ -l 1.0
        ;;
    down)
        wpctl set-volume "$spotify_id" 5%- -l 1.0
        ;;
    mute)
        wpctl set-mute "$spotify_id" toggle
        ;;
    *)
        echo "Error"
        ;;
esac

