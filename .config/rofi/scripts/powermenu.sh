#!/bin/bash

options="󰌾 Lock\n󰤄 Suspend\n󰋊 Hibernate\n󰍃 Logout\n󰐥 Shutdown\n󰜉 Reboot"

selected=$(echo -e "$options" | rofi \
    -dmenu \
    -p "Power Menu" \
    -theme ~/.config/rofi/themes/powermenu.rasi)

case "$selected" in
    "󰐥 Shutdown")
        systemctl poweroff
        ;;
    "󰜉 Reboot")
        systemctl reboot
        ;;
    "󰤄 Suspend")
        systemctl suspend
        ;;
    "󰋊 Hibernate")
        systemctl hibernate
        ;;
    "󰍃 Logout")
        hyprctl dispatch exit
        ;;
    "󰌾 Lock")
        hyprlock
        ;;
esac
