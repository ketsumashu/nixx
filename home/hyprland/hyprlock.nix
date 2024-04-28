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
      size = 250, 50
      outline_thickness = 3
      dots_size = 0.26 # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.64 # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true
      fade_on_empty = true
      placeholder_text = <i>Password...</i> # Text rendered in the input box when it's empty.
      hide_input = false

      position = 0, 100
      halign = center
      valign = bottom
    }
    label{
      monitor =
      text = cmd[update:1000] echo "<big> $(date +"%H:%M:%S") </big>"
      font_size = 24
      font_family = CozetteHiDpi 
      shadow_passes = 3
      shadow_size = 4

      position = 0, 16
      halign = center
      valign = center
    }
    # Date
    label {
      monitor =
      text = cmd[update:18000000] echo ""$(date +'%A, %-d %B %Y')""
      font_size = 16
      font_family = CozetteHiDpi
  
      position = 0, -16
      halign = center
      valign = center
    }
  '';
}
