{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    # plugins = [
    #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    # ];
  };
}
