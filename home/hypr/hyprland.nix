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
      exec-once = "waybar & swww-daemon --format xrgb & copyq --start-server";
      monitor = [
        "eDP-1,2560x1600@240.00301,0x0,1"
        "desc:AOC Q2790 GQMJ7HA001233,2560x1440@59.95,2560x160,1"
        "desc:Samsung Electric Company C34H89x H4ZT900993, 3440x1440@99.98200, 2560x-800, 1"
        # "DP-1,2560x1440@59.95,2560x0,1"
      ];
      plugin = {
        hyprexpo = {
          columns = 3;
          enable_gesture = false;
          workspace_method = "first 1";
        };
      };
      env = [
        "XCURSOR_THEME,phinger-cursors-dark"
        "XCURSOR_SIZE,24"
      ];
      general = {
        border_part_of_window = 0;
        sensitivity = 3.0;
        gaps_in = 15;
        gaps_out = 45;
        border_size = 3;
        "col.inactive_border" = "rgba(00000000)";
        "col.active_border" = "rgba(ffa100ff) rgba(ff2a00ee) 45deg";
      };
      input = {
        repeat_rate = 60;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };
      dwindle = {
        preserve_split = true;
      };
      decoration = {
        rounding = 8;
        active_opacity = 0.9;
        inactive_opacity = 0.7;
        drop_shadow = true;
        shadow_range = 6;
        shadow_render_power = 2;
        "col.shadow" = "0x44000000";
        blur = {
          enabled = true;
          size = 12;
          ignore_opacity = true;
          passes = 3;
          popups = true;
          xray = true;
        };
      };
      misc = {
        disable_hyprland_logo = true;
      };
      animations = {
        enabled = true;
        bezier = [
          "bezier1, 0.05, 0.9, 0.1, 1.0"
          "bezier2, 0.0, 0.1, 0.0, 1.0"
        ];
        animation = [
          "windows, 1, 3, bezier1"
          "windowsOut, 1, 3, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 2, bezier2"
        ];
      };
      windowrule = [
        "float, title:CopyQ"
      ];
      windowrulev2 = [
        "noborder, onworkspace:w[t1]"
      ];
      blurls = [
        #   "waybar"
      ];
      layerrule = [
        "xray,waybar"
      ];
      # Bindings
      "$mod" = "SUPER";
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
      "$w1" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/neon-city-car-view.jpg";
      "$w2" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/windmills.jpg";
      "$w3" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/store.jpg";
      "$w4" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/girl-smoking.jpg";
      "$w5" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/feeling-collide-va-2560x1600.jpg";
      "$w6" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/cityscape-buildings-5k-hn-2560x1600.jpg";
      "$w7" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/palm-trees-cabriolet-minimal-gt-2560x1600.jpg";
      "$w8" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/toyota-explorer-in-nature-embrace-br-2560x1600.jpg";
      "$w9" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/pepe-ascii-art-xr-2560x1600.jpg";
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, S, togglesplit"
        "$mod, O, toggleopaque"
        "$mod, P, pseudo"
        "$mod, C, exec, copyq toggle"
        "$mod, F, fullscreen"
        "$mod SHIFT, F, fakefullscreen"
        " , XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        " , XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        " , XF86AudioMute, exec, pamixer --toggle-mute"
        " , XF86AudioLowerVolume, exec, pamixer --decrease 10"
        " , XF86AudioRaiseVolume, exec, pamixer --increase 10"
        "$mod SHIFT, G, exec, /home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/toggle_gaps.sh"
        "$mod SHIFT, T, exec, /home/shot/.config/nixos/home/hypr/scripts/toggle_theme.sh"
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
        "$mod, grave, hyprexpo:expo, toggle"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod, 1, exec, $w1"
        "$mod, 2, exec, $w2"
        "$mod, 3, exec, $w3"
        "$mod, 4, exec, $w4"
        "$mod, 5, exec, $w5"
        "$mod, 6, exec, $w6"
        "$mod, 7, exec, $w7"
        "$mod, 8, exec, $w8"
        "$mod, 9, exec, $w9"
        "$mod SHIFT, 1, exec, $w1"
        "$mod SHIFT, 2, exec, $w2"
        "$mod SHIFT, 3, exec, $w3"
        "$mod SHIFT, 4, exec, $w4"
        "$mod SHIFT, 5, exec, $w5"
        "$mod SHIFT, 6, exec, $w6"
        "$mod SHIFT, 7, exec, $w7"
        "$mod SHIFT, 8, exec, $w8"
        "$mod SHIFT, 9, exec, $w9"
      ];
    };
  };
}
