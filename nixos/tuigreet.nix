{pkgs,config, lib, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "tuigreet --cmd Hyprland";
        user = "greeter";
      };
      initial_session = lib.mkIf config.autologin.enable {
        command = lib.mkIf config.hyprland.enable "Hyprland";
        user = "mashu";
      };
    };
  };

  environment.systemPackages = with pkgs; [greetd.tuigreet];

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
