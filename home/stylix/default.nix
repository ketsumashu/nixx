{
  pkgs,
  input,
  ...
}: {
  imports = [input.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";
  };
}
