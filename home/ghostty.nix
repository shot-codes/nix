{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 12;
      font-family = "Iosevka";
      theme = "light:Alabaster,dark:iTerm2 Pastel Dark Background";
      window-theme = "auto";
      window-padding-x = 6;
      window-padding-y = 3;
      app-notifications = ["no-config-reload"];
    };
  };
}
