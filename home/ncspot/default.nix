{pkgs, ... }:{
  programs.ncspot = {
    enable = true;
    settings = {
      use_nerdfont = false;
      gapless = true;
      cover = true;
    };
  };
}
