-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  "wtfox/luna.nvim",
  priority = 1000, -- Load colorscheme early
  config = function()
    require('luna').setup {
      -- your options here, e.g.:
      transparent = false,
      accent = 1.0,
      plugins ={
        auto=true
      },
    }
    vim.cmd.colorscheme("luna")
  end,
}
