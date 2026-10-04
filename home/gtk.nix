{
  config,
  pkgs,
  ...
}: {
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
    gtk4.theme = null;
    theme = {
      # name = "adw-gtk3-dark";
      # package = pkgs.adw-gtk3;
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };
    cursorTheme = {
      name = "phinger-cursors";
      package = pkgs.phinger-cursors;
      size = 24;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme = config.gtk.theme.name;
  };
}
