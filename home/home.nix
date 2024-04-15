    { config, pkgs, ... }: {

    	imports = [
	    ./hyprland
	    ./nvim
	    ./terminals
	    ./fish
	];

	home = {
	    username = "mashu";
	    homeDirectory = "/home/mashu";

	    packages = with pkgs; [
	        discord
	        btop
	        fd
	        ripgrep
	        blueman
	        xdg_utils
	        firefox
	    ];

	    stateVersion = "23.11";
	};

	programs.home-manager.enable = true;
    }
