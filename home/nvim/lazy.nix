{pkgs, ...}: {
  import = [./lazy/cmp.nix ./lazy/appearance.nix ./lazy/skk.nix];
  programs.nixvim = {
    plugins.lazy = {
      enable = true;
      plugins = [
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
            denops-nvim
          ];
          event = ["VimEnter"];
        }
      ];
    };
  };
}
