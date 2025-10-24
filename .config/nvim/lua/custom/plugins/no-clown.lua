-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'aktersnurra/no-clown-fiesta.nvim',
  priority = 1000, -- Load colorscheme early
  config = function()
    require('no-clown-fiesta').setup {
      -- your options here, e.g.:
      theme = 'dark',
      styles = {
        type = { bold = true },
        lsp = { underline = false },
        match_paren = { underline = true },
      },
    }
  end,
}
