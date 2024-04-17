  { pkgs, config, lib, waybar, ... }: {
    xdg.configFile."waybar/style.css".source = ./style.css;
    programs.waybar = {
	    enable = true;
      package = waybar.packages."${pkgs.system}".waybar;
	    systemd = { enable = false; };
	    settings = {
	      mainBar = {
          layer = "top";
            position = "left";
            output = [ "HDMI-A-2" "DP-1" ];
            width = 59;
            margin-top = 8;
            margin-bottom = 8;
            spacing = 15;
            modules-left = [ "hyprland/window" ];
            modules-center = [ "hyprland/workspaces" ];
            modules-right = [ "pulseaudio" "memory" "temperature" "clock" "tray"];

            "hyprland/workspaces" = {
              format = "{name}";
              all-outputs = false;
              persistent-workspaces = {
               "HDMI-A-2" = [ 1 2 3 4];
               "DP-1" = [ 5 6 7 8 9];
              };
            };

            "hyprland/window" = {
              format = "{initialTitle}";
              max-length = 49;
              rotate = 270;
            };

            "temperature" = {
              format = "{temperatureC}°C";
              hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
              interval = 1;
              rotate = 0;
            };

            "tray" = {
              spacing = 10;
            };

            "clock" = {
              tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
              interval = 1;
              format = "{:%H\n%M}";
              rotate = 0;
            };

            "network" = {
              interface = "enp4s0";
              interval = 1;
              format = "{bandwidthDownBits} \n{bandwidthUpBits}";
              format-disconnected = "OFFLINE";
              tooltip-format = "{ifname}: {ipaddr}";
              rotate = 0;
            };

            "memory" = {
              format = " {used:0.1f}G\n ---- \n{total:0.1f}G";
              interval = 1;
              on-click = "wezterm start btop";
              rotate = 0;
            };

            "pulseaudio" = {
              scroll-step = 5;
              format = " vol\n----\n {volume}%";
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
                default = ["" "" ""];
              };
              rotate = 0;
              on-click = "pavucontrol";
        };
      };
	  };
  };
  }
