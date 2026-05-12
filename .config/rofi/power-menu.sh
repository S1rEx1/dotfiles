#!/usr/bin/env bash

choice=$(printf "lock\nshutdown\nreboot\n" | rofi -dmenu -i -p "power" -lines 2)

case "$choice" in
  lock)
    sleep 0.8
    ~/.config/swaylock/swaylock.sh
    ;;
  shutdown)
    systemctl poweroff
    ;;
  reboot)
    systemctl reboot
    ;;
esac
