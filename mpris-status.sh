#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)

[ -z "$status" ] && echo "Nothing playing" && exit

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -z "$artist" ] && [ -z "$title" ]; then
  echo "Nothing playing"
else
  echo "$artist — $title"
fi
