{pkgs, ...}: {
  programs.nixvim = {
    plugins.lazy = {
      enable = true;
      plugins = [
        {
          name = "indent-blankline";
          pkg = pkgs.vimPlugins.indent-blankline-nvim;
          event = ["VimEnter"];
        }
	{
          name = "nvim-cmp";
	  pkg = pkgs.vimPlugins.nvim-cmp;
	  dependencies = with pkgs.vimPlugins; [
            cmp-path
	    cmp-buffer
	    cmp-cmdline
	    cmp_luasnip
	    cmp-nvim-lsp
	  ];
	}
      ];
    };
    extraConfigLua = ''
        require("ibl").setup()
	require("cmp").setup()
    '';
  };
}
