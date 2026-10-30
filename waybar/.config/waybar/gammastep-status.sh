#!/bin/bash

# Custom Waybar script to show status of gammastep
if pgrep -x "gammastep" > /dev/null; then
  TEXT="gammastep: on"
  CLASS="active"
else
  TEXT="gammastep: off"
  CLASS="inactive"
fi

echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TEXT\", \"class\": \"$CLASS\"}"