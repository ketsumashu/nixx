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
	};
	xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
    }
