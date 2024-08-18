{pkgs, ...}:{

  wayland.windowManager.sway =  {
    enable = true;
  };
  xdg.configFile."sway/config".source = ./config;
}
