{pkgs, ...}: {
  systemd.services.chownX11 = {
    wantedBy = ["multi-user.target"];
    after = ["multi-user.target"];
    description = "chown /tmp/.X11-unix to mashu for executing gamescope in Steam app";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.coreutils}/bin/chown mashu /tmp/.X11-unix'';
      Restart = "no";
    };
  };
  environment.systemPackages = [pkgs.coreutils];
}
