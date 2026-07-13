#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  playerctl metadata --format '{{artist}} - {{title}}' \
| awk '{ if(length>=20) print substr($0,1,17)"..."; else print }'

elif [ "$status" = "Paused" ]; then
    artist=$(playerctl metadata artist)
    title=$(playerctl metadata title)

    echo " $artist - $title"
else
    echo ""
fi
