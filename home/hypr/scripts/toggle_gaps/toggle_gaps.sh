GAPS_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/gaps_state.txt
WALLPAPER_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/wallpaper_state.txt

GAPS_STATE=$(cat "$GAPS_STATE_FILE")
WALLPAPER_STATE=$(cat "$WALLPAPER_STATE_FILE")

if [ "$GAPS_STATE" == "enabled" ]; then
	swww img ~/.config/nixos/media/wallpapers/black.jpg --transition-step 90 --transition-fps 120
	hyprctl keyword general:gaps_in 0
	hyprctl keyword general:gaps_out 0
	hyprctl keyword decoration:rounding 0
	hyprctl keyword general:border_size 3
	hyprctl keyword general:col.active_border "rgba(ffa100ff) rgba(ff2a00ee) 45deg"
	hyprctl keyword general:col.inactive_border "rgba(202020ff)"
	hyprctl keyword decoration:active_opacity 1.0
	hyprctl keyword decoration:inactive_opacity 1.0
	hyprctl keyword decoration:blur:enabled false
	hyprctl keyword decoration:drop_shadow no
	echo "disabled" >"$GAPS_STATE_FILE"
else
	#swww img ~/.config/nixos/media/wallpapers/girl-smoking.jpg --transition-step 15 --transition-fps 120
	echo "$WALLPAPER_STATE"
	#swww img "$WALLPAPER_STATE" --transition-step 15 --transition-fps 120
	swww img "$WALLPAPER_STATE" --transition-step 15 --transition-fps 120
	hyprctl keyword general:gaps_in 15
	hyprctl keyword general:gaps_out 45
	hyprctl keyword decoration:rounding 5
	hyprctl keyword general:border_size 0
	hyprctl keyword general:col.inactive_border "rgba(00000000)"
	hyprctl keyword group:col.border_inactive "rgba(20202000)"
	hyprctl keyword group:groupbar:col.inactive "rgba(70207000)"
	hyprctl keyword decoration:active_opacity 0.9
	hyprctl keyword decoration:inactive_opacity 0.7
	hyprctl keyword decoration:blur:enabled true
	hyprctl keyword decoration:drop_shadow yes
	echo "enabled" >"$GAPS_STATE_FILE"
	# swww img ~/Documents/images/wallpapers/1.jpg --transition-step 10 --transition-fps 120
fi
