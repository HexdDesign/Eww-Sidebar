#!/bin/bash

# Ethernet connected
if nmcli -t -f DEVICE,TYPE,STATE dev | grep -q ":ethernet:connected"; then
  echo "󰈀 Ethernet"
  exit 0
fi

# Wi-Fi connected
wifi=$(nmcli -t -f IN-USE,SIGNAL,SSID dev wifi | grep '^*')
if [ -n "$wifi" ]; then
  signal=$(echo "$wifi" | cut -d: -f2)
  ssid=$(echo "$wifi" | cut -d: -f3)

  if [ "$signal" -ge 75 ]; then
    bars="󰤨"
  elif [ "$signal" -ge 50 ]; then
    bars="󰤥"
  elif [ "$signal" -ge 25 ]; then
    bars="󰤢"
  else
    bars="󰤟"
  fi

  echo "$bars $ssid"
  exit 0
fi

# Offline
echo "󰤭 Offline"
