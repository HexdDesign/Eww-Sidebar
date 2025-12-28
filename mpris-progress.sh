#!/usr/bin/env bash

pos=$(playerctl position 2>/dev/null)
len=$(playerctl metadata mpris:length 2>/dev/null)

if [ -z "$pos" ] || [ -z "$len" ] || [ "$len" = "0" ]; then
  echo 0
  exit
fi

awk "BEGIN { printf \"%d\", ($pos / ($len / 1000000)) * 100 }"
