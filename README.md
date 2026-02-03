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

## Desktop Setup

Once chezmoi is installed, you can set up a base desktop environment by initializing chezmoi with this repository:

```bash
# Initialize chezmoi with this repository
chezmoi init https://github.com/mattfors/dotfiles.git

# Review what changes will be made
chezmoi diff

# Apply the changes (this will run the setup scripts)
chezmoi apply -v
```

### What Gets Installed

The desktop setup includes:

#### Base Desktop Packages
- **vim** - Text editor
- **git** - Version control system
- **curl** - HTTP client
- **wget** - Download tool
- **htop** - Interactive process viewer
- **tree** - Directory tree viewer
- **zip/unzip** - Archive utilities
- **build-essential** - Compilation tools (gcc, g++, make)
- **ca-certificates** - SSL certificates
- **gnupg** - GPG encryption tools
- **software-properties-common** - Repository management

#### Applications
- **Google Chrome** - Web browser

### Supported Linux Distributions

The setup scripts support the following Linux distributions:
- Ubuntu
- Debian
- Linux Mint
- Pop!_OS
- Fedora
- RHEL/CentOS
- Arch Linux
- Manjaro

### Customizing Your Setup

You can customize the data used in templates by editing `.chezmoidata.yaml` in your local chezmoi source directory:

```bash
chezmoi edit-config
```

Or edit the data file directly:

```bash
chezmoi cd
vim .chezmoidata.yaml
```

### Updating Your Dotfiles

To update your dotfiles and re-run setup scripts:

```bash
# Pull the latest changes from the repository
chezmoi update

# Or manually:
chezmoi git pull
chezmoi apply -v
```

### Running Setup Scripts Manually

If you need to re-run the setup scripts (they normally only run once):

```bash
# Re-run all setup scripts
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply -v

# Or run a specific script manually
chezmoi cd
bash run_once_install-chrome.sh.tmpl
```

