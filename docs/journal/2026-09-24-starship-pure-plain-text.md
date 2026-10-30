---
date: 2026-09-24
tags: [starship, prompt, dotfiles]
---

# Combine Pure and Plain Text Starship Presets

## Changed

- Updated `starship/.config/starship.toml` to use Pure's two-line layout, Git status and Python virtual environment display, with plain-text prompt and cloud symbols.
- Kept the Luna palette and the existing Kubernetes and gcloud display formats, styles, and detection settings.
- Moved `format` to the top level so Starship uses the intended layout.

## Decisions

- Show Kubernetes and gcloud on the first line, and keep the second line for the Python virtual environment and prompt character.
- Use plain-text symbols only for visible modules; do not add settings for modules that are no longer shown.
- Keep Kubernetes and gcloud symbols readable without a patched icon font.
