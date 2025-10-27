{inputs, pkgs, ...}:{
  imports = [
    inputs.niri.nixOSModules.niri
  ];
  programs.niri = {
    enable = false;
  };
}
