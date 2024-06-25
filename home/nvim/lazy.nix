{pkgs, ...}:{
  programs.nixvim.plugins.lazy = {
    enable = true;
    plugins = [
      {
         name = "indent-blankline";
         pkg = pkgs.vimPlugins.indent-blankline;
         dev = true;
         event = ["VimEnter"];
      }
    ];
  };
}
