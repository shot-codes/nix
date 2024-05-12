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
	};

	programs.firefox.enable = true;
	
	programs.neovim = {
		enable = true;
		defaultEditor = true;
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
	};

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
