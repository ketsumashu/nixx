{
  config,
  pkgs,
  ...
}: {
  imports = [./hypridle.nix ./hyprlock.nix];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    dconf
    meson
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    swww
    pavucontrol
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
"$mod" = "Super_L";
    "$terminal" = "foot";

    monitor = [
      "HDMI-A-2,2560x1440@144,0x0,1"
      "DP-1,2560x1440@100,2560x0,1"
    ];

    workspace = [
      "1, monitor:HDMI-A-2, default:true, persistent:true"
      "2, monitor:HDMI-A-2, default:true, persistent:true"
      "3, monitor:HDMI-A-2, default:true, persistent:true"
      "4, monitor:HDMI-A-2, default:true, persistent:true"
      "5, monitor:DP-1, default:true, persistent:true"
      "6, monitor:DP-1, default:true, persistent:true"
      "7, monitor:DP-1, default:true, persistent:true"
      "8, monitor:DP-1, default:true, persistent:true"
      "9, monitor:DP-1, default:true, persistent:true"
    ];

    general = {
      gaps_in = 3;
      gaps_out = 9;
      border_size = 2;
      "col.active_border" = "rgb(77adb1)";
      "col.inactive_border" = "rgb(525566)";
      layout = "dwindle";
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 1;
      disable_autoreload = false;
    };

    binds = {
      scroll_event_delay = 0;
    };

    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        size = 2;
        passes = 3;
        popups = true;
        contrast = 1;
        noise = 0.01;
        brightness = 0.92;
      };
      drop_shadow = true;
      shadow_range = 3;
      shadow_render_power = 3;
    };

    animations = {
      enabled = true;

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "cubic, 0.1, 0.23, 0.41, 0.9"
      ];
      animation = [
        "windows, 1, 1.2, cubic, slide"
        "border, 1, 0.1, default"
        "borderangle, 0, 0.2, default"
        "fade, 1, 4, default"
        "workspaces, 1, 4, default, fade"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
    };

    master = {
      new_is_master = true;
    };

    input = {
      kb_layout = "us";
      kb_options = "ctrl:nocaps";
      repeat_delay = 270;
      repeat_rate = 50;
    };

    windowrulev2 = [
      "float,class:^(blueman-manager)$"
      "float,title:(Save File)$"
      "float,title:$(Volume)"
      "float,title:(Open Files)$"
      "workspace 2 silent,class:^(steam)$"
      "float,class:^(steam)$,title:(ist)$"
      "float,class:^(steam)$,title:(ings)$"
      "float,class:^(steam)$,title:(Chat)$"
      "workspace 2,class:^(gamescope)"
      "float,class:^(steam)$,title:^(Steam - News)"
      "float,class:^(steam)$,title:(Chat)$"
      "float,class:^(steam)$,title:(started)$"
      "float,class:^(steam)$,title:(CD key)$"
      "float,class:^(steam)$,title:^(Steam - Self Updater)$"
      "float,class:^(steam)$,title:(Manager)$"
      "float,class:^(steam)$,title:^(Steam Guard - Computer Authorization Required)$"
    ];

    layerrule = [
      "blur,rofi"
      "blur,neovim"
      "blur,waybar"
    ];

    exec-once = [
      "hypridle"
      "waybar"
      "hyprctl dispatch exec \"\[workspace 2 silent\]\" steam"
      "fcitx5 -rd"
      "swww-daemon"
      "openrgb --startminimized"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind =
      [
        "$mod, B, exec, firefox"
        "$mod, S, exec, steam"
        "$mod, Return, exec, $terminal"
        "$mod, Space, exec, rofi -show drun"
        "$mod, P, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, X, killactive"
        "$mod, E, exec, discord"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod CTRL, Q, exit"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"
        "$mod, Tab, workspace, e+1"
        "$mod SHIFT, Tab, workspace, e-1"
        "$mod, V, togglefloating"
        "$mod, F, Fullscreen"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-White-Darkest-Solid";
    };

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Grey-Darkest";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 11;
  };

}
