# dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

### Bootstrap (Linux Mint / Ubuntu / macOS)

To set up a new Linux Mint/Ubuntu or macOS system with the required tools, run:

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

1. Installs git and curl on Linux
2. Ensures Xcode Command Line Tools on macOS
3. Installs chezmoi using the official installer to `~/.local/bin`
4. Runs `chezmoi init --apply` for this repo

After running the bootstrap script, it will initialize chezmoi and apply this repo.

## Chezmoi "Hello World": Install Chrome (Linux Mint / Ubuntu / macOS)

This repo includes a minimal chezmoi `run_once` script that installs Google Chrome
on Linux Mint/Ubuntu or macOS. To use it:

```bash
chezmoi init --apply https://github.com/mattfors/dotfiles.git
```

The script lives at `.chezmoiscripts/run_once_install-chrome.sh` and will only run
once per machine. Re-running `chezmoi apply` will skip it if Chrome is already
installed.
