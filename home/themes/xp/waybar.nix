# XP taskbar look for waybar. Layers on top of home/waybar.nix: all modules and
# behaviour come from there; this only adds the Start button and replaces the CSS.
{lib, ...}: let
  p = import ./palette.nix;
  c = p.luna;
  nixSnowflake = builtins.fromJSON ''""''; # nf-linux-nixos
in {
  programs.waybar = {
    settings.mainBar = {
      height = lib.mkForce 30;
      spacing = lib.mkForce 0;
      modules-left = lib.mkBefore ["custom/start"];
      "custom/start" = {
        format = "${nixSnowflake}  start";
        on-click = "tofi-drun --drun-launch=true";
        tooltip = false;
      };
    };

    style = lib.mkForce ''
      * {
        font-family: "${p.fonts.ui}", "Iosevka Nerd Font", sans-serif;
        font-size: 12px;
        min-height: 0;
        padding: 0;
        margin: 0;
        border: none;
        border-radius: 0;
      }

      /* Glossy Luna taskbar */
      window#waybar {
        color: #ffffff;
        background: linear-gradient(to bottom,
          #1f2f86 0%, #3165c4 3%, #3682e5 6%, #4490e6 10%, #3883e5 12%,
          #2b71e0 15%, #2663da 18%, #235bd6 20%, #2258d5 23%, #2157d6 38%,
          #245ddb 54%, #2562df 86%, #245fdc 89%, #2158d4 92%, #1d4ec0 95%,
          #1941a5 100%);
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      tooltip {
        background: #${c.balloon};
        border: 1px solid #000000;
        border-radius: 6px;
      }
      tooltip label {
        color: #000000;
        font-family: "${p.fonts.ui}";
        padding: 2px 4px;
      }

      /* Start button */
      #custom-start {
        font-family: "${p.fonts.title}", "Iosevka Nerd Font";
        font-size: 17px;
        font-style: italic;
        font-weight: bold;
        color: #ffffff;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
        padding: 0 26px 0 12px;
        margin-right: 10px;
        border-radius: 0 12px 12px 0;
        background: linear-gradient(to bottom,
          #388e38 0%, #57c157 8%, #48b548 20%, #3c9e3c 50%, #379637 80%,
          #2b7f2b 92%, #1f5f1f 100%);
        box-shadow: inset -3px 0 4px rgba(0, 0, 0, 0.35),
                    inset 0 1px 1px rgba(255, 255, 255, 0.35);
      }
      #custom-start:hover {
        background: linear-gradient(to bottom,
          #47a047 0%, #6ad46a 8%, #59c659 20%, #4cb04c 50%, #46a646 80%,
          #378f37 92%, #2a6f2a 100%);
      }

      /* Workspaces as taskbar buttons */
      #workspaces {
        margin: 0 2px;
      }
      #workspaces button {
        color: #ffffff;
        min-width: 26px;
        margin: 3px 1px;
        padding: 0 4px;
        border-radius: 3px;
        background: #${c.taskButton};
        box-shadow: inset 1px 1px 0 rgba(255, 255, 255, 0.35),
                    inset -1px -1px 0 rgba(0, 0, 0, 0.25);
        text-shadow: none;
        transition: none;
      }
      #workspaces button:hover {
        background: #53a3ff;
      }
      #workspaces button.active {
        background: #${c.taskButtonActive};
        box-shadow: inset 1px 1px 2px rgba(0, 0, 0, 0.6);
      }
      #workspaces button.urgent {
        background: #e8a33c;
      }

      /* Notification area */
      .modules-right {
        padding: 0 8px 0 6px;
        border-left: 1px solid #${c.trayBorder};
        box-shadow: inset 1px 0 1px #18bbff;
        background: linear-gradient(to bottom,
          #0c59b9 1%, #139ee9 6%, #18b5f2 10%, #139beb 14%, #1290e8 19%,
          #0d8dea 63%, #0d9ff1 81%, #0f9eed 88%, #119be9 91%, #1392e2 94%,
          #137ed7 97%, #095bc9 100%);
      }

      #tray,
      #pulseaudio,
      #network,
      #cpu,
      #temperature,
      #memory,
      #backlight,
      #battery,
      #custom-swaylock,
      #clock,
      #idle_inhibitor {
        color: #ffffff;
        padding: 0 5px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.35);
      }

      #clock {
        padding: 0 8px;
      }

      #custom-swaylock:hover,
      #pulseaudio:hover {
        background: rgba(255, 255, 255, 0.15);
      }

      #idle_inhibitor {
        border-radius: 3px;
        margin: 4px 0;
      }
      #idle_inhibitor.activated {
        background: #${c.close};
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }

      @keyframes blink {
        to {
          color: #ff4040;
        }
      }
      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
