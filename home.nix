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

	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
	wayland.windowManager.hyprland.settings = {
		"monitor" = "eDP-1,2560x1600@240.00301,0x0,1";
		"$mod" = "SUPER";
		bind = [
			"$mod, Return, exec, kitty"
			"$mod, f, exec, firefox"
		];
	};

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
