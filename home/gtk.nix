{pkgs, ...}: {
  home.packages = [pkgs.glib];

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
