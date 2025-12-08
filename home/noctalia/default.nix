{pkgs, inputs, ...}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.nocatalia-shell = {
    enabled = true;
  };
  services.nocatalia-shell.systemd.enabled = true;
}
