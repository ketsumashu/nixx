{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
      systemd.enable = true;
    };
    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "max";
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelModules = [ "kvm-amd" ];
    blacklistedKernelModules = [ "k10temp" ];
    extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/cc362739-1aab-4377-87a2-94789ef3f509";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E3B5-A188";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
  fileSystems."/home/mashu/data" = {
    device = "/dev/disk/by-uuid/78F0F0ACF0F0722C";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  swapDevices = [ ];

  networking = {
    useDHCP = false;
    hostName = "mashunix";
    useNetworkd = true;
  };

  systemd.network = {
    networks."10-wired" = {
      matchConfig.Name = "enp4s0";
      networkConfig.DHCP = "yes";
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
