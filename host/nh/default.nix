{ configs,
  pkgs,
  ...
}
:{
  programs.nh = {
    enable = true;
    packages = pkgs.nh;
    clean.enable = true;
    flake = "/home/mashunix/nixx";
  }; 
}
