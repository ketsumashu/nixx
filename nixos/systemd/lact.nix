{ pkgs, ... }: {
  systemd.services.lactd = {
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    description = "AMDGPU Control Daemon";
    serviceConfig = { ExecStart = "${pkgs.lact}/bin/lact daemon"; };
  };
  environment.systemPackages = [ pkgs.lact ];
}
