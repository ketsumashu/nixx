{
  inputs,
  pkgs,
  ...
}: let
  palette = {
    background = "#1b1c28";
    background-alt = "#1b1c28";
    background-attention = "#181920";
    border = "#5de4c7";
    current-line = "#44475a";
    selection = "#44475a";
    foreground = "#a6accd";
    foreground-alt = "#e0e0e0";
    foreground-attention = "#ffffff";
    comment = "#6272a4";
    cyan = "#fae4fc";
    green = "#5de4c7";
    pink = "#fcc5e9";
    purple = "#fae4fc";
    red = "#fcc5e9";
    yellow = "#5de4c7";
  };
in {
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        "j" = "scroll-px 0 700";
        "k" = "scroll-px 0 -700";
      };
    };
    settings = {
      editor.command = ["foot" "-e" "{file}"];
      content.javascript.clipboard = "access-paste";
      fonts = {
        default_family = ["Cozette" "mplus12"];
        default_size = "11px";
      };
      scrolling.smooth = true;
      colors = {
        webpage.preferred_color_scheme = "dark";
        completion = {
          category = {
            bg = palette.background;
            border = {
              bottom = palette.border;
              top = palette.border;
            };
            fg = palette.foreground;
          };
          even = {
            bg = palette.background;
          };
          odd = {
            bg = palette.background-alt;
          };
          fg = palette.foreground;
          item = {
            selected = {
              bg = palette.background;
              border = {
                bottom = palette.selection;
                top = palette.selection;
              };
              fg = palette.green;
              match = {
                fg = palette.purple;
                bg = palette.background;
              };
            };
          };
          match = {
            fg = palette.green;
          };
          scrollbar = {
            bg = palette.background;
            fg = palette.foreground;
          };
        };
        downloads = {
          bar = {
            bg = palette.background;
          };
          error = {
            bg = palette.background;
            fg = palette.red;
          };
          stop = {
            bg = palette.background;
          };
          system = {
            bg = "none";
          };
        };
        hints = {
          bg = palette.background;
          fg = palette.green;
          match = {
            fg = palette.foreground-alt;
          };
        };
        keyhint = {
          bg = palette.background;
          fg = palette.purple;
          suffix = {
            fg = palette.selection;
          };
        };
        messages = {
          error = {
            bg = palette.background;
            border = palette.background-alt;
            fg = palette.red;
          };
          info = {
            bg = palette.background;
            border = palette.background-alt;
            fg = palette.comment;
          };
          warning = {
            bg = palette.background;
            border = palette.background-alt;
            fg = palette.red;
          };
        };
        statusbar = {
          caret = {
            bg = palette.background;
            fg = palette.green;
            selection = {
              bg = palette.background;
              fg = palette.green;
            };
          };
          command = {
            bg = palette.background;
            fg = palette.green;
            private = {
              bg = palette.background;
              fg = palette.foreground-alt;
            };
          };
          insert = {
            bg = palette.background-attention;
            fg = palette.foreground-attention;
          };
          normal = {
            bg = palette.background;
            fg = palette.foreground;
          };
          passthrough = {
            bg = palette.background;
            fg = palette.green;
          };
          private = {
            bg = palette.background-alt;
            fg = palette.foreground-alt;
          };
          progress = {
            bg = palette.background;
          };
          url = {
            error = {
              fg = palette.red;
            };
            fg = palette.foreground;
            hover = {
              fg = palette.cyan;
            };
            success = {
              http = {
                fg = palette.green;
              };
              https = {
                fg = palette.green;
              };
            };
            warn = {
              fg = palette.yellow;
            };
          };
        };
        tabs = {
          bar = {
            bg = palette.background;
          };
          even = {
            bg = palette.background;
            fg = palette.foreground;
          };
          indicator = {
            error = palette.red;
            start = palette.pink;
            stop = palette.green;
            system = "none";
          };
          odd = {
            bg = palette.background;
            fg = palette.foreground;
          };
          selected = {
            even = {
              bg = palette.background;
              fg = palette.green;
            };
            odd = {
              bg = palette.background;
              fg = palette.green;
            };
          };
          pinned = {
            even = {
              bg = palette.background;
              fg = palette.green;
            };
            odd = {
              bg = palette.background;
              fg = palette.green;
            };
            selected = {
              even = {
                bg = palette.background;
                fg = palette.green;
              };
              odd = {
                bg = palette.background;
                fg = palette.green;
              };
            };
          };
        };
      };
      hints = {
        border = "1px solid ${palette.background-alt}";
      };
      tabs = {
        favicons = {
          scale = 1;
        };
        indicator = {
          width = 1;
        };
        position = "left";
        width = "9%";
        padding = [
          "bottom:10"
          "left:5"
          "right:5"
          "top:10"
        ];
      };
      statusbar = {
        padding = [
          "bottom:10"
          "left:5"
          "right:5"
          "top:10"
        ];
      };
    };
  };
  home.packages = with pkgs; [
    # widevine-cdm
  ];
}
