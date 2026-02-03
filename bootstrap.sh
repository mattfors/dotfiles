#!/usr/bin/env bash
set -euo pipefail

os_name="$(uname -s)"

if [ "$os_name" = "Linux" ]; then
  sudo apt-get update
  sudo apt-get install -y git curl
elif [ "$os_name" = "Darwin" ]; then
  if ! xcode-select -p >/dev/null 2>&1; then
    xcode-select --install || true
  fi
else
  echo "Unsupported OS: $os_name"
  exit 1
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

chezmoi_bin="$(command -v chezmoi || true)"
if [ -z "$chezmoi_bin" ] && [ -x "$HOME/.local/bin/chezmoi" ]; then
  chezmoi_bin="$HOME/.local/bin/chezmoi"
fi

if [ -z "$chezmoi_bin" ]; then
  echo "chezmoi installation failed."
  exit 1
fi

"$chezmoi_bin" init --apply https://github.com/mattfors/dotfiles.git
