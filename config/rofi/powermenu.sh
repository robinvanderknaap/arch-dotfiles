#!/usr/bin/env bash

THEME="$HOME/.config/rofi/powermenu.rasi"
CONFIRM_THEME="$HOME/.config/rofi/powermenu-confirm.rasi"

# Generate theme with real username/hostname
sed \
  -e "s/REPLACE_USER/$(whoami)/" \
  -e "s/REPLACE_HOST/$(hostname)/" \
  "$THEME" > /tmp/powermenu-live.rasi
THEME="/tmp/powermenu-live.rasi"

# Options — icon on first line, label on second
lock="󰌾\nLock"
suspend="󰤄\nSuspend"
logout="󰍃\nLogout"
reboot="󰜉\nReboot"
shutdown="󰐥\nShutdown"

chosen=$(printf '%b\0%b\0%b\0%b\0%b\0' \
    "$lock" "$suspend" "$logout" "$reboot" "$shutdown" \
    | rofi \
        -dmenu \
        -sep '\0' \
        -p "" \
        -theme "$THEME")

[ -z "$chosen" ] && exit 0

confirm() {
    local action="$1"
    local answer
    answer=$(printf ' Yes\n No' \
        | rofi \
            -dmenu \
            -p "  $action?" \
            -mesg "Are you sure?" \
            -theme "$CONFIRM_THEME")
    [[ "$answer" == *"Yes"* ]]
}

case "$chosen" in
    *Lock*)     hyprlock ;;
    *Suspend*)  confirm "Suspend"  && systemctl suspend ;;
    *Logout*)   confirm "Logout"   && hyprctl dispatch exit ;;
    *Reboot*)   confirm "Reboot"   && systemctl reboot ;;
    *Shutdown*) confirm "Shutdown" && systemctl poweroff ;;
esac
