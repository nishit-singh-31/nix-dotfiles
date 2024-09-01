{ config, lib, pkgs, userSettings, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      * {
        font-size: 13px;
        border-radius: 5px;
        }

        window#waybar {
          font-family: FontAwesome, monospace;
          background-color: transparent;
          border-bottom: 0px;
          color: #ebdbb2;
          transition-property: background-color;
          transition-duration: .5s;
        }

        window#waybar.hidden {
          opacity: 0.2;
        }

        window#waybar.empty #window {
          background-color: transparent;
        }

        .modules-right {
          margin: 10px 10px 0 0;
        }
        .modules-center {
          margin: 10px 0 0 0;
        }
        .modules-left {
          margin: 10px 0 0 10px;
        }

        button {
          border: none;
        }

        #workspaces {
          background-color: #282828;
        }

        #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #ebdbb2;
          border-radius: 0;
        }

        #workspaces button:first-child {
          border-radius: 5px 0 0 5px;
        }

        #workspaces button:last-child {
          border-radius: 0 5px 5px 0;
        }

        #workspaces button:hover {
          color: #d79921;
        }

        #workspaces button.focused {
          background-color: #665c54;
        }

        #workspaces button.urgent {
          background-color: #b16286;
        }

        #mode,
        #window,
        #clock,
        #battery,
        #tray,
        #load {
          padding: 0 10px;
          background-color: #282828;
          color: #ebdbb2;
        }

        #mode {
          background-color: #689d6a;
          color: #282828;
        }

        .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
        }

        .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
        }

        #battery.charging, #battery.plugged {
          background-color: #98971a;
          color: #282828;
        }

        @keyframes blink {
          to {
            background-color: #282828;
            color: #ebdbb2;
             }
        }

        #battery.critical:not(.charging) {
          background-color: #cc241d;
 	  color: #ebdbb2;
    	  animation-name: blink;
    	  animation-duration: 0.5s;
    	  animation-timing-function: steps(12);
    	  animation-iteration-count: infinite;
    	  animation-direction: alternate;
  	}

	label:focus {
    	  background-color: #000000;
	}

	#wireplumber.muted {
    	  background-color: #458588;
	}

	#tray > .passive {
    	  -gtk-icon-effect: dim;
	}

	#tray > .needs-attention {
    	  -gtk-icon-effect: highlight;
	}

	#tray menu {
    	  font-family: monospace;
	}

	#scratchpad.empty {
    	  background: transparent;
	}
    '';

    settings = [{
      "output" = "eDP-1";
      "layer" = "top";
      "position" = "top";

      "height" = 24;
      "spacing" = 4;

      "modules-left" = [
        "hyprland/workspaces"
        "hyprland/mode"
        "hyprland/scratchpad"
      ];
      "modules-center" = [
        "hyprland/window"
      ];
      "modules-right" = [
        "clock"
        "battery"
        "tray"
      ];

      "hyprland/workspaces" = {
        "all-outputs" = true;
        "warp-on-scroll" = false;
        "enable-bar-scroll" = true;
        "disable-scroll-wraparound" = true;
        "format" = "{name}"; 
        "format-icons" = {
            "1" = "";
            "3" = "";
            "2" = "";
            "4" = "";
            "5" = "";
            "9" = "";
            "10" = "";
        };
      };
      "hyprland/window" = {
        "format" = "{title}";
        "max-length" = 40;
        "all-outputs" = true;
      };
      "tray" = {
        "icon-size" = 14;
        "spacing" = 10;
      };
      "clock" = {
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt" = "{:%Y-%m-%d}";
      };
      "battery" = {
        "states" = {
            "warning" = 30;
            "critical" = 15;
        };
        "format" = "{icon} {capacity}%";
        "format-full" = "{icon} {capacity}%";
        "format-charging" = " {capacity}%";
        "format-plugged" = " {capacity}%";
        "format-alt" = "{icon} {time}";
        "format-icons" = ["" "" "" "" ""];
      };
    }];
    };
}
