return {
  'aktersnurra/no-clown-fiesta.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    theme = 'dark', -- supported themes: dark, dim, light
    transparent = false,
    styles = {
      comments = {},
      functions = {},
      keywords = {},
      lsp = { underline = true },
      match_paren = { underline = true },
      type = { bold = true },
      variables = {},
    },
  },
  config = function(_, opts)
    require('no-clown-fiesta').setup(opts)
    vim.cmd.colorscheme 'no-clown-fiesta'
  end,
}
