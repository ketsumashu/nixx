{inputs, ...}:{
  modules = [  inputs.stylix.homeManagerModules.stylix ];
  stylix = {
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
