---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.codeium_status = function()
	return vim.fn["codeium#GetStatusString"]()
end

M.ui = {
	theme = "gruvchad",
	theme_toggle = { "gruvchad", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = {
		overriden_modules = function(modules)
			table.insert(modules, 7, M.codeium_status())
		end,
	},

	tabufline = {
		lazyload = false,
		overriden_modules = nil,
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
