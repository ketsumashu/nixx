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
    {
      plugin = tint-nvim;
      config = "lua require('tint').setup()";
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
}
