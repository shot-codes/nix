{pkgs, ...}: {
  home.packages = [pkgs.glib];
  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark-compact";
      package = pkgs.materia-theme;
    };
  };
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
