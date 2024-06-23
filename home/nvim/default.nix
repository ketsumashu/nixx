{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./treesitter.nix
    ./cmp.nix
    ./leap.nix
    ./telescope.nix
    ./auto-pair.nix
    ./skkeleton.nix
    ./blankline.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = false;
    viAlias = true;
    vimAlias = true;
    colorschemes.nightfox = {
      enable = true;
      flavor = "duskfox";
      settings = {
        transparent = true;
      };
    };
  };
}
