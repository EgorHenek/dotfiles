return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        golangci_lint_ls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports-reviser", "gofumpt" },
      },
    },
  },
}
