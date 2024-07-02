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
    backgroundColor = "#1b1c28";
    textColor = "#ffffff";
    borderColor = "#5de4c7";
    borderSize = 2;
    borderRadius = 6;
    defaultTimeout = 5000;
    font = "FiraCode Nerd Font,Noto Sans CJK JP Medium 14px";

    extraConfig = ''
      format=<b>%s</b>\n\n%b
    '';
  };
}
