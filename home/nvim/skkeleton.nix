{ pkgs, ... }:
{
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "skkeleton";
      src = pkgs.fetchFromGitHub {
        owner = "vim-skk";
        repo = "skkeleton";
        rev = "71178b6debd9f1b3bb00abfd865ca642e82e24c7";
        hash = "sha256-833WpBi0X6MhblLda1cp6dFU2zu+TYBgimlsBX+3rQo=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "denops.vim";
      src = pkgs.fetchFromGitHub {
        owner = "vim-denops";
        repo = "denops.vim";
        rev = "5cfca39988a36e42d81b925264fc846077a727e3";
        hash = "sha256-4AACZ3h6uAqiXW24gUF1+uq7dnWA0w/PcxAeO4yxitc=";
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
}
