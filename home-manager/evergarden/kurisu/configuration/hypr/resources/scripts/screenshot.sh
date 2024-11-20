#!/usr/bin/env bash

grim -l 9 -g "$(slurp -d)" - | wl-copy -t image/png
