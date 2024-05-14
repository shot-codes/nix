{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  wayland.windowManager.hyprland.settings = {
    "exec-once" = "waybar";
    "monitor" = "eDP-1,2560x1600@240.00301,0x0,1";
    "$mod" = "SUPER";
    bind = [
      "$mod, Return, exec, kitty"
      "$mod, f, exec, firefox"
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
    general = {
      "sensitivity" = 3.0;
      "gaps_in" = 2;
      "gaps_out" = 0;
    };
    "input" = {
      "repeat_rate" = 60;
      "repeat_delay" = 300;
      "touchpad" = {
        "natural_scroll" = true;
        "clickfinger_behavior" = true;
      };
    };
    "decoration" = {
      "rounding" = 5;
    };
    "misc" = {
      "disable_hyprland_logo" = true;
    };
  };
  wayland.windowManager.hyprland.extraConfig = ''
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
}