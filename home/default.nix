{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./hyprland.nix
    ./kitty.nix
    ./neovim.nix
    ./starship.nix
    ./firefox.nix
	./waybar.nix
  ];

  home.username = "shot";
  home.homeDirectory = "/home/shot";
  home.packages = with pkgs; [
    neofetch
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
