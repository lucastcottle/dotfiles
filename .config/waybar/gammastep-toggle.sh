#!/bin/bash

# Simple toggle for gammastep
if pgrep -x "gammastep" > /dev/null; then
  killall gammastep
else
  gammastep -l 36.9:174.8 &
fi

