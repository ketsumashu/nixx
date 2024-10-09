{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-skk
      fcitx5-gtk
      fcitx5-nord
      fcitx-configtool
    ];
    fcitx5.waylandFrontend = true;
  };
}
