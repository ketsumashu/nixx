    { pkgs, inputs, ... }: {
        imports = [
	    imputs.nixvim.homeManagerModules.nixvim
	];

	programs.nixvim = {
	    enable = true;
	    colorschemes.catppuccin.enable = true;
	};
    }
