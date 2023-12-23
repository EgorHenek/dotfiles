return {
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.ruff_format,
      })
    end,
  },
}
