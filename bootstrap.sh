#!/bin/bash

# Bootstrap script for dotfiles on Linux Mint
# This script installs git, chezmoi, and curl

set -e

echo "=================================="
echo "Dotfiles Bootstrap Script"
echo "=================================="
echo ""

# Check if running on Linux Mint
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$NAME" != *"Linux Mint"* ]]; then
        echo "Warning: This script is designed for Linux Mint but detected: $NAME"
        echo "Continuing anyway..."
        echo ""
    fi
else
    echo "Warning: Could not detect OS. Continuing anyway..."
    echo ""
fi

# Update package list
echo "Updating package list..."
sudo apt update

# Install git
echo ""
echo "Installing git..."
if command -v git &> /dev/null; then
    echo "git is already installed ($(git --version))"
else
    sudo apt install -y git
    echo "git installed successfully"
fi

# Install curl
echo ""
echo "Installing curl..."
if command -v curl &> /dev/null; then
    echo "curl is already installed ($(curl --version | head -n1))"
else
    sudo apt install -y curl
    echo "curl installed successfully"
fi

# Install chezmoi
echo ""
echo "Installing chezmoi..."
if command -v chezmoi &> /dev/null; then
    echo "chezmoi is already installed ($(chezmoi --version))"
else
    # Install chezmoi using the official install script
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    
    # Add to PATH if not already there
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
        export PATH="$HOME/.local/bin:$PATH"
        echo "Added $HOME/.local/bin to PATH in .bashrc"
    fi
    
    echo "chezmoi installed successfully"
fi

echo ""
echo "=================================="
echo "Bootstrap completed successfully!"
echo "=================================="
echo ""
echo "Installed tools:"
echo "  - git: $(git --version)"
echo "  - curl: $(curl --version | head -n1)"
echo "  - chezmoi: $(chezmoi --version)"
echo ""
