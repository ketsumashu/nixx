{
  config,
  pkgs,
  wayland-pipewire-idle-inhibit,
  ...
}: {
  imports = [
    wayland-pipewire-idle-inhibit.homeModules.default
  ];
  services.wayland-pipewire-idle-inhibit = {
    enable = true;
    package = wayland-pipewire-idle-inhibit.packages."${pkgs.system}".wayland-pipewire-idle-inhibit;
    systemdTarget = "hyprland-session.target";
    settings = {
      verbosity = "INFO";
      media_minimum_duration = 10;
      idle_inhibitor = "wayland";
      sink_whitelist = [
        {name = "HyperX QuadCast S Analog Stereo";}
      ];
      node_blacklist = [
      ];
    };
  };
}
