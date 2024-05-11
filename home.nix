{ config, pkgs, ... }:

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

	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.settings = {
		"$mod" = "SUPER";
		bind = [
			"$mod, Return, exec, kitty"
			"$mod, f, exec, firefox"
		];
	};

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
