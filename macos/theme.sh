#!/usr/bin/env bash
# Apply the gruvbox-minimal theme to macOS system appearance (dark mode, accent color, wallpaper).
# Run manually with: bash macos/theme.sh
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Accent color: red (0) is the closest system preset to gruvbox-minimal's accent #ea6962
defaults write NSGlobalDomain AppleAccentColor -int 0

# Wallpaper: solid #221f1d, matching gruvbox-minimal's terminal background
osascript -e "tell application \"System Events\" to set picture of every desktop to (\"$DIR/wallpaper/gruvbox-minimal.png\" as POSIX file)"

killall Dock >/dev/null 2>&1 || true
killall SystemUIServer >/dev/null 2>&1 || true

echo "Applied gruvbox-minimal theme (dark mode, red accent, gruvbox-minimal wallpaper)."
