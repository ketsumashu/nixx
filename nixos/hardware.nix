{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      package = pkgs.mesa;
      package32 = pkgs.pkgsi686Linux.mesa;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    amdgpu.overdrive.enable = true;
  };
  services = {
    dbus.enable = true;
    pulseaudio.enable = false;
    hardware.openrgb.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    gvfs.enable = true;
    udev = {
      packages = with pkgs; [
        qmk
        qmk-udev-rules
        qmk_hid
        via
        vial
      ];
    };
  };
  security.rtkit.enable = true;
}
