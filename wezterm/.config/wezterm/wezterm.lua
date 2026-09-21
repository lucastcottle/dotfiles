local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ── Appearance ────────────────────────────────────────────────────────────────

config.color_scheme = 'luna'

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
