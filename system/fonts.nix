{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      source-code-pro
      nerd-fonts.iosevka
      orbitron
      corefonts # Trebuchet MS (XP title bars)
      wine64Packages.fonts # Tahoma clone (XP UI font)
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["IosevkaNerdFont"];
        sansSerif = ["IosevkaNerdFont"];
        monospace = ["IosevkaNerdFont"];
      };
    };
  };
}
