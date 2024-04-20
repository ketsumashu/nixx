# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;
  #  boot.initrd.kernelModules = [ "usbhid" "joydev" "xpad" ];
  #  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

  networking.hostName = "mashunix"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-skk
        fcitx5-rose-pine
        libsForQt5.fcitx5-qt
        libsForQt5.fcitx5-configtool
      ];
    };
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  #Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  #Environment variables
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
  };

  #Notifications
  services.mako = {
    enable = true;
    icons = true;
    sort = "-time";
    layer = "overlay";
    anchor = "bottom-right";
    width = 400;
    height = 230;
    padding = "16";
    margin = "10,10,10";
    output = "HDMI-A-2";
    backgroundColor = "#1b1c28dd";
    textColor = "#ffffff";
    borderColor = "#5de4c7ff";
    borderSize = 2;
    borderRadius = 6;
    defaultTimeout = 5000;
    font = "Cozette,mplus12 11px";
    format ="<b>%s</b>\n\n%b";
  };

  #Sounds
  sound = {enable = true;};

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Graphics
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  services.dbus.enable = true;
  
  # RGB control
  services.hardware.openrgb.enable = true;

  # Steam, for opengl access
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals  = with pkgs; [
      xdg-desktop-portal-gtk 
      xdg-desktop-portal-hyprland
    ];
    configPackages  = with pkgs; [
      xdg-desktop-portal-gtk 
      xdg-desktop-portal-hyprland
    ];
  };

  # Polkit
  security.polkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mashu = {
    isNormalUser = true;
    description = "mashu";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Enable flakes
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    gh
    git
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
