#!/bin/bash

wallpapers_dir="$HOME/Pictures/wallpapers/"

build_theme() {
  rows=$1
  cols=$2
  icon_size=$3

  echo "element{orientation:vertical;}element-text{horizontal-align:0.5;}element-icon{size:${icon_size}.0000em;}listview{lines:${rows};columns:${cols};}"
}

theme="$HOME/.config/rofi/scripts/wallpaper/style.rasi"

rofi_cmd="rofi -dmenu -i -show-icons -theme-str $(build_theme 4 3 12) -theme ${theme}"

choice=$(
  find "$wallpapers_dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) |
    sort |
    while read -r A; do
      filename=$(basename "$A")
      echo -en "$filename\x00icon\x1f$A\n"
    done |
    $rofi_cmd
)

if [ -z "$choice" ]; then
  exit 1
fi

WALLPAPER="$wallpapers_dir/$choice"

# Set wallpaper using swww with transition effects
swww img "$WALLPAPER" \
  --transition-type any \
  --transition-duration 2 \
  --transition-step 255 \
  --transition-fps 60 &&
  notify-send "Wallpaper Changed" -i "$WALLPAPER" --app-name=swww

# matugen or pywal/hellway
# matugen image "$WALLPAPER"
# pywal -i "$WALLPAPER"
# hellwal -i "$WALLPAPER"

exit 0
