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
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        gfxmodeEfi = "2560x1440x32";
        theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelModules = [
      "kvm-amd"
      "v4l2loopback"
      "ntsync"
    ];
    supportedFilesystems = [ "ntfs" ];
    blacklistedKernelModules = [ "k10temp" ];
    kernelPackages = pkgs.linuxPackages_latest;
    tmp.cleanOnBoot = true;
    extraModulePackages = with config.boot.kernelPackages; [
      zenpower
      v4l2loopback
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    kernelParams = [
      "amdgpu.dcfeaturemask=0x402"
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1f97ab8a-6326-464c-bb68-b1ce6cefd75e";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E58F-0428";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ ];

  networking = {
    useDHCP = false;
    hostName = "mashu-nix-101";
    useNetworkd = true;
    firewall.allowedUDPPorts = [ ];
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
