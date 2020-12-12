#!/bin/bash

## for use with pactl (pulse audio)
# is_mute=$(pactl list sinks | grep Mute | cut -d' ' -f2) # outputs yes/no
# vol_value=$(pactl list sinks | grep Volume | head -n1 | cut -d'/' -f2 | sed 's/ //g')
# vol_value=${vol_value%\%}

## for use with amixer (alsa)
is_mute=$(awk -F"[][]" '/dB/ { print $6 }' <(amixer sget Master)) # outputs on/off
vol_value=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))

vol_icon_mute="~/.config/dunst/icons/volumemute.png"
vol_icon_unmute="~/.config/dunst/icons/volumeunmute.png"

if [[ "$is_mute" == off ]]; then
    notify-send "notify_volume" -u normal --icon="$vol_icon_mute" --hint=int:value:0
else
    notify-send "notify_volume" -u normal --icon="$vol_icon_unmute" --hint=int:value:"$vol_value"
fi
