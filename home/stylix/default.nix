{pkgs, stylix, ...}:{
  modules = [  stylix.homeManagerModules.stylix];
  stylix = {
    image =  ../../18a9a4a054e4d1f8.png;
    polarity = "dark";
    autoenable = true;
    targets = {
      fish.enable = true;
      gtk.enable = true;
      nixvim.enable = true;
      waybar.enable = true;
      rofi.enable = true;
      mako.enable = true;
      kitty.enable = true;
    };
  };
}
