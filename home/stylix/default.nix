{
  pkgs,
  input,
  config,
  ...
}: {
  imports = [input.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    polarity = "dark";
  };
}
