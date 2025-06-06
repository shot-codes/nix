{
  pkgs,
  inputs,
  ...
}: {
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
    nemo-with-extensions
    swww
    blender
    unityhub
    swaynotificationcenter
    wl-clipboard
    trezor-suite
    trezord
    telegram-desktop
    gimp
    thunderbird
    devbox
    transmission_4-gtk
    tor-browser-bundle-bin
    cargo-shuttle
    cargo-watch
    qgroundcontrol
    mavproxy
    darktable
    lazydocker
    mods
    glow
    yazi
    openrct2
  ];

  programs.fastfetch.enable = true;
  programs.home-manager.enable = true;

  services.copyq.enable = true;
  services.udiskie.enable = true;

  xdg.desktopEntries = {
    openrct2 = {
      name = "OpenRCT2";
      comment = "An open source re-implementation of RollerCoaster Tycoon 2";
      exec = "openrct2";
      icon = "openrct2";
      terminal = false;
      categories = ["Game" "Simulation"];
    };
  };

  home.stateVersion = "23.11";
}
