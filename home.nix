{ config, pkgs, inputs, ... }:

{
	home.username = "shot";
	home.homeDirectory = "/home/shot";

	home.packages = with pkgs; [
		neofetch
	];

	programs.starship = {
		enable = true;
		settings = {
			aws.disabled = true;
			gcloud.disabled = true;
		};
	};

	programs.kitty = {
		enable = true;
    extraConfig = ''
		window_padding_width 4

		foreground              #cecece
		background              #000000
		selection_foreground    #cecece
		selection_background    #293334
		cursor                  #cd974b
		cursor_text_color       #000000
		url_color               #cd974b
		#: black
		color0                  #000000
		color8                  #777777
		#: red
		color1                  #e25d56
		color9                  #f36868
		#: green
		color2                  #73ca50
		color10                 #88db3f
		#: yellow
		color3                  #e9bf57
		color11                 #f0bf7a
		#: blue
		color4                  #4a88e4
		color12                 #6f8fdb
		#: magenta
		color5                  #915caf
		color13                 #e987e9
		#: cyan
		color6                  #23acdd
		color14                 #4ac9e2
		#: white
		color7                  #cecece
		color15                 #ffffff
		
		active_border_color             #777777
		inactive_border_color           #323738
		bell_border_color               #e97e57
		active_tab_foreground           #cecece
		active_tab_background           #0e1415
		inactive_tab_foreground         #b8b8b8
		inactive_tab_background         #323738 
    '';
	};

	programs.firefox.enable = true;
	
	programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
			gcc
		];
	};

	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
	wayland.windowManager.hyprland.settings = {
		"monitor" = "eDP-1,2560x1600@240.00301,0x0,1";
		"$mod" = "SUPER";
		bind = [
			"$mod, Return, exec, kitty"
			"$mod, f, exec, firefox"
		];
		"general" = {
			"sensitivity" = 3.0;
			"gaps_in" = 2;
		};
		"input" = {
			"repeat_rate" = 60;
			"repeat_delay" = 300;
			"touchpad" = {
				"natural_scroll" = true;
				"clickfinger_behavior" = true;
			};
		};
		"decoration" = {
			"rounding" = 5;
		};
		"misc" = {
				"disable_hyprland_logo" = true;
			};
	};
	wayland.windowManager.hyprland.extraConfig = ''
		animations {
		    enabled = yes
		    bezier = myBezier, 0.05, 0.9, 0.1, 1.0
		    bezier = myBezier2, 0.0, 0.1, 0.0, 1.0
		    animation = windows, 1, 3, myBezier
		    animation = windowsOut, 1, 3, default, popin 80%
		    animation = border, 1, 20, default
		    animation = borderangle, 1, 8, default
		    animation = fade, 1, 7, default
			animation = workspaces, 0, 2, myBezier2
		}
	'';

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
