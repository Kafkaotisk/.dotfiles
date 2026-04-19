#!/bin/sh

# Check for current value
CURRENT_VALUE=$(hyprctl getoption decoration:dim_inactive)

# Enable/disable Dimmer
if [[ $CURRENT_VALUE == *"int: 1"* ]]; then
  hyprctl keyword decoration:dim_inactive false
  notify-send "  Disable dim inactive windows"
else
  hyprctl keyword decoration:dim_inactive true
  notify-send "󰱊  Enable dim inactive windows"
fi
