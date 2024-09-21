{ inputs, pkgs, ... }: {
  imports = [ inputs.wayland-pipewire-idle-inhibit.homeModules.default ];
  services.wayland-pipewire-idle-inhibit = {
    enable = true;
    package = pkgs.wayland-pipewire-idle-inhibit;
    systemdTarget = "hyprland-session.target";
    settings = {
      verbosity = "INFO";
      media_minimum_duration = 10;
      idle_inhibitor = "wayland";
      sink_whitelist =
        [{ name = "Starship/Matisse HD Audio Controller Analog Stereo"; }];
      node_blacklist = [{ app_name = "[Ss]potify"; }];
    };
  };
}
