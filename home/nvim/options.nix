{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.opts = {
    number = true;
    autoindent = true;
    clipboard = "unnamedplus";
    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    smartindent = true;
    shiftwidth = 2;
    ignorecase = true;
    swapfile = false;
    undofile = true;
  };
}
