-- Gruvbox Minimal colorscheme: https://github.com/dybdeskarphet/gruvbox-minimal.nvim
return {
  'dybdeskarphet/gruvbox-minimal.nvim',
  priority = 1000, -- Load colorscheme early
  config = function()
    require('gruvbox-minimal').setup {
      transparent = false, -- Sets all the major background values to 'none'
      italic_comments = false, -- Italic comments
      italic_functions = true, -- Italic functions and methods
      contrast = 'low', -- Available values: "high", "low"
      theme = 'dark', -- Available values: "dark", "light"
      accent = 'red', -- Changes the definition (functions, structs etc.) colors. Available: "red", "orange", "yellow", "green", "cyan", "blue", "magenta"
      semantic_highlights = true, -- Uses LSP semantic highlighting
      terminal_colors = true, -- Replaces the terminal's ANSI colors with the scheme's
      markdown_docstring = {
        python = false, -- Only available filetype for now
      }, -- Highlights docstring content as markdown
      extend = {
        todotxt = true, -- Extends todo.txt syntax highlighting with markdown_inline
      }, -- Extends the syntax highlighting in numerous ways
    }
    vim.cmd.colorscheme 'gruvbox-minimal'
  end,
}