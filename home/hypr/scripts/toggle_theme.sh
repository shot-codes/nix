PREFERS=$(dconf read /org/gnome/desktop/interface/color-scheme | tr -d "'")

if [ "$PREFERS" == "prefer-light" ]; then
	# hyprctl keyword general:col.active_border "rgba(ffa100ff) rgba(ff2a00ff) 45deg"
	echo "font_family Iosevka NF" >/home/shot/.config/kitty/font.conf
	kitten themes --reload-in=all --cache-age=-1 --config-file-name /home/shot/.config/kitty/theme.conf Alabaster Dark Custom
    pkill -SIGUSR1 '.kitty-wrapped'
	dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
	dconf write /org/gnome/desktop/interface/gtk-theme "'Materia-dark-compact'"
	hyprctl keyword general:col.active_border "rgba(ffa100ff) rgba(ff2a00ee) 45deg"
    hyprctl keyword group:col.border_active "rgba(ffa100ff) rgba(ff2c00ee) 45deg"
	hyprctl keyword group:groupbar:col.active "rgba(ffa100ff)"
	hyprctl keyword group:groupbar:col.inactive "rgba(ffa10055)"
	for f in /run/user/1000/nvim.*; do nvim --server "$f" --headless --remote-expr 'execute("set background=dark")' &>/dev/null; done
else
	# hyprctl keyword general:col.active_border "rgba(33ccffff) rgba(00ff99ff) 45deg"
	echo "font_family Iosevka NF Bold" >/home/shot/.config/kitty/font.conf
	kitten themes --reload-in=all --cache-age=-1 --config-file-name /home/shot/.config/kitty/theme.conf Alabaster Custom
    pkill -SIGUSR1 '.kitty-wrapped'
	dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
	dconf write /org/gnome/desktop/interface/gtk-theme "'Materia-light-compact'"
	# hyprctl keyword general:col.active_border "rgba(00000000)"
	hyprctl keyword general:col.active_border "rgba(00f1ffff) rgba(002cffee) 45deg"
	hyprctl keyword group:col.border_active "rgba(00f1ffff) rgba(002cffee) 45deg"
	hyprctl keyword group:groupbar:col.active "rgba(00f1ffff)"
	hyprctl keyword group:groupbar:col.inactive "rgba(00f1ff55)"
	for f in /run/user/1000/nvim.*; do nvim --server "$f" --headless --remote-expr 'execute("set background=light")' &>/dev/null; done
fi
