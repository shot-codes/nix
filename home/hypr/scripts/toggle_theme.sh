PREFERS=$(dconf read /org/gnome/desktop/interface/color-scheme | tr -d "'")

if [ "$PREFERS" == "prefer-light" ]; then
	# hyprctl keyword general:col.active_border "rgba(ffa100ff) rgba(ff2a00ff) 45deg"
	echo "font_family Iosevka NF" >/home/shot/.config/kitty/font.conf
	kitten themes --reload-in=all --cache-age=-1 --config-file-name /home/shot/.config/kitty/theme.conf Alabaster Dark Custom
	dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
	dconf write /org/gnome/desktop/interface/gtk-theme "'Materia-dark-compact'"
	for f in /run/user/1000/nvim.*; do nvim --server "$f" --headless --remote-expr 'execute("set background=dark")' &>/dev/null; done
else
	# hyprctl keyword general:col.active_border "rgba(33ccffff) rgba(00ff99ff) 45deg"
	echo "font_family Iosevka NF Bold" >/home/shot/.config/kitty/font.conf
	kitten themes --reload-in=all --cache-age=-1 --config-file-name /home/shot/.config/kitty/theme.conf Alabaster Custom
	dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
	dconf write /org/gnome/desktop/interface/gtk-theme "'Materia-light-compact'"
	for f in /run/user/1000/nvim.*; do nvim --server "$f" --headless --remote-expr 'execute("set background=light")' &>/dev/null; done
fi
