{ pkgs, lib, config, ... }:
{
  services.greetd =
    let
    minimumConfig = pkgs.writeText "minimum-config.kdl" ''
      hotkey-overlay {
        skip-at-startup
      }
      spawn-sh-at-startup "${lib.getExe pkgs.regreet}; niri msg action quit --skip-confirmation"
    '';
    in
    {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe config.programs.niri.package} --config ${minimumConfig}";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [ regreet ];

  # systemd.services.greetd.serviceConfig = {
  #   Type = "idle";
  #   StandardInput = "tty";
  #   StandardOutput = "tty";
  #   StandardError = "journal"; # Without this errors will spam on screen
  #   # Without these bootlogs will spam on screen
  #   TTYReset = true;
  #   TTYVHangup = true;
  #   TTYVTDisallocate = true;
  # };
}
