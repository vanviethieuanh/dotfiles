#!/bin/bash

escape_pango() {
  sed -e 's/&/\&amp;/g' \
      -e 's/</\&lt;/g' \
      -e 's/>/\&gt;/g'
}

player_name=$(playerctl metadata --format '{{playerName}}')
player_status=$(playerctl status)

if [[ "$player_status" == "Playing" ]]; then
  song_info=$(playerctl metadata --format '󰎇 {{title}} {{artist}}')
fi

if [[ "$player_status" == "Paused" ]]; then
  song_info=$(playerctl metadata --format ' {{title}} {{artist}}')
fi


echo "$song_info" | escape_pango
