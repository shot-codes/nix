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

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
