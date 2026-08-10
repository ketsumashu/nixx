{ pkgs, ... }:
{
  services.gnome-keyring.enable = true;

  environment.packages = with pkgs; [
    gcr
    libsecret
    seahorse
  ];
}
