local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 17.0

config.color_scheme = "Kanagawa (Gogh)"

config.enable_scroll_bar = true

config.unix_domains = {
	{
		name = "unix",
	},
}
config.default_gui_startup_args = { "connect", "unix" }

config.keys = {
	{
		key = "L",
		mods = "CMD",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
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
		key = "h",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "V",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "H",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "W",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
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
		key = "S",
		mods = "CMD",
		action = wezterm.action.Search({ CaseSensitiveString = "" }),
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

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

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

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

return config
