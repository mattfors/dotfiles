# dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

### Bootstrap (Linux Mint)

To set up a new Linux Mint system with the required tools, run:

```bash
# Download and review the script first (recommended)
curl -fsSL https://raw.githubusercontent.com/mattfors/dotfiles/main/bootstrap.sh -o bootstrap.sh
less bootstrap.sh
bash bootstrap.sh

# Or run directly (use with caution)
curl -fsSL https://raw.githubusercontent.com/mattfors/dotfiles/main/bootstrap.sh | bash
```

Or clone this repository and run the bootstrap script:

```bash
git clone https://github.com/mattfors/dotfiles.git
cd dotfiles
./bootstrap.sh
```

This will install:
- **git** - Version control system
- **curl** - Command-line tool for transferring data
- **chezmoi** - Dotfiles manager

### What the Bootstrap Script Does

1. Updates the package list (`apt update`)
2. Installs git and curl via apt
3. Installs chezmoi using the official installer to `~/.local/bin`
4. Adds `~/.local/bin` to your PATH if needed

After running the bootstrap script, you can initialize chezmoi with your dotfiles.

