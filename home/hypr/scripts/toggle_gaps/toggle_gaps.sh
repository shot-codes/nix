#!/usr/bin/env bash

GAPS_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/gaps_state.txt
WALLPAPER_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/wallpaper_state.txt

GAPS_STATE=$(cat "$GAPS_STATE_FILE")
WALLPAPER_STATE=$(cat "$WALLPAPER_STATE_FILE")

if [ "$GAPS_STATE" == "enabled" ]; then
    hyprctl eval "hl.config({
        general = {
            gaps_in = 0,
            gaps_out = 0,
            border_size = 1,
            col = { inactive_border = 'rgba(303030ff)' },
        },
        decoration = {
            shadow = { enabled = false },
            blur = { enabled = false },
            active_opacity = 1.0,
            inactive_opacity = 1.0,
            dim_inactive = true,
            dim_strength = 0.1,
            rounding = 0,
        },
    })"
    echo "disabled" >"$GAPS_STATE_FILE"
    sleep 0.1
    hyprctl eval "hl.config({ animations = { enabled = false } })"
    awww img ~/.config/nixos/media/wallpapers/black.jpg --transition-step 15 --transition-fps 120
else
    hyprctl eval "hl.config({
        animations = { enabled = true },
        general = {
            gaps_in = 8,
            gaps_out = 45,
            border_size = 3,
            col = { inactive_border = 'rgba(00000000)' },
        },
        decoration = {
            shadow = { enabled = true },
            blur = { enabled = true },
            active_opacity = 0.9,
            inactive_opacity = 0.7,
            dim_inactive = false,
            rounding = 8,
        },
    })"
    echo "enabled" >"$GAPS_STATE_FILE"
    awww img "$WALLPAPER_STATE" --transition-step 15 --transition-fps 120
fi
