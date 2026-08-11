{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    devenv
  ];

  virtualisation.podman.enable = true;
}
