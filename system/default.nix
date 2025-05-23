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

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 9;
      consoleMode = "max";
      editor = false;
    };
    timeout = 0;
  };

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  networking = {
    hostName = "GLaDOS";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 3000 3100 4040 5173 5432 8660 9090 49312];
    };
    hosts = {
      "192.168.0.24" = ["puzzler"];
      "192.168.0.102" = ["puzzlerhome"];
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    git
    git-lfs
    vim
    gnumake
    pamixer
    brightnessctl
    nix-index
  ];

  users.groups.plugdev = {};
  users.users.shot = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "plugdev" "dialout"];
  };
  nix.settings.trusted-users = ["shot"];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.nix-ld.enable = true;

  # udev rules for crazyflie and px4
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="0101", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0664", GROUP="plugdev"
  '';

  security.pam.services.hyprlock = {};

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
