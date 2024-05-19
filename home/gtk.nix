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
    gtk-theme = "Materia-dark-compact";
  };

  services.darkman = {
    enable = true;
    settings = {
      lat = 55.68;
      lng = 12.59;
      usegeoclue = true;
    };
    darkModeScripts = {
      gtk-cheme = ''
        ${pkgs.dconf}/bin/dconf write \
            /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      '';
      gtk-theme = ''
        ${pkgs.dconf}/bin/dconf write \
            /org/gnome/desktop/interface/gtk-theme "'Materia-dark-compact'"
      '';
    };
    lightModeScripts = {
      gtk-scheme = ''
        ${pkgs.dconf}/bin/dconf write \
            /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      '';
      gtk-theme = ''
        ${pkgs.dconf}/bin/dconf write \
            /org/gnome/desktop/interface/gtk-theme "'Materia-light-compact'"
      '';
    };
  };
}
