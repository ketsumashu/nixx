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
    gvfs.enable = true;
  };
  security.rtkit.enable = true;
}
