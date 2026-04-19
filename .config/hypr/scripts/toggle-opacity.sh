#!/bin/sh

#Check current inactive_opacity setting
CURRENT_VALUE=$(hyprctl getoption decoration:inactive_opacity) #2>/dev/null | head -1)

# Enable/disable Opacity
if [[ $CURRENT_VALUE == *"1"* ]]; then
  hyprctl keyword decoration:inactive_opacity 0.7
  notify-send "󱙝  Enable transparency on inactive windows"
else
  hyprctl keyword decoration:inactive_opacity "1"
  notify-send "󱙜  Disable transparency on inactive windows"
fi
