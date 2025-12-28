#!/usr/bin/env bash

API_KEY="89c2f47d8dfef6190a047ef5b79b6dbe"
LAT="43.08"
LON="-71.08"

weather=$(curl -sf \
  "https://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LON&appid=$API_KEY&units=imperial"
)

# Fail safely
[ -z "$weather" ] && echo "󰖪 --°" && exit

temp=$(echo "$weather" | jq ".main.temp" | xargs printf "%.0f")
condition=$(echo "$weather" | jq -r ".weather[0].main")

icon=""

case "$condition" in
  Clear)          icon="" ;;
  Clouds)         icon="" ;;
  Rain)           icon="" ;;
  Drizzle)        icon="" ;;
  Thunderstorm)   icon="" ;;
  Snow)           icon="" ;;
  Mist|Fog|Haze)  icon="" ;;
esac

echo "$icon ${temp}°F"
