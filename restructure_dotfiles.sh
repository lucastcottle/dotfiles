#!/bin/bash
set -e
shopt -s dotglob nullglob

for package in swaylock swayidle waybar ranger rofi sway nvim; do
  src_dir="$package"
  config_target=".config/$package"
  dest_dir="$package/$config_target"

  if [ -d "$src_dir" ]; then
    mkdir -p "$dest_dir"

    for item in "$src_dir"/*; do
      base_item="$(basename "$item")"

      # Skip .config if it already exists and is the destination
      if [[ "$base_item" == ".config" ]]; then
        echo "⚠️ Skipping '$item' to avoid recursive move"
        continue
      fi

      mv "$item" "$dest_dir/"
      echo "Moved $item to $dest_dir/"
    done
  else
    echo "❌ Directory $src_dir does not exist"
  fi
done

echo "✅ Done"

