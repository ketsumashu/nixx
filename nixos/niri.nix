{pkgs, ...}:{
  imports = [
    niri.nixOSModules.niri
  ];
  programs.niri = {
    enable = false;
  };
}
