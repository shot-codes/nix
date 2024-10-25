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
    trezor-suite
    trezord
    telegram-desktop
    gimp
    thunderbird
    devbox
    transmission_4-gtk
    tor-browser-bundle-bin
    qgroundcontrol
    mavproxy
  ];

  programs.fastfetch.enable = true;
  programs.home-manager.enable = true;

  services.copyq.enable = true;

  home.stateVersion = "23.11";
}
