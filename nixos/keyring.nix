{ pkgs, ... }:
{
  services.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    gcr
    libsecret
    seahorse
  ];
}
