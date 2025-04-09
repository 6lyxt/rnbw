#!/bin/bash

colors=(
  $'\e[31m'  # Red
  $'\e[33m'  # Yellow
  $'\e[32m'  # Green
  $'\e[36m'  # Cyan
  $'\e[34m'  # Blue
  $'\e[35m'  # Magenta
)
reset=$'\e[0m'

rainbow_text() {
  local text="$1"
  local color_index=0
  local colored_output=""

  for word in $text; do
    colored_output+="${colors[$((color_index % ${#colors[@]}))]}$word $reset"
    ((color_index++))
  done

  echo -e "$colored_output"
}

if [ -z "$1" ]; then
  echo "Usage: rainbow <command> [arguments...]"
  exit 1
fi

# Run the command and stream its output line by line
"$@" | while IFS= read -r line; do
  rainbow_text "$line"
done