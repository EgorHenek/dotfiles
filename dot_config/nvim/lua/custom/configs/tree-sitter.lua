local treesitter = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

local languages = {
	"vim",
	"lua",
	"html",
	"css",
	"javascript",
	"typescript",
	"tsx",
	"c",
	"markdown",
	"markdown_inline",
	"sql",
	"go",
	"gosum",
	"gomod",
	"python",
	"yaml",
	"rust",
}

treesitter.setup({
	ensure_installed = languages,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		use_languagetree = true,
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
})

parser_config.just = {
	install_info = {
		url = "https://github.com/IndianBoy42/tree-sitter-just",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
	maintainers = { "@IndianBoy42" },
	filetype = "just",
}

require("nvim-treesitter.install").compilers = { "gcc-11" }
