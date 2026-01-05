#!/bin/sh

gamma=$(hyprctl hyprsunset gamma)
temp=$(hyprctl hyprsunset temperature)

tooltip="Gamma: $gamma | Temperature: $temp"

# TODO: when hyprsunset support print profile
# change icon coordinated
#
# if [[ condition ]]; then
#
# fi

jq -n \
  --unbuffered --compact-output \
  --arg gamma "$gamma" \
  --arg temp "$temp" \
  '{
    text: (( $gamma | tonumber | round ) | tostring),
    tooltip: ("Gamma: \(( $gamma | tonumber | round )) | Temperature: \(( $temp | tonumber | round ))")
  }'
