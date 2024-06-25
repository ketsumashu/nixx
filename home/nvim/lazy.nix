{pkgs, ...}: {
  programs.nixvim = {
    plugins.lazy = {
      enable = true;
      plugins = [
        {
          name = "indent-blankline";
          pkg = pkgs.vimPlugins.indent-blankline-nvim;
          dev = true;
          event = ["VimEnter"];
        }
      ];
    };
    extraConfigLua = ''
      config = function()
        require("ibl").setup()
      end,
    '';
  };
}
