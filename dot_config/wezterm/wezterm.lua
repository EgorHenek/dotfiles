local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'Iosevka Nerd Font'
config.font_size = 15.0

config.color_scheme = 'Kanagawa (Gogh)'

config.enable_scroll_bar = true

config.unix_domains = {
  {
    name = 'unix',
  },
}
config.default_gui_startup_args = { 'connect', 'unix' }
config.keys = {
  {
    key = 'L',
    mods = 'CTRL',
    action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' },
  },
  {
    key = 'L',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' },
  },
  {
    key = 'l',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' },
  },
}

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return config
