#!/bin/bash

# Custom Waybar script to show status of gammastep
if pgrep -x "gammastep" > /dev/null; then
  ICON=""
  TEXT="On"
  CLASS="active"
else
  ICON=""
  TEXT="Off"
  CLASS="inactive"
fi

echo "{\"text\": \"$ICON\", \"tooltip\": \"Gammastep: $TEXT\", \"class\": \"$CLASS\"}":
