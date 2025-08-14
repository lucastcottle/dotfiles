return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'RchrdAriza/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    local date = os.date '%H:%M %a %d %b'
    local v = vim.version()
    local version = 'v' .. v.major .. '.' .. v.minor .. '.' .. v.patch

    -- Header
    dashboard.section.header.val = {
      ' Neovim',
    }
    dashboard.section.header.opts.position = 'center'

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button('n', '   New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '󰮗   Find file', ':cd $HOME | Telescope find_files<CR>'),
      dashboard.button('e', '   File Explorer', ':cd $HOME | Neotree<CR>'),
      dashboard.button('r', '   Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('c', '   Configuration', ':e ~/.config/nvim/lua/user/config.lua<CR>'),
      dashboard.button('R', '󱘞   Ripgrep', ':Telescope live_grep<CR>'),
      dashboard.button('q', '󰗼   Quit', ':qa<CR>'),
    }
    dashboard.section.buttons.opts.position = 'center'

    -- Footer
    dashboard.section.footer.val = {
      date,
      version,
    }
    dashboard.section.footer.opts.position = 'center'

    -- ✅ Calculate topPadding *after* setting val fields
    local totalHeight = #dashboard.section.header.val + #dashboard.section.buttons.val + #dashboard.section.footer.val + 4
    local topPadding = math.floor((vim.fn.winheight(0) - totalHeight) / 2)

    -- Layout override with dynamic vertical centering
    dashboard.opts.layout = {
      { type = 'padding', val = topPadding },
      dashboard.section.header,
      { type = 'padding', val = 2 },
      dashboard.section.buttons,
      { type = 'padding', val = 2 },
      dashboard.section.footer,
    }

    dashboard.opts.opts = {
      margin = 35,
      redraw_on_resize = true,
    }

    alpha.setup(dashboard.opts)

    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
