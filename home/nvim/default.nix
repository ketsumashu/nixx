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
    colorschemes.base16 = {
      enable = true;
      colorscheme = {
        base00 = "#232136";
        base01 = "#80638e";
        base02 = "#1aaba0";
        base03 = "#497e7a";
        base04 = "#f8f8f2";
        base05 = "#f8f8f2";
        base06 = "#497e7a";
        base07 = "#f8f8f2";
        base08 = "#21d6c9";
        base09 = "#21d6c9";
        base0A = "#1aaba0";
        base0B = "#d486d4";
        base0C = "#21d6c9";
        base0D = "#1aaba0";
        base0E = "#21d6c9";
        base0F = "#497e7a";
      };
      setUpBar = false;
    };
  };
}
