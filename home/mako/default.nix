{
  services.mako = {
    enable = true;
    icons = true;
    sort = "-time";
    layer = "overlay";
    anchor = "bottom-right";
    width = 400;
    height = 230;
    padding = "16";
    margin = "10,10,10";
    output = "HDMI-A-1";
    backgroundColor = "#191c25";
    textColor = "#c5c4d4";
    borderColor = "#77adb1";
    borderSize = 2;
    borderRadius = 6;
    defaultTimeout = 5000;
    font = "Cozette,mplus12 10px";

    extraConfig = ''
      format=<b>%s</b>\n\n%b
    '';
  };
}
