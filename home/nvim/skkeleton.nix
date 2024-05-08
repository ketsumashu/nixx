{pkgs, ...}: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "skkeleton";
      src = pkgs.fetchFromGitHub {
        owner = "vim-skk";
        repo = "skkeleton";
        rev = "87ad1d1f594e592ecad0429d651be45ce5fb03da";
        hash = "sha256-7qPFVnNzBgkQMD73JEhYEXxCWuGROzH8pjfPQpKwf0I=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "denops.vim";
      src = pkgs.fetchFromGitHub {
        owner = "vim-denops";
        repo = "denops.vim";
        rev = "2a393849db9531d14106dcd437f9b7deb5012057";
        hash = "sha256-KLB2nrXC3JwEOhNfLvcl3dWGi0j7ow/oIlId4EVe3yM=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "firenvim";
      src = pkgs.fetchFromGitHub {
        owner = "glacambre";
        repo = "firenvim";
        rev = "03ba12a5a92a02d171005775a8150998c4060a74";
        hash = "sha256-fBV+lIquhuNDKu3JIZG39vhxTMyTdL+2+zmINQhJRDk=";
      };
    })
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
      vim.o.number = false
    else
      vim.o.number = true
    end
  '';
}
