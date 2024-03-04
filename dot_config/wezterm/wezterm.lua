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

return config
