{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile = {
    "nvim".recursive = ./nvim;
  };
}
