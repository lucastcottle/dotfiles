-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Markdown (and more) previewer that renders inside the buffer
  'OXY2DEV/markview.nvim',
  -- The plugin lazy loads itself, and it needs to load after the colorscheme
  -- (priority 1000) so the highlight groups resolve correctly.
  lazy = false,
  -- Completion source for `blink.cmp` (links, callouts, emoji, ...)
  dependencies = { 'saghen/blink.cmp' },
  opts = {},
}
