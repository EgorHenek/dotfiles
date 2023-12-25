return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "templ",
      })

      vim.filetype.add({
        extension = {
          templ = "templ",
        },
      })

      require("luasnip").filetype_extend("templ", { "html" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {},
      },
    },
  },
}
