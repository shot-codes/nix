{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./sops.nix
    ./greetd.nix
    ./hyprland.nix
    ./fonts.nix
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

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  networking = {
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
    gui.enable = true;
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
    sops
    age
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
}
