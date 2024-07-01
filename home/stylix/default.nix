{
  pkgs,
  input,
  ...
}: {
  imports = [input.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    wallpaper = ./wallpaper.png;
    polarity = "dark";
  };
}
