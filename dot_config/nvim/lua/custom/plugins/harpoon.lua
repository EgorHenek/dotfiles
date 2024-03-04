return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  depends_on = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end, { desc = 'Add to list' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
    vim.keymap.set('n', '<leader>r', function()
      harpoon:list():remove()
    end, { desc = 'Remove from list' })
  end,
}
