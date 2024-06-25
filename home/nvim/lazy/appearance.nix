{pkgs, ...}:{
  name = "indent-blankline";
  pkg = pkgs.vimPlugins.indent-blankline;
  dev = true;
  event = ["VimEnter"];
}
