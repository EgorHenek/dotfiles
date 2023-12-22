local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"nvimtools/none-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	{
		"folke/which-key.nvim",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "whichkey")
			require("which-key").setup(opts)
			local present, wk = pcall(require, "which-key")
			if not present then
				return
			end
			wk.register({
				-- add group
				["<leader>"] = {
					g = { name = "+git" },
					gt = { name = "+toggle" },
					tu = { name = "+ui" },
				},
			})
		end,
		setup = function()
			require("core.utils").load_mappings("whichkey")
		end,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			dofile(vim.g.base46_cache .. "syntax")
			require("custom.configs.tree-sitter")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"andythigpen/nvim-coverage",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("coverage").setup({
				commands = true,
				highlights = {
					covered = { fg = "#C3E88D" },
					uncovered = { fg = "#F07178" },
				},
				signs = {
					covered = { hl = "CoverageCovered", text = "▎" },
					uncovered = { hl = "CoverageUncovered", text = "▎" },
				},
			})
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-python",
			"rouge8/neotest-rust",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go")({
						experimental = {
							test_table = true,
						},
					}),
					require("neotest-python"),
					require("neotest-plenary"),
					require("neotest-rust"),
				},
				output = {
					enabled = true,
					open_on_run = true,
				},
			})
		end,
	},
	{
		"NvChad/nvterm",
		opts = overrides.nvterm,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.g.codeium_no_map_tab = 1
			vim.keymap.set("i", "<c-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true, desc = "Codeium accept" })
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()

			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
			require("dap-go").setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{ "akinsho/git-conflict.nvim", version = "v1.2.2", config = true },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
