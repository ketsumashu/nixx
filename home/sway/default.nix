{pkgs, ...}:{

  wayland.windowManager.sway =  {
    enable = true;
    xwayland.enable = true;
  };
}
