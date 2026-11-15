# Windows XP colour palette. Hex without '#', so it can be used both as
# CSS (#${c}) and as Hyprland colours (rgb(${c})).
{
  fonts = {
    ui = "Tahoma"; # wine-fonts clone, see system/fonts.nix
    title = "Trebuchet MS"; # corefonts
  };

  # Luna (Blue): the default, light look
  luna = {
    titleActive = "0058EE";
    titleInactive = "7A96DF";
    frameDark = "001EA0";
    titleText = "FFFFFF";
    titleTextInactive = "D8E4F8";
    close = "E0472E";
    button = "2B6BF5";
    buttonInactive = "9DB0E8";
    taskbar = "245EDC";
    taskButton = "3C81F3";
    taskButtonActive = "1E52B7";
    start = "3C9E3C";
    tray = "0F8EEE";
    trayBorder = "092E51";
    face = "ECE9D8"; # classic window body / dialog colour
    selection = "316AC5";
    fieldBorder = "7F9DB9";
    balloon = "FFFFE1";
  };

  # Royale Noir: the dark variant, used by the light/dark toggle
  royaleNoir = {
    titleActive = "1E1E1E";
    titleInactive = "5A5A5A";
    frameDark = "000000";
    titleText = "FFFFFF";
    titleTextInactive = "BBBBBB";
    close = "C0392B";
    button = "3A3A3A";
    buttonInactive = "6A6A6A";
  };
}
