#!/usr/bin/env bash

vol=$(pamixer --get-volume 2>/dev/null)

if [ -z "$vol" ]; then
  echo 0
else
  echo "$vol"
fi
