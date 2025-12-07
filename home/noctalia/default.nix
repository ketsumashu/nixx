{pkgs, inputs, ...}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  services.nocatalia-shell.systemd.enable = true;
}
