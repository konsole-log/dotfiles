#!/bin/bash
CHOICE=$(echo -e "󰜉 Reboot\n󰌾 Lock\n󰍃 Logout\n󰤆 Shutdown" | rofi -dmenu -i -p "󰐦 Power")
case "$CHOICE" in
  "󰜉 Reboot")
    systemctl reboot
    ;;
  "󰌾 Lock")
    dm-tool lock
    # ~/.config/i3/lock.sh
    ;;
  "󰍃 Logout")
    lxsession-logout
    ;;
  "󰤆 Shutdown")
    systemctl poweroff
    ;;
esac
