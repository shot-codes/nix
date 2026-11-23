{
  inputs,
  pkgs,
  ...
}: let
  hyprPkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  # Hyprland is built against its own nixpkgs (older glibc), so it can't load mesa
  # drivers built against ours. Use mesa from Hyprland's nixpkgs system-wide.
  hardware.graphics = {
    package = hyprPkgs.mesa;
    package32 = hyprPkgs.pkgsi686Linux.mesa;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # plugins = [
    #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    # ];
  };

  # HyprCapture records fullscreen/region video with gpu-screen-recorder when it's installed.
  # The module also adds the setcap wrapper for gsr-kms-server, so recording needs no password prompt.
  programs.gpu-screen-recorder.enable = true;
}
