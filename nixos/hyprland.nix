{ inputs, ... }:
{
  imports = [ inputs.hyprland.nixosModules.default ];

  programs.hyprland.enable = true;

  services.sunshine = {
    enable = true;
    openFirewall = true;
  };
}
