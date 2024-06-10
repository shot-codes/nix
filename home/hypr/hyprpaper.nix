{...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = ["/home/shot/.config/nixos/media/glitch.jpg"];

      wallpaper = [
        "eDP-1,/home/shot/.config/nixos/media/glitch.jpg"
      ];
    };
  };
}
