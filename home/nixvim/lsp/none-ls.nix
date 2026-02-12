{ pkgs, ... }:
{
  programs.nixvim.plugins.none-ls = {
    enable = pkgs.lib.mkDefault true;
    sources = {
      diagnostics = {
        stylelint.enable = pkgs.lib.mkDefault true;
        statix.enable = pkgs.lib.mkDefault true;
        hadolint.enable = pkgs.lib.mkDefault true;
        fish.enable = pkgs.lib.mkDefault true;
        dotenv_linter.enable = pkgs.lib.mkDefault true;
        deadnix.enable = pkgs.lib.mkDefault true;
        trail_space.enable = pkgs.lib.mkDefault true;
      };

      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt;
        };
        stylua.enable = pkgs.lib.mkDefault true;
        alejandra.enable = pkgs.lib.mkDefault true;
        shfmt.enable = pkgs.lib.mkDefault true;
        black.enable = pkgs.lib.mkDefault true;
        isort.enable = pkgs.lib.mkDefault true;
        prettier.enable = pkgs.lib.mkDefault true;
        prettier.disableTsServerFormatter = pkgs.lib.mkDefault true;
      };
    };
  };
}
