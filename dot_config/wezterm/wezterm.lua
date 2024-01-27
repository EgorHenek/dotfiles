local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 15.0

config.color_scheme = "One Dark (Gogh)"

config.enable_scroll_bar = true

config.window_background_image = wezterm.config_dir .. "/homa.jpeg"
config.window_background_image_hsb = {
	brightness = 0.05,
	hue = 1.0,
	saturation = 1.0,
}

return config
