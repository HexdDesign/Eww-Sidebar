#!/usr/bin/env bash

API_KEY=
LAT=
LON=

weather=$(curl -sf \
  "https://api.openweathermap.org"
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
