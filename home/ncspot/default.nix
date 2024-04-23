{pkgs, ... }:{
  programs.ncspot = {
    enable = true;
    package = (pkgs.ncspot.override{
        cover = true;
      });
    settings = {
      use_nerdfont = false;
      gapless = true;
    };
  };
}
