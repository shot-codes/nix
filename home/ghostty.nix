{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 11;
      font-family = "Iosevka";
      theme = "light:Rose Pine Dawn,dark:Rose Pine";
      window-theme = "auto";
      window-padding-x = 6;
      window-padding-y = 3;
      title = "ghost";
    };
  };
}
