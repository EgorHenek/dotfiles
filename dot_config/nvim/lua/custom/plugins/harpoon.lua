return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  depends_on = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end, { desc = 'Add to list' })
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
    vim.keymap.set('n', '<C-l>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
    vim.keymap.set('n', '<leader>r', function()
      harpoon:list():remove()
    end, { desc = 'Remove from list' })
  end,
}