    { pkgs, config, ... }: {
    	
	imports = [ ./hyprlock.nix ./hypridle.nix ];

	home.packages = with pkgs; [
	    xdg-desktop-portal-hyprland
	    wl-clipboard
	    xwayland
	    xdg-desktop-portal-gtk
	    wlroots
	    qt5ct
	    gnome.gnome-themes-extra
	    libva
	    wayland-utils
	    wayland-protocols
	    meson
	];

	wayland.windowManager.hyprland = {
	    enable = true;
	    xwayland.enable = true;

	    settings = {
                "$mod" = "SUPER";

		exec-once = [
		    "${pkgs.hypridle}/bin/hypridle"
		    "${pkgs.waybar}/bin/waybar"
		];
		monitor = [
		    "HDMI-A-2,2560x1440@144,0x0,1"
                    "DP-1,2560x1440@100,2560x0,1"
		];

		env = [

                    "XCURSOR_SIZE,24"
                    "XDG_SESSION_TYPE,wayland"
                    "XDG_CURRENT_DESKTOP,Hyprland"
                    "XDG_SESSION_DESKTOP,Hyprland"
                    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
                    "QT_QPA_PLATFORM,wayland;xcb"
                    "GDK_DPI_SCALE,1"
                    "QT_AUTO_SCREEN_SCALE_FACTOR,1"
		];

		bind = [
                    "$mod, B, exec, firefox"
                    "$mod, SPACE, exec, rofi -show drun"
                    "$mod, RETURN, exec, foot"
                    "$mod, period, exec, hyprlock"
                    "$mod CTRL, Q, exit"
                    "$mod , V, togglefloating"
                    "SUPER, P, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
                    "$mod CTRL, equal, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
                    "$mod CTRL, minus, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
                    "$mod, X, killactive"
                    "$mod, F, Fullscreen"
                    "$mod, H,movefocus, l"
                    "$mod, L,movefocus, r"
                    "$mod, K,movefocus, u"
                    "$mod, J,movefocus, d"
                   
                    "$mod, 1, workspace, 1"
                    "$mod, 2, workspace, 2"
                    "$mod, 3, workspace, 3"
                    "$mod, 4, workspace, 4"
                    "$mod, 5, workspace, 5"
                    "$mod, 6, workspace, 6"
                    "$mod, 7, workspace, 7"
                    "$mod, 8, workspace, 8"
                    "$mod, 9, workspace, 9"
                    "$mod, 0, workspace, 10"

                    "$mod SHIFT, 1, movetoworkspace, 1"
                    "$mod SHIFT, 2, movetoworkspace, 2"
                    "$mod SHIFT, 3, movetoworkspace, 3"
                    "$mod SHIFT, 4, movetoworkspace, 4"
                    "$mod SHIFT, 5, movetoworkspace, 5"
                    "$mod SHIFT, 6, movetoworkspace, 6"
                    "$mod SHIFT, 7, movetoworkspace, 7"
                    "$mod SHIFT, 8, movetoworkspace, 8"
                    "$mod SHIFT, 9, movetoworkspace, 9"
                    "$mod SHIFT, 0, movetoworkspace, 10"
                    
                    "$mod SHIFT, h, movewindow, l"
                    "$mod SHIFT, j, movewindow, d"
                    "$mod SHIFT, k, movewindow, u"
                    "$mod SHIFT, l, movewindow, r"
		];

		bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

		general = {
		    
                    gaps_in = 3;
                    gaps_out = 9;
                    border_size = 2;
                    "col.active_border" = "rgb(0000ff)";
                    "col.inactive_border" = "rgb(000000)";
                    layout = "dwindle";
		};

		decoration = {
		    rounding = 8;
		    drop_shadow = true;
		    shadow_range = 3;
		    shadow_render_power = 3;
		    "col.shadow" = "rgb(000000)"; 
		    blur = {
			enable = true;
			size = 2;
			passes = 3;
			popups = true;
			contrast = 1;
			noise = 0.01;
			brightness = 0.92;
		    };
		};
	        master = { new_is_master = true; };

                misc = {
                    disable_hyprland_logo = true;
                    enable_swallow = true;
                    key_press_enables_dpms = true;
                    mouse_move_enables_dpms = true;
                };
                input = {
                    kb_layout = "us";
                    kb_options = "ctrl:nocaps";
                    repeat_delay = 270;
                    repeat_rate = 50;
                };
                animations = {
                    enabled = true;
                    bezier = [
                        "myBezier, 0.05, 0.9, 0.1, 1.05"
                        "cubic, 0.1, 0.23, 0.41, 0.9"
                        "windows, 1, 1.2, cubic, slide"
                        "border, 1, 0.1, default"
                        "borderangle, 0, 0.2, default"
                        "fade, 1, 4, default"
                        "workspaces, 1, 4, default, fade"
		   ];
                };

		qt = {
		    enable = true;
		    platformTheme = "gtk";
		    style.name = "gtk2";
		};

		gtk = {
		    enable = true;
		    theme = {
			package = pkgs.flat-remix-icon-theme;
			name = "Flat-Remix-Grey-Darkest";
		    };
		};
	    };
	};
    }
