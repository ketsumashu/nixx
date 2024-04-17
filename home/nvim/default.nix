    { pkgs, inputs, ... }: {
        imports = [
	    inputs.nixvim.homeManagerModules.nixvim
	    ./options.nix
	    ./keymaps.nix
	];

	programs.nixvim = {
	    enable = true;
	    colorschemes.catppuccin.enable = true;
	    settings = {
		viAlias = true;
		vimAlias = true;
	    };
	};
    }
