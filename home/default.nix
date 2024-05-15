{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./hypr/hyprland.nix
    ./hypr/hyprpaper.nix
    ./kitty.nix
    ./neovim.nix
    ./starship.nix
    ./firefox.nix
    ./waybar.nix
    ./tofi.nix
  ];

  home.username = "shot";
  home.homeDirectory = "/home/shot";
  home.packages = with pkgs; [
    neofetch
    swww
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
