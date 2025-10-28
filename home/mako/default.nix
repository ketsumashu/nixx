{
  services.mako = {
    enable = true;
    settings = {
      icons = true;
      sort = "-time";
      layer = "overlay";
      anchor = "bottom-right";
      width = 400;
      height = 230;
      padding = "16";
      margin = "10,10,10";
      output = "HDMI-A-1";
      background-color = "#191c25";
      text-color = "#c5c4d4";
      border-color = "#77adb1";
      border-size = 2;
      border-radius = 6;
      default-timeout = 5000;
      font = "PlemolJP35 Console HS 13px";
    };
    extraConfig = ''
      format=<b>%s</b>\n\n%b
    '';
  };
}
