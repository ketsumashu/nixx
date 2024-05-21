{pkgs,inputs, ...}: let
  pkgs-unsta = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in{
  hardware = {
    opengl = {
      enable = true;
      package = pkgs-unsta.mesa.drivers;
      package32 = pkgs-unsta.pkgsi686Linux.mesa.drivers;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio.enable = false;
  };

  services = {
    dbus.enable = true;
    hardware.openrgb.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
  sound = {enable = true;};
  security.rtkit.enable = true;
}
