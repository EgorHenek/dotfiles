return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "noselect",
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = vim.NIL,
      })
    end,
  },
}
