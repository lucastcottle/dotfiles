-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'zenbones-theme/zenbones.nvim',
  dependencies = { 'rktjmp/lush.nvim' }, -- only if you want extra configurability
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.o.background = 'dark'
    vim.cmd [[colorscheme zenwritten]] -- use the variant “zenwritten”
  end,
}
