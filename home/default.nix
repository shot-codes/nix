{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./zsh.nix
    ./hypr/hyprland.nix
    # ./hypr/hyprpaper.nix
    # ./hypr/hyprcursor.nix
    ./hypr/hyprlock.nix
    ./hypr/hypridle.nix
    ./kitty.nix
    ./neovim
    ./firefox.nix
    ./waybar.nix
    ./tofi.nix
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

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };
  programs.fastfetch.enable = true;
  programs.home-manager.enable = true;

  services.copyq.enable = true;

  home.stateVersion = "23.11";
}
