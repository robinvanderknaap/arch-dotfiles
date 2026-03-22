#!/usr/bin/env bash

# Options
shutdown="󰐥 Shutdown"
reboot="󰜉 Reboot"
suspend="󰤄 Suspend"
logout="󰍃 Logout"
lock="󰌾 Lock"

# Show rofi and capture choice
chosen=$(printf '%s\n' "$shutdown" "$reboot" "$suspend" "$logout" "$lock" \
    | rofi -dmenu \
           -p "Power" \
           -theme-str 'window {width: 200px;}' \
           -theme-str 'listview {lines: 5;}' \
           -theme-str 'inputbar {enabled: false;}')

# Act on choice
case "$chosen" in
    "$shutdown")  systemctl poweroff ;;
    "$reboot")    systemctl reboot ;;
    "$suspend")   systemctl suspend ;;
    "$logout")    hyprctl dispatch exit ;;
    "$lock")      hyprlock ;;
esac
