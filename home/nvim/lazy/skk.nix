{
  programs.nixvim.extraConfigLua = ''
  vim.cmd [[
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
  ]]
  '';
}
