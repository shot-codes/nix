# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	./disk-config.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = ["https://hyprland.cachix.org"];
  nix.settings.trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  
  networking.hostName = "GLaDOS";
  networking.networkmanager.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  environment.systemPackages = with pkgs; [
  	git
  	vim
    neovide
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      iosevka
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-code-pro
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
    ];
  
    fontconfig = {
      defaultFonts = {
        serif = [  "IosevkaNerdFont" ];
        sansSerif = [ "IosevkaNerdFont" ];
        monospace = [ "IosevkaNerdFont" ];
      };
    };
  };
  
  services.greetd = {
  	enable = true;
  	restart = false;
  	settings.default_session = {
  		command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
  	#	command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
  		user = "greeter";
  	};
  };
  
  systemd.services.greetd.serviceConfig = {
  	Type = "idle";
  	StandardInput = "tty";
  	StandardOutput = "tty";
  	StandardError = "tty";
  	TTYReset = true;
  	TTYVHangup = true;
  	TTYVTDisallocate = true;
  };
  
  users.users.shot = {
  	isNormalUser = true;
  	extraGroups = [ "networkmanager" "wheel" ];
  };
  
  programs.hyprland = { 
  	enable = true;
  	package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  
  hardware.tuxedo-rs = {
  	enable = true;
  	tailor-gui.enable = true;
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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

