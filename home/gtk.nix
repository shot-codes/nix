{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Materia-light-compact";
      package = pkgs.materia-theme;
    };
  };
}
