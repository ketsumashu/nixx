{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [hyprlock];

  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
      path = screenshot
      blur_passes = 3
      brightness = 0.7
      noise = 0.01
    }
    input-field {
      monitor = HDMI-A-1
      outline_thickness = 1
      dots_size = 0.2
      position = 300, 100
      valign = bottom
    }
    label{
      monitor = HDMI-A-1
      text = $TIME
      position = 100, 100
      font_size = 40
      font_family = FiraCode
    }
  '';
}
