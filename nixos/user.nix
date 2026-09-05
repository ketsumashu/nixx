{ pkgs, ... }: {
  users.users.mashu = {
    isNormalUser = true;
    description = "mashu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
    NH_FLAKE = "/home/mashu/nixx/";
  };
  environment.pathsToLink = [
    "/share/fish"
    "/share/applications"
    "/share/xdg-desktop-portal"
    "/var/lib/flatpak/exports/share"
    "/home/mashu/.local/share/flatpak/exports/share"
  ];

  security = {
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.loginLimits = [
      {
        domain = "@audio";
        type = "-";
        item = "rtprio";
        value = 20;
      }
    ];
  };
}
