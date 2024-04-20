{ ... }:
{
  services.mako = {
    enable = true;
    icons = 1;
    sort = "-time";
    layer = "overlay";
    anchor = "bottom-right";
    width = 400;
    height = 230;
    padding = 16;
    margin = "10,10,10";
    max-icon-size = 64;
    output = "HDMI-A-2";
    backgroundColor = "#1b1c28dd";
    text-color = "#ffffff";
    borderColor = "#5de4c7ff";
    borderSize = 2;
    borderRadius = 6;
    defaultTimeout = 5000;
    font = "Cozette,mplus12 11px";
    format ="<b>%s</b>\n\n%b";
  };
}
