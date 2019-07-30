#!/bin/sh

#       ___           ___                   
#      /\  \         /\  \                  
#     _\:\  \       /::\  \                 
#    /\ \:\  \     /:/\:\  \                
#   _\:\ \:\  \   /:/ /::\  \   ___     ___ 
#  /\ \:\ \:\__\ /:/_/:/\:\__\ /\  \   /\__\
#  \:\ \:\/:/  / \:\/:/  \/__/ \:\  \ /:/  /
#   \:\ \::/  /   \::/__/       \:\  /:/  / 
#    \:\/:/  /     \:\  \        \:\/:/  /  
#     \::/  /       \:\__\        \::/  /   
#      \/__/         \/__/         \/__/    


# ▰▰▰ symlinks ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
# Symlink config files so programs can be started
# without referencing the cache directly
#
# Includes: zathura, termite, dunst
# ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

mkdir -p  "${HOME}/.config/zathura"
ln -sf    "${HOME}/.cache/wal/zathurarc"    "${HOME}/.config/zathura/zathurarc"

mkdir -p  "${HOME}/.config/termite"
ln -sf    "${HOME}/.cache/wal/termite"    "${HOME}/.config/termite/config"

mkdir -p  "${HOME}/.config/dunst"
ln -sf    "${HOME}/.cache/wal/dunstrc"    "${HOME}/.config/dunst/dunstrc"


# ▰▰▰ dunst ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

# Restart dunst with the new color scheme
pkill dunst
dunst &


# ▰▰▰ sxiv ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

xrdb -override "${HOME}/.cache/wal/sxiv.Xresources"
