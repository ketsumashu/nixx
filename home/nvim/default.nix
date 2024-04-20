{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./treesitter.nix
    ./cmp.nix
    ./telescope.nix
    ./statusline.nix
    ./surround.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.poimandres.enable = true;
    colorschemes.poimandres.settings = {
      disable_background = true;
      disable_float_background = true;
      disable_italics = true;
    };
  };
}
