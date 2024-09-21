{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {
      enable = false;
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = [
          "HDMI-A-1"
          "HDMI-A-2"
        ];
        height = 22;
        margin-top = 0;
        margin-bottom = 0;
        spacing = 15;
        modules-left = [
          "sway/workspaces"
          "hyprland/workspaces"
        ];
        modules-center = [
          "sway/window"
          "hyprland/window"
        ];
        modules-right = [
          "pulseaudio"
          "memory"
          "temperature#cpu"
          "temperature#gpu"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          all-outputs = false;
          persistent-workspaces = {
            "HDMI-A-1" = [
              1
              2
              3
              4
            ];
            "HDMI-A-2" = [
              5
              6
              7
              8
              9
            ];
          };
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
        };

        "hyprland/window" = {
          format = "{initialTitle}";
          max-length = 49;
        };

        "sway/workspaces" = {
          format = "{name}";
          all-outputs = false;
          persistent-workspaces = {
            "1" = [ "HDMI-A-1" ];
            "2" = [ "HDMI-A-1" ];
            "3" = [ "HDMI-A-1" ];
            "4" = [ "HDMI-A-1" ];
            "5" = [ "HDMI-A-2" ];
            "6" = [ "HDMI-A-2" ];
            "7" = [ "HDMI-A-2" ];
            "8" = [ "HDMI-A-2" ];
          };
          disable-scroll = false;
        };

        "sway/window" = {
          format = "{title}";
          max-length = 49;
        };

        "temperature#cpu" = {
          format = "{temperatureC}°C";
          hwmon-path = "/sys/class/hwmon/hwmon2/temp3_input";
          interval = 1;
          rotate = 0;
        };

        "temperature#gpu" = {
          format = "{temperatureC}°C";
          hwmon-path = "/sys/class/hwmon/hwmon1/temp2_input";
          interval = 1;
          rotate = 0;
        };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          interval = 1;
          format = "{:%H:%M:%S}";
          rotate = 0;
        };

        "network" = {
          interface = "enp4s0";
          interval = 1;
          format = ''
            {bandwidthDownBits} 
            {bandwidthUpBits}'';
          format-disconnected = "OFFLINE";
          tooltip-format = "{ifname}: {ipaddr}";
          rotate = 0;
        };

        "memory" = {
          format = "{used:0.1f}G";
          interval = 1;
          on-click = "kitty -e btop";
          rotate = 0;
        };

        "pulseaudio" = {
          scroll-step = 5;
          format = "{volume}%";
          format-bluetooth = "vol.{volume}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = "MUTED";
          format-source = "{volume}%";
          format-source-muted = "MUTED";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          rotate = 0;
          on-click = "pavucontrol";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "on";
            deactivated = "off";
          };
        };
      };
    };
    style = ''
      * {
          font-family: "Fira Code Nerd Font,PlemolJP35 Console HS";
          font-size: 12px;
          min-height: 0;
      }

      window#waybar {
          background-color: rgba(25,28,37,0.95);
          border-top-right-radius:0px;
          border-bottom-right-radius:0px;
      }

      window#waybar.hidden {
          opacity: 0;
      }

      #workspaces button {
          padding:  0px 0px;
          background-color: transparent;
          color: #c5c4d4;
      }

      #workspaces button.persistent {
          padding:  0px 0px;
          background-color: transparent;
          color: #c5c4d4;
      }

      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.active {
          color: #77adb1;
      }
      #workspaces button.focused {
          color: #77adb1;
      }

      #workspaces button.urgent {
          background-color: #1b1e28;
          color: #a994b8;
      }

      #mode {
          background-color: #cf8164;
          color: #23252e;
          /*font-weight:bold;*/
          margin: 0 4px;
      }

      #memory,
      #cpu,
      #temperature{
          padding: 0 0px;
          color:#77adb1;
          /*font-weight:bold;*/
      }

      #window{
          color:#c5c4d4;
          padding: 0px 0px;
      }
      #workspaces {
          margin: 0 0px;
      }

      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #network,
      #clock {
          color: #94cdd1;
          font-size: 12px;
          margin-bottom: 0px;
          padding-bottom: 0px;
      }

      @keyframes blink {
          to {
              background-color: #f5f5f5;
              color: #000000;
          }
      }

      label:focus {
          background-color: #000000;
      }

      #network.disconnected {
          background-color: #f5f5f5;
          color: #121214
      }

      #pulseaudio {
          color: #77adb1;
      }

      #pulseaudio.muted {
          color: #c5c4d4;
          font-weight: normal;
      }

      #tray {
          color: #f5f5f5;
      }

      #idle_inhibitor {
        color: #77adb1;
      }

      #idle_inhibitor.activated {
          color: #77adb1;
      }

    '';
  };
}
