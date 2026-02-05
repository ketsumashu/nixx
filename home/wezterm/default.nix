{inputs, pkgs, ...}:{

  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default;
    extraconfig = builtins.readFile ./wezterm.lua;
  };
}
