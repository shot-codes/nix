{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 8;
        spacing = 4;
        modules-left = ["hyprland/workspaces"];
        modules-right = ["tray" "pulseaudio" "network" "cpu" "temperature" "memory" "backlight" "battery" "custom/swaylock" "clock" "idle_inhibitor"];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
          };
        };
        "custom/swaylock" = {
          format = "LOCK";
          on-click = "swaylock -f";
          tooltip = false;
        };
        idle_inhibitor = {
          format = "{icon} ";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          spacing = 10;
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "CPU {usage}%";
          tooltip = false;
        };
        memory = {
          format = "MEM {}%";
        };
        temperature = {
          critical-threshold = 80;
          format-critical = "{temperatureC}°C 🔥";
          format = "{temperatureC}°C";
          tooltip = "false";
        };
        backlight = {
          format = "BL {percent}%";
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "BAT {capacity}%";
          format-charging = "BAT-CH {capacity}%";
          format-plugged = "BAT_PL {capacity}% ";
          format-alt = "{time}";
        };
        network = {
          format-wifi = "NET {essid} ({signalStrength}%)";
          format-ethernet = "NET {ipaddr}/{cidr}  ";
          tooltip-format = "{ifname} via {gwaddr}  ";
          format-linked = "NET {ifname} (No IP)  ";
          format-disconnected = "Disconnected";
          format-alt = "NET {ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "VOL {volume}%";
          format-bluetooth = "VOL-BT {volume}%";
          format-bluetooth-muted = "VOL-BL-MUT";
          format-muted = "VOL-MUT{format_source}";
          format-source = "MIC {volume}%";
          format-source-muted = "MIC-MUT";
          on-click = "pavucontrol";
        };
        "custom/media" = {
          format = "{icon} {}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };
      };
    };
    style = ''
        * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: Iosevka, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 13px;
            min-height: 0;
      padding: 0px;
        }

        window#waybar {
            background-color: rgba(0, 0, 0, 1.0);
            color: #cccccc;
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.1;
        }

        button {
            /* Use box-shadow instead of border so the text isn't offset */
            /* box-shadow: inset 0 -3px transparent; */
            /* Avoid rounded borders under each button name */
            background-color: transparent;
            border-radius: 0px;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        #workspaces button:hover {
          border-color: rgba(0,0,0,0);
          box-shadow: none; /* Remove predefined box-shadow */
          text-shadow: none; /* Remove predefined text-shadow */
          background: none; /* Remove predefined background color (white) */
          transition: none; /* Disable predefined animations */
        }
        #workspaces {
          border-radius: 0px;
        }

        #workspaces button {
          color: #cccccc;
          padding: 4px 0px;
        }

        #workspaces button:hover {
          background-color: rgba(150,150,150, 0.25);
        }

        #workspaces button.active {
            background-color: rgba(150,150,150,0.2);
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #tray,
        #mode,
        #custom-swaylock,
        #idle_inhibitor {
        	border-left-style: solid;
        	border-left-width: 2px;
        	border-left-color: #303030;
        	margin: 0px 0px;
        	padding-left: 10px;
        	padding-right:5px;
        }

        #pulseaudio {
        		border-left-style: none;

        }
        #temperature {
        	border-left-style: none;
        	margin-left: -12px;
        }

        #window {
          margin-top: 0px;
          padding: 0px 0px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            /* margin-left: 8px; */
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child {
            /* padding-right: 0px; */
            /* margin-right: 5px; */
        }

        #clock {
        }

        #cpu {
        }


        #custom-swaylock {
        }

        #battery {
        }

        #battery.charging, #battery.plugged {
        }

        @keyframes blink {
          to {
            color: #000000;
            }
        }

        #battery.critical:not(.charging) {
            color: #ffffff;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        label:focus {
        }

        #network.disconnected {
        }

        #pulseaudio.muted {
        }

        #temperature.critical {
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
        }

        #idle_inhibitor.activated {
        }

        #backlight {
        }

        #temperature {
        }
    '';
  };
}
