{ pkgs, ... }:
{
  programs.nixvim.colorschemes.palette = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      disable_background = true;
    };
    luaConfig = ''
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },
      custom_palettes = {
        main = {
          custom_main_palette = {
           color0 = "#131313";
           color1 = "#ffb4ab";
           color2 = "#a8cbe2";
           color3 = "#b2ccc2";
           color4 = "#5fdbba";
           color5 = "#a8cbe2";
           color6 = "#b2ccc2";
           color7 = "#e2e2e2";
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#D97C8F",
            accent1 = "#D9AE7E",
            accent2 = "#D9D87E",
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
    '';
  };
}
