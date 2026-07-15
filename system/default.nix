{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./greetd.nix
    ./hyprland.nix
    ./fonts.nix
    ./nvidia.nix
    ./docker.nix
    ./trezor.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.substituters = [
    "https://hyprland.cachix.org"
    "https://pi.cachix.org"
    "https://nix-community.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    "pi.cachix.org-1:lGeoGJaZ5ZDabuRzkcD5EBTNnDM4HJ1vqeOxlWk1Flk="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = false;
    device = "nodev";
    useOSProber = true;
  };

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  networking = {
    hostName = "HAL";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
        3000
        3100
        4040
        5173
        5432
        8660
        9090
        49312
      ];
      allowedUDPPorts = [
        14540
        19410
        8888
      ];
      allowedUDPPortRanges = [
        {
          from = 14550;
          to = 14560;
        }
      ];
    };
    hosts = {
      "127.0.0.1" = ["puzzler"];
    };
  };

  services.resolved.enable = true;

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.gvfs.enable = true;

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

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    git
    git-lfs
    vim
    libgcc
    gcc
    gnumake
    pamixer
    brightnessctl
    nix-index
    openrgb
    mullvad-vpn
    qemu
  ];

  users.groups.plugdev = {};
  users.users.shot = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
      "dialout"
    ];
  };
  nix.settings.trusted-users = ["shot"];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.nix-ld.enable = true;

  programs.qgroundcontrol.enable = true;

  # udev rules for crazyflie and px4
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="0101", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0664", GROUP="plugdev"
  '';

  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  security.pam.services.hyprlock = {};
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
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
  system.stateVersion = "25.11"; # Did you read the comment?
}
