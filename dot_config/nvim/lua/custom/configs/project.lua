local project = require("project_nvim")

project.setup({
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "justfile", "pyproject.toml" },
	silent_chdir = true,
	detection_methods = { "lsp", "pattern" },
})
