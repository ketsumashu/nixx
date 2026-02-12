{ ... }:
let
  palette = {
    background = "#131313";
    background-alt = "#131313";
    background-attention = "#131313";
    border = "#5edbbb";
    current-line = "#525566";
    selection = "#525566";
    foreground = "#e2e2e2";
    foreground-alt = "#e0e0e0";
    foreground-attention = "#ffffff";
    comment = "#5edbbb";
    cyan = "#a9cbe3";
    green = "#5edbbb";
    pink = "#cdb6dd";
    purple = "#cdb6dd";
    red = "#a994b8";
    yellow = "#77adb1";
  };
in
{
  xdg.configFile."qutebrowser/greasemonkey".source = ./greasemonkey;
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        "t" = "cmd-set-text -s :open -t";
        "yf" = "hint links yank";
        "yd" = "hint links download";
        "j" = "scroll-px 0 300";
        "k" = "scroll-px 0 -300";
      };
      insert = { };
    };
    searchEngines = {
      "DEFAULT" = "https://www.google.com/search?client=firefox-b-d&q={}";
      "y" = "https://youtube.com/results?search_query={}";
      "gt" = "https://github.com/search?q={}&type=repositories";
    };
    settings = {
      url = {
        default_page = "https://google.com/?hl=ja";
        start_pages = [ "https://google.com/?hl=ja" ];
      };
      editor.command = [
        "foot"
        "-e"
        "nvim"
        "{file}"
      ];
      content.javascript.clipboard = "access-paste";
      fonts = {
        default_family = [
          "HelveticaNeueLT Std"
        ];
        default_size = "14px";
        web.family = {
          sans_serif = "HelveticaNeueLT Std Med";
          serif = "Noto Serif CJK JP";
          fixed = "PlemolJP35 Console HS";
          standard = "HelveticaNeueLT Std Med";
        };
      };
      content.blocking.method = "both";
      content.blocking.adblock.lists = [
        "https://raw.githubusercontent.com/tofukko/filter/master/Adblock_Plus_list.txt"
      ];
      zoom.default = "100%";
      scrolling.smooth = true;
      scrolling.bar = "never";
      auto_save.session = true;
      qt.highdpi = true;
      colors = {
        webpage.preferred_color_scheme = "dark";
        completion = {
          category = {
            bg = palette.background;
            fg = palette.foreground;
            border = {
              bottom = palette.border;
              top = palette.border;
            };
          };
          even = {
            bg = palette.background;
          };
          odd = {
            bg = palette.background-alt;
          };
          item = {
            selected = {
              bg = palette.background;
              border = {
                bottom = palette.green;
                top = palette.green;
              };
              fg = palette.green;
              match = {
                fg = palette.purple;
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
              fg = palette.foreground;
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
          };
        };
        contextmenu = {
          disabled.fg = palette.foreground;
          menu = {
            bg = palette.background;
            fg = palette.foreground;
          };
          selected.fg = palette.green;
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
          width = 3;
        };
        position = "bottom";
        width = 30;
        show = "always";
        show_switching_delay = 800;
        new_position.related = "last";
      };
      statusbar.show = "always";
      completion = {
        height = "10%";
      };
    };
    extraConfig = ''
      c.statusbar.padding = { "bottom":5, "right":5, "left":5, "top":0 }
      c.tabs.padding = { "bottom":0, "right":5, "left":5, "top":5 }
      c.tabs.title.format = "{current_title}"
      c.tabs.title.format_pinned = "{current_title}"
      c.statusbar.widgets = ["keypress", "search_match","url","scroll","history","progress"]
      config.unbind("O")
      config.load_autoconfig(False)
    '';
  };
}
