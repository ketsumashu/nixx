{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufWinEnter" ];
      callback = {
        __raw = ''
          function()
              vim.cmd "set formatoptions-=cro"
          end
        '';
      };
    }
    {
      event = [ "FileType" ];
      pattern = [
        "netrw"
        "Jaq"
        "qf"
        "git"
        "help"
        "man"
        "lspinfo"
        "alpha"
        "lir"
        "DressingSelect"
        ""
      ];
      callback = {
        __raw = ''
          function()
            vim.cmd [[
              nnoremap <silent> <buffer> q :close<CR>
              set nobuflisted
            ]]
          end
        '';
      };
    }
    {
      event = [ "CmdWinEnter" ];
      callback = {
        __raw = ''
          function()
              vim.cmd "quit"
            end
        '';
      };
    }
    {
      event = [ "VimResized" ];
      callback = {
        __raw = ''
          function()
              vim.cmd "tabdo wincmd ="
          end
        '';
      };
    }
    {
      event = [ "FileType" ];
      pattern = [
        "javascript"
        "typescript"
        "cpp"
        "c"
        "css"
        "scss"
      ];
      callback = {
        __raw = ''
          function()
            vim.keymap.set("n", "<Leader>c", "<Plug>(cosco-commaOrSemiColon)", { desc = "Cosco: Toggle comma/semicolon" })
            vim.keymap.set("i", "<C-c>", "<Plug>(cosco-commaOrSemiColon)", { desc = "Cosco: Toggle comma/semicolon" })
          end
        '';
      };
    }
  ];
}
