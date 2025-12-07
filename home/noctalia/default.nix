{pkgs, inputs, ...}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.nocatalia-shell = {
    enable = true;
    package = null;
  };
  services.nocatalia-shell.enable = true;
}
