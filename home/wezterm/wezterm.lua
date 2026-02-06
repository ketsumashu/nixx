local wezterm = require 'wezterm'
return {
    default_prog = { '/usr/bin/fish', '-l' },
    window_background_opacity = 0.87,
    enable_wayland = true,
    color_scheme = "Noctalia",
    use_ime = false,
    check_for_updates = false,
    warn_about_missing_glyphs = false,
    hide_tab_bar_if_only_one_tab = true,
    window_close_confirmation = "NeverPrompt",
    font = wezterm.font_with_fallback {
        {
            family = "Terminus",
            weight = "Medium",
            stretch = "Normal",
            style = "Normal",
        },
        { family = "FiraCode Nerd Font",
          weight = "Medium",
          stretch = "Normal",
          style = "Normal"
        },
        {
            family = "mplus12",
            weight = "Regular",
            stretch = "Normal",
            style = "Normal"
        }
    },
    font_size = 10.0,
    line_height = 1.3,
    cell_width = 1.02,
    window_padding = {
      left = "16px",
      top = "16px",
      bottom = "16px",
      right = "16px",
    }
}

