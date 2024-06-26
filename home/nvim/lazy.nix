{pkgs, ...}: {
  imports = [./lazy/cmp.nix ./lazy/appearance.nix ./lazy/skk.nix ./lazy/utils.nix ];
  programs.nixvim = {
    plugins.lazy = {
      enable = true;
      plugins = [
        {
          name = "indent-blankline-nvim";
          pkg = pkgs.vimPlugins.indent-blankline-nvim;
          event = ["VimEnter"];
        }
        {
          name = "nvim-cmp";
          pkg = pkgs.vimPlugins.nvim-cmp;
          dependencies = with pkgs.vimPlugins; [
            cmp-path
            cmp-buffer
            cmp-cmdline
            cmp_luasnip
            cmp-nvim-lsp
          ];
          event = ["InsertEnter" "CmdlineEnter"];
        }
        {
          name = "LuaSnip";
          pkg = pkgs.vimPlugins.luasnip;
          event = ["InsertEnter"];
        }
        {
          name = "skkeleton";
          pkg = (pkgs.vimUtils.buildVimPlugin {
            name = "skkeleton";
            src = pkgs.fetchFromGitHub {
            owner = "vim-skk";
            repo = "skkeleton";
            rev = "87ad1d1f594e592ecad0429d651be45ce5fb03da";
            hash = "sha256-7qPFVnNzBgkQMD73JEhYEXxCWuGROzH8pjfPQpKwf0I=";
            };
          });
          dependencies = with pkgs.vimPlugins; [
            denops-vim
          ];
          lazy = false;
        }
        {
          name = "skkeleton-indicator";
          pkg = (pkgs.vimUtils.buildVimPlugin {
            name = "skkeleton_indicator.nvim";
            src = pkgs.fetchFromGitHub {
            owner = "delphinus";
            repo = "skkeleton_indicator.nvim";
            rev = "d9b649d734ca7d3871c4f124004771d0213dc747";
            hash = "sha256-xr2yTHsGclLvXPpRNYBFS+dIB0+RNUb27TlGq5apBig=";
            };
          });
          lazy = false;
        }
        {
          name = "nvim-bufdel";
          pkg = pkgs.vimPlugins.nvim-bufdel;
          event = ["VimEnter"];
        }
        {
          name = "nvim-autopairs";
          pkg = pkgs.vimPlugins.auto-pairs;
          event = ["InsertEnter"];
        }
        {
          name = "alpha";
          pkg = pkgs.vimPlugins.alpha-nvim;
          event = ["VimEnter"];
        }
      ];
    };
  };
}
