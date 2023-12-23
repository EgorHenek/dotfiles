---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

M.project = {
	n = {
		["<leader>fp"] = {
			function()
				require("telescope").extensions.projects.projects()
			end,
			"Find project",
		},
	},
}

M.neotest = {
	n = {
		["<leader>tt"] = {
			function()
				require("neotest").run.run({ extra_args = { "-coverprofile=./coverage.out", "-coverpkg ./..." } })
			end,
			"Test current function",
		},
		["<leader>tf"] = {
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			"Test file",
		},
		["<leader>ts"] = {
			function()
				require("neotest").run.run(vim.fn.getcwd())
			end,
			"Test suite",
		},
		["<leader>tuo"] = {
			function()
				require("neotest").output_panel.toggle()
			end,
			"Toggle output",
		},
		["<leader>tus"] = {
			function()
				require("neotest").summary.toggle()
			end,
			"Toggle summary",
		},
	},
}

M.dap = {
	n = {
		["<leader>db"] = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle breakpoint",
		},
		["<leader>dc"] = {
			function()
				require("dap").continue()
			end,
			"Continue",
		},
		["<leader>di"] = {
			function()
				require("dap").step_into()
			end,
			"Step into",
		},
		["<leader>do"] = {
			function()
				require("dap").step_over()
			end,
			"Step over",
		},
		["<leader>dO"] = {
			function()
				require("dap").step_out()
			end,
			"Step out",
		},
		["<leader>dr"] = {
			function()
				require("dap").repl.toggle()
			end,
			"Toggle repl",
		},
		["<leader>ds"] = {
			function()
				require("dap").terminate()
			end,
			"Stop",
		},
		["<leader>dU"] = {
			function()
				require("dapui").toggle()
			end,
			"Toggle UI",
		},
	},
}

M.disabled = {
	n = {
		["<leader>td"] = "",
	},
}

M.git = {
	n = {
		["<leader>gl"] = {
			function()
				local nvterm = require("nvterm.terminal")
				nvterm.send("lazygit && exit", "float")
				nvterm.toggle("float")
				nvterm.toggle("float")
			end,
			"Lazygit terminal",
		},
		["<leader>gts"] = {
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			"Toggle current line blame",
		},
		["<leader>gtd"] = {
			function()
				require("gitsigns").toggle_deleted()
			end,
			"Toggle deleted lines",
		},
	},
}

M.nvterm = {
	n = {
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle floating term",
		},
	},
	t = {
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle floating term",
		},
	},
}
-- more keybinds!

return M
