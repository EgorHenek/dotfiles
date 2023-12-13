local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

-- relative numbers
autocmd("BufEnter", {
	pattern = "*",
	command = "set relativenumber",
})

-- Opening tree at startup
autocmd("VimEnter", {
	callback = function(data)
		local directory = vim.fn.isdirectory(data.file) == 1

		if not directory then
			return
		end

		vim.cmd.cd(data.file)

		require("nvim-tree.api").tree.open()
	end,
})
