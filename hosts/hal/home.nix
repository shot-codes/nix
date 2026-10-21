{lib, ...}: {
  wayland.windowManager.hyprland.extraConfig = lib.mkBefore (builtins.readFile ./hyprland.lua);

  home.stateVersion = "25.11";
}
