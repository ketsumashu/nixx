{ pkgs, ... }: {
  systemd.services.chownX11 = {
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    description = "chown mashu /tmp/.X11-unix";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.coreutils}/bin/chown mashu /tmp/.X11-unix";
      Restart = "no";
    };
  };
  environment.systemPackages = [ pkgs.coreutils ];
}
