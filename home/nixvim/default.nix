{nixvim, ...}:{

  imports = [
    nixvim.homeModules.nixvim
    ./keymaps
    ./lsp
    ./plugins
    ./treesitter
    ./ui
    ./alpha.nix
    ./autocmds.nix
    ./bufferline.nix
    ./cmp.nix
    ./colorscheme.nix
    ./extra.nix
    ./lualine.nix
    ./options.nix
  ];
  programs.nixvim = {
    enable = true;
    enableMan = false;
    viAlias = true;
    vimAlias = true;
  };
  
}
