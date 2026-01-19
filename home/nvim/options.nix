{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.opts = {
    number = true;
    autoindent = true;
    clipboard = "unnamedplus";
    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    laststatus = 2;
    cmdheight = 0;
    smartindent = true;
    shiftwidth = 2;
    ignorecase = true;
    swapfile = false;
    undofile = true;
    guifont = "FiraCode Nerd Font";
    termguicolors = true;
  };
}
