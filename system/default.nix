{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ./greetd.nix
    ./hyprland.nix
    ./tuxedo.nix
    ./fonts.nix
    ./nvidia.nix
    ./docker.nix
    ./trezor.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = ["https://hyprland.cachix.org"];
  nix.settings.trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  networking.hostName = "GLaDOS";
  networking.networkmanager.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    git
    git-lfs
    vim
    gnumake
    pamixer
    brightnessctl
  ];

  users.users.shot = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };
  nix.settings.trusted-users = ["shot"];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  security.pam.services.hyprlock = {};

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
