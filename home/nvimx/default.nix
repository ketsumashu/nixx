{nvimx, ...}:{

 imports = [nvimx.homeModules.nvimx];

  programs.nvimx = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    configDir = ./nvim;
    lockDir = ./nvim/nvimx-lock;
    treesitter.grammers = ["lua" "nix"];

    lock = {
      installCommand = true;
      projectDir = "/home/mashu/nixx/home/nvimx";
      configDirRelative = "./nvim";
      lockDirRelative = "./nvim/nvimx-lock";
    };
  };
}
