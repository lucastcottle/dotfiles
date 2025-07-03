-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'renerocksai/telekasten.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'renerocksai/calendar-vim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telekasten').setup {
      home = vim.fn.expand '~/repos/notes', -- your notes directory
      dailies = 'daily',
      template_new_note = vim.fn.expand '~/repos/notes/templates/zettel.md',
      template_new_daily = vim.fn.expand '~/repos/notes/templates/zettel.md',
      extension = '.md',
    }

    -- Optional keybindings (can be moved to keymaps file too)
    local tk = require 'telekasten'
    vim.keymap.set('n', '<leader>zn', tk.new_note, { desc = 'New note' })
    vim.keymap.set('n', '<leader>zd', tk.goto_today, { desc = 'Today’s note' })
    vim.keymap.set('n', '<leader>zf', tk.find_notes, { desc = 'Find notes' })
    vim.keymap.set('n', '<leader>zg', tk.search_notes, { desc = 'Grep notes' })
    vim.keymap.set('n', '<leader>zz', tk.panel, { desc = 'Telekasten panel' })
    vim.keymap.set('n', '<CR>', tk.follow_link, { desc = 'Follow Telekasten link', silent = true })
  end,
}
