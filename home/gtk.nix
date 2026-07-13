{pkgs, ...}: {
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
  home.packages = with pkgs; [
    glib
    kdePackages.qt6ct
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "kvantum";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark-compact";
      package = pkgs.materia-theme;
    };
    cursorTheme = {
      name = "phinger-cursors";
      package = pkgs.phinger-cursors;
      size = 24;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme = "Materia-dark-compact";
  };
}
