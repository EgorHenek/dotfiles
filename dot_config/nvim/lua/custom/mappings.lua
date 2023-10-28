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

M.neotest = {
  n = {
    ["<leader>tt"] = {
      function()
        require("neotest").run.run { extra_args = { "-coverprofile=./coverage.out", "-coverpkg ./..." } }
      end,
      "Test current function",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
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

M.nvterm = {
  n = {
    ["<leader>lg"] = {
      function()
        local nvterm = require "nvterm.terminal"
        nvterm.send("lazygit && exit", "float")
        nvterm.toggle "float"
        nvterm.toggle "float"
      end,
      "Lazygit terminal",
    },
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
  t = {
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}
-- more keybinds!

return M
