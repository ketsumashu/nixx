{pkgs, inputs, ...}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
  };
  services.noctalia-shell.systemd.enable = true;
}
