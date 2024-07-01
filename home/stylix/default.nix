{
  pkgs,
  config,
  stylix,
  ...
}: {
  imports = [stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    image = config.lib.stylix.pixel "base0A";
    polarity = "dark";
  };
}
