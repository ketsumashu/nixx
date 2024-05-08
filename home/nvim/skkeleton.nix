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
  ];

  programs.nixvim.extraConfigVim = ''
    call skkeleton#config({
      \  'eggLikeNewline': v:true,
      \  'markerHenkan': ">",
      \  'markerHenkanSelect': ">>",
      \  'globalDictionaries': ["/home/mashu/nixx/home/libskk/SKK-JISYO.L"],
      \  'showCandidatesCount': 2,
      \  'registerConvertResult': v:true,
      \  'keepState': v:true
      \})
    call skkeleton#register_keymap('input', ';', 'henkanPoint')
  '';
}
