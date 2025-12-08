{pkgs, inputs, ...}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.nocatalia-shell = {
    enable = true;
  };
  services.noctalia-shell.systemd.enabled = true;
}
