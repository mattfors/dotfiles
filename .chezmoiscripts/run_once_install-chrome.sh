#!/usr/bin/env bash
set -euo pipefail

{{ if eq .os "linux" }}
if command -v google-chrome >/dev/null 2>&1 || command -v google-chrome-stable >/dev/null 2>&1; then
  echo "Chrome is already installed."
  exit 0
fi

tmp_deb="$(mktemp -t google-chrome-XXXXXX.deb)"
trap 'rm -f "$tmp_deb"' EXIT

curl -fsSL "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -o "$tmp_deb"
sudo apt-get install -y "$tmp_deb"
{{ end }}
{{ if eq .os "darwin" }}
if [ -d "/Applications/Google Chrome.app" ]; then
  echo "Chrome is already installed."
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v brew >/dev/null 2>&1; then
  brew install --cask google-chrome
elif [ -x "/opt/homebrew/bin/brew" ]; then
  /opt/homebrew/bin/brew install --cask google-chrome
elif [ -x "/usr/local/bin/brew" ]; then
  /usr/local/bin/brew install --cask google-chrome
fi
{{ end }}
