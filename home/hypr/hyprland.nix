{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    settings = {
      exec-once = "waybar";
      monitor = "eDP-1,2560x1600@240.00301,0x0,1";
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, S, togglesplit"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod ALT, H, movewindow, l"
        "$mod ALT, L, movewindow, r"
        "$mod ALT, K, movewindow, u"
        "$mod ALT, J, movewindow, d"
        "$mod, SPACE, exec, tofi-drun --drun-launch=true"
        "$mod SHIFT, SPACE, exec, tofi-drun | awk '{sub(/ --name.*/, \"\"); print}' | xargs hyprctl dispatch exec nvidia-offload "
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, grave, hyprexpo:expo, toggle"
        "$mod, 1, exec, swww img ~/.config/nixos/media/wallpapers/neon-city-car-view.jpg --transition-step 8 --transition-fps 120"
        "$mod, 2, exec, swww img ~/.config/nixos/media/wallpapers/windmills.jpg --transition-step 8 --transition-fps 120"
      ];
      binde = [
        "$mod SHIFT, L, resizeactive, 40 0"
        "$mod SHIFT, H, resizeactive, -40 0"
        "$mod SHIFT, J, resizeactive, 0 40"
        "$mod SHIFT, K, resizeactive, 0 -40"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      plugin = {
        hyprexpo = {
          columns = 3;
          enable_gesture = false;
          workspace_method = "first 1";
        };
      };
      general = {
        border_part_of_window = 0;
        sensitivity = 3.0;
        gaps_in = 10;
        gaps_out = 40;
        border_size = 2;
        "col.inactive_border" = "0x00000000";
        "col.active_border" = "0xffffffff";
      };
      input = {
        repeat_rate = 60;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };
      decoration = {
        rounding = 8;
        active_opacity = 0.9;
        inactive_opacity = 0.7;
        drop_shadow = true;
        shadow_range = 4;
        blur = {
          enabled = true;
          size = 12;
          passes = 3;
          ignore_opacity = true;
          popups = true;
          xray = true;
        };
      };
      misc = {
        disable_hyprland_logo = true;
      };
    };
    extraConfig = ''
      animations {
          enabled = yes
          bezier = myBezier, 0.05, 0.9, 0.1, 1.0
          bezier = myBezier2, 0.0, 0.1, 0.0, 1.0
          animation = windows, 1, 3, myBezier
          animation = windowsOut, 1, 3, default, popin 80%
          animation = border, 1, 20, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
      	animation = workspaces, 0, 2, myBezier2
      }
    '';
  };
}
