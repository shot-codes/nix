{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    hyprshot
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    package = null;
    portalPackage = null;
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    ];
    settings = {
      # exec-once = "waybar & awww-daemon --format xrgb & copyq --start-server & hypridle & swaync";
      exec-once = "waybar & awww-daemon --format xrgb & clipse --listen & hypridle & swaync";
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_DRM_DEVICES,/dev/dri/card1"
        "XCURSOR_THEME,phinger-cursors-dark"
        "XCURSOR_SIZE,24"
        "HYPRSHOT_DIR,/home/shot/Pictures/screenshots"
      ];
      monitor = [
        "desc:Dell Inc. AW3225QF FGB8YZ3,3840x2160@240.00,1440x200,1"
        "desc:AOC Q2790 GQMJ7HA001233,2560x1440@59.95,0x0,1,transform,1"
      ];
      # plugin = {
      #   hyprexpo = {
      #     columns = 3;
      #     enable_gesture = false;
      #     workspace_method = "first 1";
      #   };
      # };
      ecosystem = {
        no_update_news = false;
        no_donation_nag = true;
      };
      general = {
        gaps_in = 8;
        gaps_out = 45;
        border_size = 3;
        "col.inactive_border" = "rgba(00000000)";
        "col.active_border" = "rgba(ffa100ff) rgba(ff2a00ee) 45deg";
      };
      input = {
        sensitivity = 0.7;
        repeat_rate = 60;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };
      cursor = {
        inactive_timeout = 0.75;
        hide_on_key_press = true;
      };
      device = [
        {
          name = "usb-keyboard";
          kb_options = "altwin:swap_alt_win";
        }
        {
          name = "keychron--keychron-k8-version-2";
          kb_options = "altwin:swap_alt_win";
        }
        {
          name = "keychron--keychron-k8-version-2-keyboard";
          kb_options = "altwin:swap_alt_win";
        }
        {
          name = "-keychron-k8-version-2-keyboard";
          kb_options = "altwin:swap_alt_win";
        }
      ];
      dwindle = {
        preserve_split = true;
      };
      group = {
        "col.border_active" = "rgba(ffa100ff) rgba(ff2a00ee) 45deg";
        "col.border_inactive" = "rgba(00000000)";
        groupbar = {
          height = 120;
          render_titles = false;
          rounding = 1;
          "col.active" = "rgba(ffa110ff)";
          "col.inactive" = "rgba(ffa11055)";
        };
      };
      decoration = {
        rounding = 8;
        rounding_power = 4.0;
        active_opacity = 0.9;
        inactive_opacity = 0.7;
        border_part_of_window = false;
        shadow = {
          enabled = true;
          range = 6;
          render_power = 2;
          color = "0x44000000";
        };
        blur = {
          enabled = true;
          size = 12;
          ignore_opacity = true;
          passes = 3;
          popups = true;
          xray = false;
        };
      };
      misc = {
        disable_hyprland_logo = true;
      };
      # debug = {
      #   disable_logs = false;
      # };
      animations = {
        enabled = true;
        bezier = [
          "bezier1, 0.05, 0.9, 0.1, 1.0"
          "bezier2, 0.0, 0.1, 0.0, 1.0"
          "bezier3, 0.84, 0.21, 1.0, 0.67"
        ];
        animation = [
          "windows, 1, 3, bezier1"
          "windowsOut, 1, 3, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 2, default"
        ];
      };
      windowrule = [
        "float on, match:class clipse"
        "center on, match:class clipse"
        "size 600 1000, match:class clipse"
        "dim_around on, match:class clipse"
        "stay_focused on, match:class clipse"
        "border_size 0, match:workspace w[t1]"
      ];
      layerrule = [
        # "xray,waybar"
        # "blur,waybar"
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
      "$w1" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract-0.jpg";
      "$w2" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract-40.jpg";
      "$w3" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract-80.jpg";
      "$w4" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract-120.jpg";
      "$w5" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract-160.jpg";
      "$w6" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract--160.jpg";
      "$w7" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract--120.jpg";
      "$w8" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract--80.jpg";
      "$w9" = "~/.config/nixos/home/hypr/scripts/toggle_gaps/swww.sh ~/.config/nixos/media/wallpapers/abstract--40.jpg";
      bind = [
        # "$mod, Return, exec, kitty"
        "$mod, Return, exec, ghostty --working-directory=/home/shot/"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, A, layoutmsg, togglesplit"
        "$mod, S, layoutmsg, swapsplit"
        "$mod, O, setprop, active opaque toggle"
        "$mod, P, pseudo"
        # "$mod, C, exec, copyq toggle"
        "$mod, C, exec, kitty --class clipse -e 'clipse'"
        "$mod, F, fullscreen"
        "$mod SHIFT, F, fullscreenstate, 0 3"
        " , XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        " , XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        " , XF86AudioMute, exec, pamixer --toggle-mute"
        " , XF86AudioLowerVolume, exec, pamixer --decrease 10"
        " , XF86AudioRaiseVolume, exec, pamixer --increase 10"
        "$mod SHIFT, G, exec, /home/shot/.config/nixos/home/hypr/scripts/toggle_gaps/toggle_gaps.sh"
        "$mod SHIFT, T, exec, /home/shot/.config/nixos/home/hypr/scripts/toggle_theme.sh"
        "$mod SHIFT, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "$mod, PRINT, exec, hyprshot -m region"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod ALT, H, movewindow, l"
        "$mod ALT, L, movewindow, r"
        "$mod ALT, K, movewindow, u"
        "$mod ALT, J, movewindow, d"
        "$mod ALT, Y, movewindoworgroup, l"
        "$mod ALT, O, movewindoworgroup, r"
        "$mod ALT, I, movewindoworgroup, u"
        "$mod ALT, U, movewindoworgroup, d"
        "$mod CTRL, G, togglegroup"
        "$mod CTRL, J, changegroupactive, f"
        "$mod CTRL, K, changegroupactive, b"
        "$mod, SPACE, exec, tofi-drun --drun-launch=true"
        # "$mod, grave, hyprexpo:expo, toggle"
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
