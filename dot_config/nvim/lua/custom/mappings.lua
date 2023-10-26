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
