#!/usr/bin/env sh

# This script is used to set a wallpaper

WALLPAPERS_DIR="$HOME/Pictures/wallpapers"


# check arguments
if [ -z "$1" ]; then
   printf "Use: wal-set <tags>...\n"
   exit 1;
fi

wallpaper=$("$HOME/scripts/wallpaper-manager/wal-tag.sh" query "$WALLPAPERS_DIR/" "$@" | shuf -n 1)
if ! [ -e "$wallpaper" ]; then
   printf "Couldn't find any wallpaper with the specified tags\n"
   exit 2;
fi


if [ "$("$HOME/scripts/wallpaper-manager/wal-prop.sh" get "$wallpaper" multi-monitor)" = "true" ]; then
   multi_monitor="--no-xinerama"
else
   multi_monitor=
fi

if [ -n "$("$HOME/scripts/wallpaper-manager/wal-prop.sh" get "$wallpaper" saturation)" ]; then
   saturation="--saturate $("$HOME/scripts/wallpaper-manager/wal-prop.sh" get "$wallpaper" saturation)"
else
   saturation=
fi

if [ -n "$("$HOME/scripts/wallpaper-manager/wal-prop.sh" get "$wallpaper" backend)" ]; then
   backend="$("$HOME/scripts/wallpaper-manager/wal-prop.sh" get "$wallpaper" backend)"
else
   backend="wal"
fi


wal \
   -i "$wallpaper" \
   -o "$HOME/.config/wal/done.sh" \
   -n \
   --backend "$backend" \
   $saturation

feh \
  "$wallpaper" \
  --bg-fill \
  $multi_monitor