#! /bin/bash

icons_path="$(pwd)/icons"

json=$(cat $icons_path/urban-lights-icon-theme.json)
# Replace all "./svg/word-icon.svg" strings with the actual word and append "-active" to "icon"
icon_colours_json=$(echo "$json" | sed 's/"\.\/svg\/\([a-z0-9_]*\)-icon\.svg"/"\.\/svg\/\1-icon-active.svg"/g')
> $icons_path/urban-lights-icon-theme-colours.json echo "$icon_colours_json"