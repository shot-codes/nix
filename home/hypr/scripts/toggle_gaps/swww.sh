WALLPAPER_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/wallpaper_state.txt
GAPS_STATE_FILE=/home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/gaps_state.txt

GAPS_STATE=$(cat "$GAPS_STATE_FILE")
WALLPAPER_STATE=$(cat "$WALLPAPER_STATE_FILE")

if [ "$GAPS_STATE" == "enabled" ]; then
	echo $1
	echo $1 >"$WALLPAPER_STATE_FILE"
	echo $1
	swww img "$1" --transition-step 10 --transition-duration 3 --transition-fps 60
fi
