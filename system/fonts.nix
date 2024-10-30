{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      source-code-pro
      (nerdfonts.override {fonts = ["Iosevka"];})
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
