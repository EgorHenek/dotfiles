return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, _)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      require("nvim-treesitter.install").compilers = { "gcc-11" }

      parser_config.just = {
        install_info = {
          url = "https://github.com/IndianBoy42/tree-sitter-just",
          files = { "src/parser.c", "src/scanner.cc" },
          branch = "main",
          use_makefile = true,
        },
      }
      vim.filetype.add({
        pattern = {
          [".*/justfile"] = "just",
        },
      })
    end,
  },
}
