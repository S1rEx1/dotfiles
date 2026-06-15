#!/usr/bin/env bash

choice=$(printf "sleep\nshutdown\nreboot\n" | rofi -dmenu -i -p "power" -lines 2)

case "$choice" in
  sleep)
    systemctl suspend
    ;;
  shutdown)
    systemctl poweroff
    ;;
  reboot)
    systemctl reboot
    ;;
esac
