return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
  },
  config = function()
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'neotest-python',
      },
    }
    vim.keymap.set('n', '<leader>tt', function()
      neotest.run.run()
    end, { desc = 'Neotest run' })
    vim.keymap.set('n', '<leader>td', function()
      neotest.run.run { vim.fn.expand '%', strategy = 'dap' }
    end, { desc = 'Neotest run with dap' })
    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { desc = 'Neotest summary' })
  end,
}
