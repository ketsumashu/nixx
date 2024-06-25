{pkgs, ...}:{
  programs.nixvim.plugins.lazy = {
    enable = true;
    plugins = [
      ./lazy/appearance.nix
    ];
  };
}
