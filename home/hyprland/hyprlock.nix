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

      position = 0, 50
      halign = center
      valign = bottom
    }
    label{
      monitor =
      text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"
      color = $color6
      font_size = 64
      font_family = FiraCode 10
      shadow_passes = 3
      shadow_size = 4

      position = 0, 16
      halign = center
      valign = center
    }
    # Date
    label {
      monitor =
      text = cmd[update:18000000] echo "<b> "$(date +'%A, %-d %B %Y')" </b>"
      font_size = 24
      font_family = JetBrains Mono Nerd Font 10
  
      position = 0, -16
      halign = center
      valign = center
    }

    label {
      monitor =
      text = Hey $USER
      font_size = 18
      font_family = FiraCode
    
      position = 0, 30
      halign = center
      valign = bottom
    }
  '';
}
