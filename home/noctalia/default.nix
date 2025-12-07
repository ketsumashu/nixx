{pkgs, inputs, ...}:
{
  imports = [
    inputs.nocatalia.homeModules.default
  ];

  programs.nocatalia-shell = {
    enable = true;
    package = null;
  };
  services.nocatalia-shell.systemd.enable = true;
}
