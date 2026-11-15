# Windows XP look. Swap this import in home/default.nix to turn the theme off.
# Looks only: keybinds, layouts, waybar modules and scripts are untouched.
{
  config,
  lib,
  pkgs,
  ...
}: let
  p = import ./palette.nix;
  c = p.luna;

  xp-gtk-themes = pkgs.stdenvNoCC.mkDerivation {
    pname = "windows-xp-gtk-themes";
    version = "0-unstable-7637830";
    src = pkgs.fetchFromGitHub {
      owner = "B00merang-Project";
      repo = "Windows-XP";
      rev = "7637830906823af40a3cd7e7079be753d8b7d679";
      hash = "sha256-6fWionYwQidx6VnXPcehQRNG4M71c2VxcVpZgCdBzQc=";
    };
    installPhase = ''
      mkdir -p $out/share/themes
      cp -r Windows\ XP\ * $out/share/themes/
    '';
  };

  # Called by home/hypr/scripts/toggle_theme.sh while this theme is active.
  # Switches between Luna (light) and Royale Noir (dark).
  xp-toggle-theme = pkgs.writeShellScriptBin "xp-toggle-theme" ''
    PREFERS=$(dconf read /org/gnome/desktop/interface/color-scheme | tr -d "'")

    if [ "$PREFERS" == "prefer-dark" ]; then
      scheme=prefer-light; gtk="Windows XP Luna"; bg=light
      active=${c.titleActive}; inactive=${c.titleInactive}; frame=${c.frameDark}
      close=${c.close}; luna=true; noir=false
    else
      scheme=prefer-dark; gtk="Windows XP Royale Dark"; bg=dark
      active=${p.royaleNoir.titleActive}; inactive=${p.royaleNoir.titleInactive}
      frame=${p.royaleNoir.frameDark}; close=${p.royaleNoir.close}; luna=false; noir=true
    fi

    dconf write /org/gnome/desktop/interface/color-scheme "'$scheme'"
    dconf write /org/gnome/desktop/interface/gtk-theme "'$gtk'"

    hyprctl eval "
      hl.config({
          general = { col = { active_border = 'rgb($active)', inactive_border = 'rgb($inactive)' } },
          group = {
              col = { border_active = 'rgb($active)', border_inactive = 'rgb($inactive)' },
              groupbar = { col = { active = 'rgb($active)', inactive = 'rgb($inactive)' } },
          },
          plugin = {
              hyprbars = { bar_color = 'rgb($active)' },
              borders_plus_plus = { col = { border_1 = 'rgb($frame)' } },
          },
      })
      hl.window_rule({ name = 'xp-inactive-luna', enabled = $luna })
      hl.window_rule({ name = 'xp-inactive-noir', enabled = $noir })
    "

    for f in /run/user/$(id -u)/nvim.*; do
      nvim --server "$f" --headless --remote-expr "execute('set background=$bg')" &>/dev/null
    done
  '';
in {
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = [xp-toggle-theme];

  # GTK: Luna theme (gtk.nix stays imported for cursor and Qt settings)
  gtk.theme = lib.mkForce {
    name = "Windows XP Luna";
    package = xp-gtk-themes;
  };
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = lib.mkForce "prefer-light";
    font-name = "${p.fonts.ui} 9";
  };

  # tofi: an XP text field sitting in the taskbar, right of the workspace buttons.
  programs.tofi.settings = lib.mkForce {
    anchor = "bottom-left";
    font = p.fonts.ui;
    font-size = 9;
    horizontal = true;
    width = 800;
    height = 22;
    margin-bottom = 4;
    margin-left = 400;
    padding-top = 2;
    padding-bottom = 0;
    padding-left = 6;
    corner-radius = 0;
    outline-width = 0;
    border-width = 1;
    border-color = "#${c.fieldBorder}";
    result-spacing = 14;
    prompt-text = ''"Run: "'';
    prompt-color = "#${c.selection}";
    background-color = "#FFFFFFFF";
    text-color = "#000000";
    selection-color = "#FFFFFF";
    selection-background = "#${c.selection}";
    selection-background-padding = 3;
  };

  # swaync: XP balloon notifications, layered over the default stylesheet.
  xdg.configFile."swaync/style.css".text = ''
    @import url("file://${pkgs.swaynotificationcenter}/etc/xdg/swaync/style.css");

    :root {
      --cc-bg: #${c.face};
      --noti-border-color: #000000;
      --noti-bg: 255, 255, 225;
      --noti-bg-alpha: 1;
      --noti-bg-darker: #f2f2c8;
      --noti-bg-hover: #fafad0;
      --noti-bg-focus: #f5f5c8;
      --noti-close-bg: #${c.close};
      --noti-close-bg-hover: #f06a52;
      --text-color: #000000;
      --text-color-disabled: #808080;
      --bg-selected: #${c.selection};
      --border-radius: 6px;
      --notification-shadow: 2px 2px 4px rgba(0, 0, 0, 0.45);
      --font-size-body: 12px;
      --font-size-summary: 12px;
    }

    * {
      font-family: "${p.fonts.ui}", sans-serif;
    }

    .notification .summary {
      font-weight: bold;
    }

    .close-button {
      color: #ffffff;
      border-radius: 3px;
    }
  '';
}
