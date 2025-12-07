{pkgs, inputs, ,,,}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.nocatalia-shell = {
    enable = true;
  };
  services.nocatalia-shell.enable = true;
}
