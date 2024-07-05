#!/usr/bin/env bash

# List all input devices
xinput list > /tmp/input_devices.txt

# Find the mouse device ID
MOUSE_ID=$(grep -i 'mouse' /tmp/input_devices.txt | grep -Po 'id=\K\d+')

if [ -z "$MOUSE_ID" ]; then
  echo "No mouse found."
  exit 1
fi

echo "Mouse ID: $MOUSE_ID"

# List all properties of the mouse
xinput list-props "$MOUSE_ID" > /tmp/mouse_props.txt

# Find the "Evdev Scrolling Distance" property ID
SCROLL_PROP_ID=$(grep -i 'Evdev Scrolling Distance' /tmp/mouse_props.txt | grep -Po '\(\K\d+')

if [ -z "$SCROLL_PROP_ID" ]; then
  echo "No 'Evdev Scrolling Distance' property found for the mouse."
  exit 1
fi

echo "Evdev Scrolling Distance Property ID: $SCROLL_PROP_ID"

# Reverse the scrolling direction
xinput set-prop "$MOUSE_ID" "$SCROLL_PROP_ID" -1 -1 -1

echo "Scrolling direction reversed for the mouse."