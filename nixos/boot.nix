{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  networking.hostName = "mashunix";

  # Enable networking
  networking.networkmanager.enable = true;
}
