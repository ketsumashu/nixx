{ pkgs, ... }:
{
  programs.nixvim.colorschemes.palette = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      disable_background = true;
    }; # comment
    luaConfig.post = ''
      require("palette").setup({
        palettes = {
          main = "custom_main_palette",
          accent = "custom_accent_palette",
          state = "custom_state_palette",
        },
        custom_palettes = {
          main = {
            custom_main_palette = {
             color0 = "#131313",
             color1 = "#1d352e",
             color2 = "#b2ccc2",
             color3 = "#b2ccc2",
             color4 = "#a9cbe3",
             color5 = "#5edbbb",
             color6 = "#a9cbe3",
             color7 = "#b2ccc2",
             color8 = "#1d352e",
            },
          },
          accent = {
            custom_accent_palette = {
              accent0 = "#ffb4ab",
              accent1 = "#5edbbb",
              accent2 = "#a9cbe3",
              accent3 = "#A5D9A7",
              accent4 = "#8BB9C8",
              accent5 = "#C9A1D3",
              accent6 = "#B8A1D9",
            },
          },
          state = {
            custom_state_palette = {
              error = "#D97C8F",
              warning = "#D9AE7E",
              hint = "#D9D87E",
              ok = "#A5D9A7",
              info = "#8BB9C8",
            },
          },
        },
      })
    '';
  };
}
