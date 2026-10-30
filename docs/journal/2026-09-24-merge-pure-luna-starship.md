---
date: 2026-09-24
tags: [starship, prompt, dotfiles]
---

# Merge Pure Preset With Luna Starship Config

## Changed

- Updated `starship/.config/starship.toml` to use Pure's two-line layout, Git indicators, command duration, and Python virtual environment display.
- Kept the Luna palette and the original Kubernetes and gcloud settings unchanged.
- Removed modules that the Pure-style layout does not display.

## Decisions

- Put Kubernetes and gcloud on the first line so that the second line stays close to Pure's prompt.
- Use Luna purple instead of Pure's fixed 218-color Git status highlight.
- Put the `format` setting before the palette table. In the old config, that setting was inside `[palettes.luna]`.
