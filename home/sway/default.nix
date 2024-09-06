{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = null;
    extraConfig = builtins.readFile ./config;
    extraSessionCommands = ''
      export MOZ_ENABLE_WAYLAND="1"
      export NIXOS_OZONE_WL="1"
      export XDG_CURRENT_DESKTOP="sway"
      export XDG_SESSION_TYPE="wayland"
    '';
  };
  home.packages = with pkgs; [
    autotiling-rs
    i3status-rust
    libappindicator-gtk3
  ];
}
