{
  programs.nixvim.keymaps = [
    #insert mode key map
    {
      mode = "i";
      key = "jj";
      action = "<esc>";
    }
    {
      mode = "i";
      key = "jk";
      action = "<esc>";
    }

    #normal mode key map
    {
      mode = "n";
      key = "x";
      action = "\"_x";
    }
    {
      mode = "n";
      key = "<Leader>f";
      action = ":Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<Leader>b";
      action = ":Telescope buffers<CR>";
    }
    {
      mode = "n";
      key = "<Leader>e";
      action = ":Telescope file_browser<CR>";
    }
    {
      mode = "n";
      key = "<Leader>gh";
      action = ":bp<CR>";
    }
    {
      mode = "n";
      key = "<Leader>gl";
      action = ":bn<CR>";
    }
    {
      mode = "n";
      key = "<Leader>w";
      action = ":w<CR>";
    }
    {
      mode = "n";
      key = "<Leader>q";
      action = ":q<CR>";
    }
    {
      mode = "n";
      key = "<esc><esc>";
      action = ":set nohlsearch<CR>";
    }
  ];
}
