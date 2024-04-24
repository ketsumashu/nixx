{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nix.nix
    ./boot.nix
    ./user.nix
    ./steam.nix
    ./media.nix
    ./localisation.nix
    ./fonts.nix
    ./systemd
    ./tuigreet.nix
  ];
}
