#!/bin/bash

bright_value=$(( ($(brightnessctl get)*100)/$(brightnessctl max) ))

bright_icon="~/.config/dunst/icons/brightness.png"

notify-send "notify_brightness" -u normal --hint=int:value:"$bright_value" --icon="$bright_icon"
