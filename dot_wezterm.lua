local wezterm = require("wezterm")

return {
	font = wezterm.font("Iosevka Nerd Font"),
	font_size = 15.0,
	color_scheme = "Grape",
	enable_scroll_bar = true,
	keys = {
		-- This will create a new horizontal split
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({
				domain = "CurrentPaneDomain",
			}),
		},
		-- This will craete a new vertical split
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({
				domain = "CurrentPaneDomain",
			}),
		},
	},
}
