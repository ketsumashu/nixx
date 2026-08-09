---@module 'hl'

local mainmod = "SUPER"
local terminal = "kitty"
local browser = "zen-beta"

--app binds
local exec_binds = {
  ["+B"]      = browser,
  ["+E"]      = "vesktop --gtk-version=4 --ozone-platform=wayland",
  ["+S"]      = "steam",
  ["+Return"] = terminal,
  ["+Space"]  = "noctalia msg panel-toggle launcher",
  ["+P"]      = "noctalia msg panel-toggle clipboard",
  ["+period"] = "noctalia msg session lock",
}
for key, cmd in pairs(exec_binds) do
  hl.bind(mainmod .. key, hl.dsp.exec_cmd(cmd))
end

--action binds
local action_binds = {
  ["+X"]          = hl.dsp.window.close(),
  ["+V"]          = hl.dsp.window.float(),
  ["+CTRL +Q"]    = hl.dsp.exit(),
  ["+H"]          = hl.dsp.focus({ direction = "left" }),
  ["+L"]          = hl.dsp.focus({ direction = "right" }),
  ["+K"]          = hl.dsp.focus({ direction = "up" }),
  ["+J"]          = hl.dsp.focus({ direction = "down" }),
  ["+mouse_up"]   = hl.dsp.focus({ direction = "left" }),
  ["+mouse_down"] = hl.dsp.focus({ direction = "right" }),
  ["+SHIFT +H"]   = hl.dsp.layout("swapcol l"),
  ["+SHIFT +L"]   = hl.dsp.layout("swapcol r"),
  ["+SHIFT +K"]   = hl.dsp.layout("expel"),
  ["+SHIFT +J"]   = hl.dsp.layout("consume"),
  ["+C"]          = hl.dsp.layout("fit_into_view"),
  ["+F"]          = hl.dsp.layout("fit active"),
  ["+SHIFT +F"]   = hl.dsp.layout("promote"),
  ["+Tab"]        = hl.dsp.focus({ workspace = "e+1" }),
  ["+SHIFT +Tab"] = hl.dsp.focus({ workspace = "e-1" }),
}
for key, action in pairs(action_binds) do
  hl.bind(mainmod .. key, action)
end

hl.bind(mainmod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainmod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

--workspace groups
local workspace_groups = {
  { range = { 1, 2, 3, 4 }, monitor = "HDMI-A-1" },
  { range = { 5, 6 },       monitor = "DP-3" },
  { range = { 7, 8, 9 },    monitor = "DP-2" },
}
for _, group in ipairs(workspace_groups) do
  for _, ws in ipairs(group.range) do
    hl.workspace_rule({
      workspace = ws,
      monitor = group.monitor,
      default = true,
    })
  end
end

-- workspace move
for i = 1, 10 do
  local key_num = (i == 10) and 0 or i
  hl.bind(mainmod .. "+ " .. key_num, hl.dsp.focus({ workspace = i }))
  hl.bind(mainmod .. "+SHIFT + " .. key_num, hl.dsp.window.move({ workspace = i }))
end

--general config
hl.config({
  general = {
    allow_tearing = true,
    border_size = 3,
    gaps_in = 5,
    gaps_out = 9,
    layout = "scrolling",
    col = {
      active_border = "rgb(77adb1)",
      inactive_border = "rgb(191c25)",
    },
  },
  input = {
    follow_mouse = 1,
    kb_layout = "us",
    kb_options = "ctrl:nocaps",
    repeat_delay = 270,
    repeat_rate = 50,
  },
  binds = {
    scroll_event_delay = 0,
  },
  master = {
    smart_resizing = true,
  },
  misc = {
    allow_session_lock_restore = true,
    disable_autoreload = false,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 1,
    initial_workspace_tracking = 0,
  },
  animations = {
    enabled = true,
  },
  decoration = {
    blur = {
      brightness = 0.9200,
      contrast = 1.2,
      enabled = true,
      noise = 0.080000,
      passes = 2,
      popups = true,
      size = 5,
    },
    shadow = {
      enabled = true,
      range = 3,
      render_power = 3,
    },
    rounding = 4,
  },
})

--monitor settings
local monitors = {
  { output = "DP-2",     mode = "2560x1440@100", position = "0x0",    scale = 1 },
  { output = "HDMI-A-1", mode = "3840x2160@120", position = "2560x0", scale = 1 },
  { output = "DP-1",     mode = "2560x1440@120", position = "6400x0", scale = 1 },
}
for _, config in ipairs(monitors) do
  hl.monitor(config)
end

--window rules
local float_rules = {
  { class = ".*xdg-desktop-portal-gtk" },
  { class = ".*org.pulseaudio.pavucontrol" },

  { title = "Save File" },
  { title = ".*blob.*" },
  { title = "Select what to share" },
  { title = ".*Steam Settings.*" },
  { title = ".*Chat.*" },
  { title = ".*Friends List.*" },
  { title = ".*Add Non-Steam Game.*" },
  { title = ".*Steam- Self Updater.*" },
  { title = ".*フレンドリスト.*" },
  { title = ".*Steam Guard- Computer Authorization Required.*" },

  { class = ".*steam.*", title = ".*ist" },
  { class = ".*steam.*", title = ".*started.*" },
}
for _, rule in ipairs(float_rules) do
  hl.window_rule({
    match = rule,
    float = true,
  })
end

hl.window_rule({
  match = { title = ".*bmz.*" },
  fullscreen = true,
})

hl.window_rule({
  match = { class = ".*vesktop.*" },
  workspace = "7 silent",
})
hl.window_rule({
  match = { class = "steam" },
  workspace = "1 silent",
})
hl.window_rule({
  match = { class = ".*steam.*", title = ".*Manager.*" },
})

--window animations
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 300, dampening = 30 })
for _, leaf_name in ipairs({ "windows", "workspaces" }) do
  hl.animation({
    leaf = leaf_name,
    enabled = true,
    speed = 40,
    spring = "rubber",
    style = "slide"
  })
end

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd(
    "dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target")
  hl.exec_cmd("systemctl --user enable xdg-desktop-portal-hyprland")
  hl.exec_cmd("steam")
  hl.exec_cmd("yaskkserv2 --google-suggest /home/mashu/nixx/home/libskk/jisyo.yaskkserv2")
  hl.exec_cmd("vesktop --gtk-version=4 --ozone-platform=wayland")
  hl.exec_cmd("openrgb --startminimized -p ~/.config/OpenRGB/pro.orp")
end)

-- Shutdown
hl.on("hyprland.shutdown", function()
  hl.exec_cmd("systemctl --user stop hyprland-session.target")
end)
