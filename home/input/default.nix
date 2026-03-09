{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-skk
      fcitx5-gtk
      fcitx5-nord
      qt6Packages.fcitx5-configtool
    ];
    fcitx5.waylandFrontend = true;
  };
  systemd.user.units = {
    "app-org.fcitx.Fcitx5@autostart.service".enable = false;
  };
}
