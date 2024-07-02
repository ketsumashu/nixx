{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./lazy.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = false;
    viAlias = true;
    vimAlias = true;
    colorschemes.poimandres = {
      enable = true;
      settings = {
        disable_background = true;
        disable_float_background = false;
        disable_italics = true;
        dark_variant = "main";
      };
    };
  };
}
