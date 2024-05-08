{pkgs, ...}: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "skkeleton";
      src = pkgs.fetchFromGitHub {
        owner = "vim-skk";
        repo = "skkeleton";
        rev = "87ad1d1f594e592ecad0429d651be45ce5fb03da";
        hash = "";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "denops.vim";
      src = pkgs.fetchFromGitHub {
        owner = "vim-denops";
        repo = "denops.vim";
        rev = "2a393849db9531d14106dcd437f9b7deb5012057";
        hash = "";
      };
    })
  ];

  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_exec([[
              call skkeleton#config({
                  \  'eggLikeNewline': v:true,
                  \  'useSkkServer': v:false,
                  \  'markerHenkan': ">",
                  \  'markerHenkanSelect': ">>",
                  \  'globalJisyo': "/home/mashu/nixx/home/libskk/SKK-JISYO.L",
                  \  'showCandidatesCount': 2,
                  \  'registerConvertResult': v:true,
                  \  'keepState': v:true
                  \})
          ]], false)
          vim.api.nvim_exec([[
              call skkeleton#register_keymap('input', ';', 'henkanPoint')
          ]], false)
  '';
}