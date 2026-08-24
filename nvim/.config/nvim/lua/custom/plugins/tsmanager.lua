-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return 
{
  'romus204/tree-sitter-manager.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('tree-sitter-manager').setup({})
  end
}

