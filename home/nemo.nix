{pkgs, ...}: {
  home.packages = with pkgs; [
    nemo-with-extensions
  ];
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    genericName = "File Manager";
    categories = ["Application"];
    terminal = false;
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["nemo.desktop"];
      "application/x-gnome-saved-search" = ["nemo.desktop"];
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "kitty";
        # exec-arg = ""; # argument
      };
      "org/cinnamon/nemo/preferences" = {
        default-folder-viewer = "list-view";
      };
    };
  };
}
