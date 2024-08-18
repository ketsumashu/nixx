{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      ### Variables
      set $mod Mod4
      set $left h
      set $down j
      set $up k
      set $right l
      set $term kitty
      set $menu "rofi -show drun"
      ### startups
      exec swww-daemon
      exec fcitx5 -rd
      exec waybar
      exec vesktop --gtk-version=4 --ozone-platform-hint=auto
      exec_always autotiling-rs
      exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      bindsym $mod+b exec qutebrowser
      bindsym $mod+ctrl+l exec hyprlock

      gaps outer 2
      gaps inner 4
      corner_radius 12
      default_border pixel 3
      titlebar_border_thickness 2
      titlebar_padding 15
      ### floating setting
      for_window [app_id="pavucontrol"] floating enable
      for_window [class="fcitx5-config-qt"] floating enable
      for_window [title="Firefox — Sharing Indicator"] kill
      for_window [title="Firefox — Sharing Indicator"] kill
      for_window [title = "About Mozilla Firefox"] floating enable
      for_window [title = "拡張機能: (Bitwarden Password Manager) - Bitwarden — Mozilla Firefox"] floating enable
      for_window [window_role = "About"] floating enable
      for_window [app_id="firefox" title="Library"] floating enable, border pixel 1, sticky enable

      for_window [class="^steam$" title="^Friends$"] floating enable
      for_window [class="^steam$" title="Steam - News"] floating enable
      for_window [class="^steam$" title=".* - Chat"] floating enable
      for_window [class="^steam$" title="^Settings$"] floating enable
      for_window [class="^steam$" title=".* - event started"] floating enable
      for_window [class="^steam$" title=".* CD key"] floating enable
      for_window [class="^steam$" title="^Steam - Self Updater$"] floating enable
      for_window [class="^steam$" title="^Screenshot Uploader$"] floating enable
      for_window [class="^steam$" title="^Steam Guard - Computer Authorization Required$"] floating enable
      for_window [title="^Steam Keyboard$"] floating enable
      ### Output configuration
      output HDMI-A-1 pos 0 0 resolution 2560x1440@144Hz scale 1
      output HDMI-A-2 pos 2560 -600 resolution 2560x1440@100Hz scale 1 transform 270

      ### Input configuration
         input "*" {
         	xkb_layout "us"
      	repeat_delay 270
      	repeat_rate 50
          xkb_options ctrl:nocaps
         }

      # You can get the names of your inputs by running: swaymsg -t get_inputs
      # Read `man 5 sway-input` for more information about this section.

      ### Key bindings
      #
      # Basics:
      #
          # Start a terminal
          bindsym $mod+Return exec $term

          # Kill focused window
          bindsym $mod+x kill

          # Start your launcher
          bindsym $mod+Space exec $menu

          # mouse button for dragging.
          floating_modifier $mod normal

          # Reload the configuration file
          bindsym $mod+ctrl+c reload

          # Exit sway (logs you out of your Wayland session)
          bindsym $mod+Shift+e exec swaynag -t warning -m 'EXIT?' -B 'exit' 'swaymsg exit'

      #
      # Moving around:
      #
          # Move your focus around
          bindsym $mod+$left focus left
          bindsym $mod+$down focus down
          bindsym $mod+$up focus up
          bindsym $mod+$right focus right
          # Or use $mod+[up|down|left|right]
          bindsym $mod+Left focus left
          bindsym $mod+Down focus down
          bindsym $mod+Up focus up
          bindsym $mod+Right focus right

          # Move the focused window with the same, but add Shift
          bindsym $mod+Shift+$left move left
          bindsym $mod+Shift+$down move down
          bindsym $mod+Shift+$up move up
          bindsym $mod+Shift+$right move right
          # Ditto, with arrow keys
          bindsym $mod+Shift+Left move left
          bindsym $mod+Shift+Down move down
          bindsym $mod+Shift+Up move up
          bindsym $mod+Shift+Right move right
      #
      # Workspaces:
      #
          # Switch to workspace
          bindsym $mod+1 workspace number 1
          bindsym $mod+2 workspace number 2
          bindsym $mod+3 workspace number 3
          bindsym $mod+4 workspace number 4
          bindsym $mod+5 workspace number 5
          bindsym $mod+6 workspace number 6
          bindsym $mod+7 workspace number 7
          bindsym $mod+8 workspace number 8
          bindsym $mod+9 workspace number 9
          bindsym $mod+0 workspace number 10
          # Move focused container to workspace
          bindsym $mod+Shift+1 move container to workspace number 1
          bindsym $mod+Shift+2 move container to workspace number 2
          bindsym $mod+Shift+3 move container to workspace number 3
          bindsym $mod+Shift+4 move container to workspace number 4
          bindsym $mod+Shift+5 move container to workspace number 5
          bindsym $mod+Shift+6 move container to workspace number 6
          bindsym $mod+Shift+7 move container to workspace number 7
          bindsym $mod+Shift+8 move container to workspace number 8
          bindsym $mod+Shift+9 move container to workspace number 9
          bindsym $mod+Shift+0 move container to workspace number 10

      #
      # Layout stuff:
      #

          # Switch the current container between different layout styles
          bindsym $mod+s layout stacking
          bindsym $mod+w layout tabbed
          bindsym $mod+e layout toggle split

          # Make the current focus fullscreen
          bindsym $mod+f fullscreen

          # Toggle the current focus between tiling and floating mode
          bindsym $mod+v floating toggle
          # Define outputs
          set $output-primary HDMI-A-1
          set $output-secondary HDMI-A-2

          # workspace to displays
          workspace 1 output $output-primary
          workspace 2 output $output-primary
          workspace 3 output $output-primary
          workspace 4 output $output-primary
          workspace 5 output $output-secondary
          workspace 6 output $output-secondary
          workspace 7 output $output-secondary
          workspace 8 output $output-secondary
          workspace 9 output $output-secondary
          workspace 10 output $output-secondary

      #
      # Scratchpad:
      #

          # Move the currently focused window to the scratchpad
          bindsym $mod+Shift+minus move scratchpad

          # Show the next scratchpad window or hide the focused scratchpad window.
          # If there are multiple scratchpad windows, this command cycles through them.
          bindsym $mod+minus scratchpad show

      #
      # Resizing containers:
      #
      mode "resize" {
          # left will shrink the containers width
          # right will grow the containers width
          # up will shrink the containers height
          # down will grow the containers height
          bindsym $left resize shrink width 10px
          bindsym $down resize grow height 10px
          bindsym $up resize shrink height 10px
          bindsym $right resize grow width 10px

          # Ditto, with arrow keys
          bindsym Left resize shrink width 10px
          bindsym Down resize grow height 10px
          bindsym Up resize shrink height 10px
          bindsym Right resize grow width 10px

          # Return to default mode
          bindsym Return mode "default"
          bindsym Escape mode "default"
      }
      bindsym $mod+r mode "resize"

      # class                 border  bground text    indicator child_border
      client.focused          #5de4c7 #1b1c28 #a6accd #5de4c7   #5de4c7
      client.focused_inactive #1b1c28 #1b1c28 #a6accd #484E50   #191c25
      client.unfocused        #2E3440 #1b1c28 #a6accd #292D2E   #222222
      client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
      client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C

      client.background       #000000

      #
      # Status Bar:
      #
      #bar {
      #    position left
      #    status_command waybar
      #    font pango:Fira Code,Blobmoji 12px
      #    tray_output *
      #    colors {
      #    	background #191c25
      #    	statusline #D8DEE9
      #    	separator  #666666
      #
      #    	focused_workspace  #191c25 #191c25 #889bb4
      #    	active_workspace   #191c25 #191c25 #BBFBF1
      #    	inactive_workspace #191c25 #191c25 #D8DEE9
      #    	urgent_workspace   #BF616A #BF616A #191c25
      #    	binding_mode       #2E3440 #BF616A #191c25
      #    }
      #}
    '';
  };
}
