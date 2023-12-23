local M = {}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",
		"tailwindcss-language-server",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- golang stuff
		"golangci-lint-langserver",
		"gopls",
		"delve",
		"impl",
		"gomodifytags",

		-- python stuff
		"ruff",
		"ruff-lsp",
		"pyright",
		"debugpy",

		-- yaml stuff
		"yaml-language-server",
		"yamllint",
		"yamlfmt",

		--- rust stuff
		"rust-analyzer",
		"rustfmt",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	view = {
		adaptive_size = true,
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
}

M.nvterm = {
	terminals = {
		shell = vim.o.shell,
		list = {},
		type_opts = {
			float = {
				relative = "editor",
				row = 0.1,
				col = 0.1,
				width = 0.8,
				height = 0.7,
				border = "single",
			},
			horizontal = { location = "rightbelow", split_ratio = 0.3 },
			vertical = { location = "rightbelow", split_ratio = 0.5 },
		},
	},
	behavior = {
		autoclose_on_quit = {
			enabled = true,
			confirm = true,
		},
		close_on_exit = true,
		auto_insert = true,
	},
}
return M
