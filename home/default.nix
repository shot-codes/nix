{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./hypr/hyprland.nix
    # ./hypr/hyprpaper.nix
    ./hypr/hyprcursor.nix
    ./hypr/hyprlock.nix
    ./hypr/hypridle.nix
    ./kitty.nix
    ./neovim
    ./firefox.nix
    ./waybar_blur.nix
    # ./tofi.nix
    ./tofi_blur.nix
    ./gtk.nix
  ];

  home.username = "shot";
  home.homeDirectory = "/home/shot";
  home.packages = with pkgs; [
    swww
    blender
    wl-clipboard
    just
    trezor-suite
    trezord
    telegram-desktop
  ];

  programs.fastfetch.enable = true;
  programs.home-manager.enable = true;

  services.copyq.enable = true;

  home.stateVersion = "23.11";
}
