    { pkgs, inputs, ... }: {
        imports = [
	    inputs.nixvim.homeManagerModules.nixvim
	    ./options.nix
	    ./keymaps.nix
	];

	programs.nixvim = {
	    enable = true;
	    viAlias = true;
            vimAlias = true;
	    colorschemes.catppuccin.enable = true;
	};
    }
