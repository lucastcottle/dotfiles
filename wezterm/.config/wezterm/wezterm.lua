local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ── Appearance ────────────────────────────────────────────────────────────────

config.color_scheme = nil -- we define our own below

config.colors = {
  foreground = '#E1E1E1',
  background = '#151515',
  cursor_bg = '#D0D0D0',
  cursor_fg = '#151515',
  cursor_border = '#D0D0D0',
  selection_fg = '#E1E1E1',
  selection_bg = '#373737',

  ansi = {
    '#151515', -- black
    '#b46958', -- red
    '#90A959', -- green
    '#F4BF75', -- yellow
    '#BAD7FF', -- blue
    '#AA749F', -- magenta
    '#88afa2', -- cyan
    '#AFAFAF', -- white
  },
  brights = {
    '#373737', -- bright black
    '#b46958', -- bright red
    '#90A959', -- bright green
    '#FFA557', -- bright yellow (orange)
    '#BAD7FF', -- bright blue
    '#AA759F', -- bright magenta
    '#88afa2', -- bright cyan
    '#E1E1E1', -- bright white
  },

  tab_bar = {
    background = '#151515',
    active_tab = {
      bg_color = '#202020',
      fg_color = '#E1E1E1',
      intensity = 'Normal',
    },
    inactive_tab = {
      bg_color = '#151515',
      fg_color = '#727272',
    },
    inactive_tab_hover = {
      bg_color = '#171717',
      fg_color = '#AFAFAF',
    },
    new_tab = {
      bg_color = '#151515',
      fg_color = '#727272',
    },
    new_tab_hover = {
      bg_color = '#171717',
      fg_color = '#AFAFAF',
    },
  },
}

-- ── Font ──────────────────────────────────────────────────────────────────────

config.font = wezterm.font('CommitMono Nerd Font Mono', { weight = 'Regular' })
config.font_size = 14.0

-- ── Window ────────────────────────────────────────────────────────────────────

config.window_padding = {
  left = 12,
  right = 12,
  top = 28,
  bottom = 10,
}

config.window_decorations = 'INTEGRATED_BUTTONS | RESIZE'
config.window_background_opacity = 1.0
config.macos_window_background_blur = 0

-- ── Tab bar ───────────────────────────────────────────────────────────────────

config.enable_tab_bar = false

-- ── Cursor ────────────────────────────────────────────────────────────────────

config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- ── Misc ──────────────────────────────────────────────────────────────────────

config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.audible_bell = 'Disabled'

return config
