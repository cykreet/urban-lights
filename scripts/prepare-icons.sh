#!/bin/bash
# automatically converts icons in the normal icon theme to coloured versions found in the svg folder

# these icons don't have coloured versions, and should therefore just use the
# non-coloured versions
# example: solidity-icon.svg -> solidity
exclusion_list="solidity,sql"

icons_path="$(pwd)/icons"
IFS=',' read -ra excluded_array <<< "$exclusion_list"

json=$(cat "$icons_path/urban-lights-icon-theme.json")

sed_cmd=""
for excluded in "${excluded_array[@]}"; do
	sed_cmd="/$excluded/!{$sed_cmd"
done

sed_cmd="${sed_cmd}s/-icon\.svg\"/-icon-active.svg\"/g"
for excluded in "${excluded_array[@]}"; do
	sed_cmd="${sed_cmd}}"
done

result=$(echo "$json" | sed "$sed_cmd")
echo "$result" > "$icons_path/urban-lights-icon-theme-colours.json"
