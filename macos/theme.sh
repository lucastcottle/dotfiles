#!/usr/bin/env bash
# Apply the luna theme to macOS system appearance (dark mode, accent color, wallpaper).
# Run manually with: bash macos/theme.sh
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Accent color: purple (5) is the closest system preset to luna's #c4a8d6 / #75a1c7
defaults write NSGlobalDomain AppleAccentColor -int 5

# Wallpaper: solid #060606, matching luna's terminal background
osascript -e "tell application \"System Events\" to set picture of every desktop to (\"$DIR/wallpaper/luna.png\" as POSIX file)"

killall Dock >/dev/null 2>&1 || true
killall SystemUIServer >/dev/null 2>&1 || true

echo "Applied luna theme (dark mode, purple accent, luna wallpaper)."
