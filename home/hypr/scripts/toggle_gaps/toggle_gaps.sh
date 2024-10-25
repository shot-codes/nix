GAPS_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/gaps_state.txt
WALLPAPER_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/wallpaper_state.txt

GAPS_STATE=$(cat "$GAPS_STATE_FILE")
WALLPAPER_STATE=$(cat "$WALLPAPER_STATE_FILE")

if [ "$GAPS_STATE" == "enabled" ]; then
	swww img ~/.config/nixos/media/wallpapers/black.jpg --transition-step 90 --transition-fps 120
    hyprctl --batch "\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword general:col.inactive_border rgba(303030ff);\
        keyword decoration:active_opacity 1.0;\
        keyword decoration:inactive_opacity 1.0;\
        keyword decoration:dim_inactive true;\
        keyword decoration:dim_strength 0.1;\
        keyword decoration:rounding 0"
	echo "disabled" >"$GAPS_STATE_FILE"
    sleep 0.1
    hyprctl "keyword animations:enabled false"
else
	swww img "$WALLPAPER_STATE" --transition-step 15 --transition-fps 120
    hyprctl --batch "\
        keyword animations:enabled true;\
        keyword decoration:drop_shadow 1;\
        keyword decoration:blur:enabled 1;\
        keyword general:gaps_in 8;\
        keyword general:gaps_out 45;\
        keyword general:border_size 3;\
        keyword general:col.inactive_border rgba(00000000);\
        keyword decoration:active_opacity 0.9;\
        keyword decoration:inactive_opacity 0.7;\
        keyword decoration:dim_inactive 0;\
        keyword decoration:rounding 8"
	echo "enabled" >"$GAPS_STATE_FILE"
fi
