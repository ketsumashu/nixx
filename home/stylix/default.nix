{
  pkgs,
  config,
  stylix,
  ...
}: {
  imports = [stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";
  };
}
