{
  pkgs,
  skkeleton,
  denops,
  ...
}:
let
  skkeleton-nix = pkgs.vimUtils.buildVimPlugin {
    pname = "skkeleton";
    version = "latest";
    src = skkeleton;
  };
  denops-nix = pkgs.vimUtils.buildVimPlugin {
    pname = "denops.vim";
    version = "latest";
    src = denops;
  };
in
{
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    vim-repeat
    lspkind-nvim
    zen-mode-nvim
    twilight-nvim
    skkeleton-nix
    denops-nix
    firenvim
    {
      plugin = tint-nvim;
      config = "lua require('tint').setup()";
    }
    {
      plugin = nvim-surround;
      config = "lua require('nvim-surround').setup({move_cursor=false})";
    }
    {
      plugin = treesj;
      config = "lua require('treesj').setup({use_default_keymaps=false})";
    }
  ];
  programs.nixvim.extraConfigVim = ''
    call skkeleton#config({
      \  'eggLikeNewline': v:true,
      \  'markerHenkan': ">",
      \  'markerHenkanSelect': ">>",
      \  'globalDictionaries': ["/home/mashu/nixx/home/libskk/SKK-JISYO.L"],
      \  'sources': [ "skk_dictionary", "google_japanese_input" ],
      \  'showCandidatesCount': 2,
      \  'registerConvertResult': v:true,
      \  'keepState': v:true
      \})
    call skkeleton#register_keymap('input', ';', 'henkanPoint')
  '';
  programs.nixvim.extraConfigLua = ''
    if vim.g.started_by_firenvim == true then
      vim.o.laststatus = 0
    else
      vim.o.laststatus = 3
    end
    vim.g.firenvim_config = {
      localSettings = {
        ['.*'] = {
          cmdline  = 'neovim',
          content  = 'text',
          priority = 0,
          selector = 'textarea',
          takeover = 'never',
        },
      }
    }
  '';
}
