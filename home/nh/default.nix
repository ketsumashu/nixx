{ configs,
  pkgs,
  ...
}
:{
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/mashunix/nixx";
  }; 
}
