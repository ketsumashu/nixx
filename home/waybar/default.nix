    { pkgs, config, lib, waybar, ... }: {
	     programs.waybar = {
	         enable = true;
           package = waybar.packages."${pkgs.system}".waybar;
	         systemd = { enabled = false; };
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
                            "HDMI-A-2" = [ 1, 2, 3, 4];
                            "DP-1" = [ 5, 6, 7, 8, 9];
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
		style = ''
                    * {
                        font-family: "CozetteHiDpi","mplus12";
                        font-size: 13px;
                        min-height: 0;
                    }
                    
                    window#waybar {
                        background-color: rgba(25,28,37,0.88);
                        border-top-right-radius:12px;
                        border-bottom-right-radius:12px;
                    }
                    
                    window#waybar.hidden {
                        opacity: 0;
                    }
                    
                    #workspaces button {
                        padding:  10px 0px;
                        background-color: transparent;
                        color: #e0def4;
                    }
                    
                    #workspaces button.persistent {
                        padding:  10px 0px;
                        background-color: transparent;
                        color: #e0def4;
                    }
                    
                    #workspaces button:hover {
                        background: rgba(0, 0, 0, 0.2);
                    }
                    
                    #workspaces button.active {
                        color: #77adb1;
                    }
                    
                    #workspaces button.urgent {
                        background-color: #524f67;
                        color: #e0def4;
                    }
                    
                    #mode {
                        background-color: #cf8164;
                        color: #23252e;
                        /*font-weight:bold;*/
                        margin: 0 4px;
                    }
                    
                    #memory,
                    #pulseaudio,
                    #cpu,
                    #temperature{
                        padding: 0 0px;
                        color:#a994b8;
                        /*font-weight:bold;*/
                    }
                    
                    #window{
                        color:#c5c4d4;
                        padding: 100px 20px;
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
                        color: #889bb4;
                        font-size: 13px;
                        margin-bottom: 2px;
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
                        padding-bottom:10px;
                    }
                    
                    #idle_inhibitor {
                        background-color: #191c25;
                    }
                    
                    #idle_inhibitor.activated {
                        background-color: #ecf0f1;
                        color: #2d3436;
                    }
		'';
	    };
	};
    }
