#!/bin/bash

dotfiles_dir="~/.config/scripts"

if [ ! -d "$dotfiles_dir" ]; then
  echo "Error: $dotfiles_dir folder not found"
  exit 1
fi

for script in "$dotfiles_dir"/*.sh; do
  if [ -f "$script" ]; then
    echo "Running script: $script"
    bash "$script"
  fi
done