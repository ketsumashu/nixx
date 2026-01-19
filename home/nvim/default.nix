{ nixvim, ... }:
{
  imports = [
    nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./treesitter.nix
    ./cmp.nix
    ./leap.nix
    ./telescope.nix
    ./autopair.nix
    ./skkeleton.nix
    ./blankline.nix
    ./status.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = false;
    viAlias = true;
    vimAlias = true;
    colorschemes.everforest = {
      enable = true;
      settings = {
        enable_italic = 0;
        transparent_background = 2;
      };
    };
  };
}
