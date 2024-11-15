local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 17.0

config.color_scheme = "Kanagawa (Gogh)"

config.enable_scroll_bar = true

config.keys = {
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "P",
		mods = "CMD",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "+",
		mods = "CMD",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "q",
		mods = "CMD",
		action = wezterm.action.QuitApplication,
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.QuickSelect,
	},
	{
		key = "C",
		mods = "CMD",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "u",
		mods = "CMD",
		action = wezterm.action.ScrollByPage(-1),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.ScrollByPage(1),
	},
	{
		key = "U",
		mods = "CMD",
		action = wezterm.action.ScrollByPage(-0.5),
	},
	{
		key = "D",
		mods = "CMD",
		action = wezterm.action.ScrollByPage(0.5),
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}
config.disable_default_key_bindings = true

config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})
config.enable_tab_bar = false

return config
