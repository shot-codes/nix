{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 3;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = false;
          fade_on_empty = false;
          font_color = "rgb(200, 200, 200)";
          inner_color = "rgba(0, 0, 0, 0.4)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 0;
          placeholder_text = "<span foreground=\"##cad3f5\"></span>";
          shadow_passes = 1;
          shadow_size = 3;
          shadow_boost = 0.3;
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
          color = "rgb(222, 222, 222)";
          font_size = 120;
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
