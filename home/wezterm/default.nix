{
  programs.wezterm = {
    enable = true;
    extraconfig = builtins.readFile ./wezterm.lua;
  };
}
