{ inputs, pkgs, ... }: {

  imports = [ inputs.nvimx.homeModules.nvimx ];

  programs.nvimx = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    configDir = ./nvim;
    lockDir = ./nvim/nvimx-lock;
    devPath = "/home/mashu/nixx/home/nvimx/local";
    treesitter.grammars = [
      "lua"
      "nix"
    ];

    lock = {
      installCommand = true;
      projectDir = "/home/mashu/nixx/home/nvimx";
      configDirRelative = "./nvim";
      lockDirRelative = "./nvim/nvimx-lock";
    };
  };

  home.packages = with pkgs; [
    nixd
    nixfmt
    lua-language-server
    bash-language-server
  ];
}
