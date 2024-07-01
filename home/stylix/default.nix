{pkgs, input, ...}:{
  import = [input.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    wallpaper = ./wallpaper.png;
    polarity = "dark";
  };
}
