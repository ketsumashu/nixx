    { pkgs, ... }: {
    	imports = [ ./hyprlock.nix ./hypridle.nix ];

	home.packages = with pkgs; [
	    xdg-desktop-portal-hyprland
	    wl-clipboard
	    xdg-desktop-portal-gtk
	    wlroots
	    qt5ct
	    wayland-utils
	    wayland-protocols
	    meson
	];

	wayland.windowManager.hyprland = {
	    enable = true;
	    xwayland.enable = true;

	    settings = {

		exec-once = [
		    "${pkgs.hypridle}/bin/hypridle"
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
                    "SUPER, B, exec, firefox"
                    "SUPER, SPACE, exec, rofi -show drun"
                    "SUPER, RETURN, exec, foot"
                    "SUPER, period, exec, hyprlock"
                    "SUPER CTRL, Q, exit"
                    "SUPER , V, togglefloating"
                    "SUPER, P, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
                    "SUPER CTRL, equal, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
                    "SUPER CTRL, minus, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
                    "SUPER, X, killactive"
                    "SUPER, F, Fullscreen"
                    "SUPER, H,movefocus, l"
                    "SUPER, L,movefocus, r"
                    "SUPER, K,movefocus, u"
                    "SUPER, J,movefocus, d"
                   
                    "SUPER SHIFT, h, movewindow, l"
                    "SUPER SHIFT, j, movewindow, d"
                    "SUPER SHIFT, k, movewindow, u"
                    "SUPER SHIFT, l, movewindow, r"
		]
		++ (
                    # workspaces
                    # binds SUPER + [shift +] {1..10} to [move to] workspace {1..10}
                    builtins.concatLists (builtins.genList
                      (
                        x:
                        let
                          ws =
                            let
                              c = (x + 1) / 10;
                            in
                            builtins.toString (x + 1 - (c * 10));
                        in
                        [
                          "SUPER, ${ws}, workspace, ${toString (x + 1)}"
                          "SUPER SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                        ]
                      )
                      10)
                );
		bindm = [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];

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
	    };
	};
    }
