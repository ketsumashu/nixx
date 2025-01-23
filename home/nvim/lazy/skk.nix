{
  programs.nixvim.extraConfigLua = ''
    vim.cmd [[
      let g:eskk#directory = "~/.config/eskk"
      let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
      let g:eskk#large_dictionary = {'path': "~/dotfiles/libskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
      let g:eskk#egg_like_newline = 1
    ]]
  '';
}
