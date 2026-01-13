# DeepSpace OMP Theme

## For use in

BASH ZSH PowerShell

---

## Prerequisites

### Install Nerd Font (Cascadia Code)

DeepSpace requires a Nerd Font for icons and glyphs to render correctly.

**Download:**
[Cascadia Code NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip)

**Linux (system-wide):**
```bash
# Extract and install
sudo mkdir -p /usr/local/share/fonts
sudo unzip CascadiaCode.zip -d /usr/local/share/fonts/
sudo fc-cache -fv
```

**Linux (user only):**
```bash
mkdir -p ~/.local/share/fonts
unzip CascadiaCode.zip -d ~/.local/share/fonts/
fc-cache -fv
```

**Windows:**
Extract the zip and right-click the `.ttf` files → "Install for all users"

**macOS:**
Extract and double-click the `.ttf` files to install via Font Book

### Install Oh My Posh

[Windows](https://ohmyposh.dev/docs/installation/windows) | [Linux](https://ohmyposh.dev/docs/installation/linux) | [macOS](https://ohmyposh.dev/docs/installation/macos)

---

## BASH Installation

### Installing for All Users (System-Wide)

Requires root/sudo access.

**1. Install Oh My Posh binary system-wide:**
```bash
sudo cp ~/.local/bin/oh-my-posh /usr/local/bin/
sudo chmod 755 /usr/local/bin/oh-my-posh
```

**2. Download DeepSpace theme:**
```bash
sudo mkdir -p /usr/share/oh-my-posh/themes
sudo curl -fsSL -o /usr/share/oh-my-posh/themes/deepspace.omp.json \
  https://raw.githubusercontent.com/r3dprojects/deepspace/main/deepspace.omp.json
```

**3. Create `/etc/profile.d/oh-my-posh.sh`:**
```bash
sudo tee /etc/profile.d/oh-my-posh.sh > /dev/null << 'EOF'
# Oh My Posh initialization for bash
# System-wide configuration

# Only run for interactive shells
[[ $- != *i* ]] && return

# Terminal column width for responsive prompt
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' SIGWINCH

# Initialize Oh My Posh with DeepSpace theme
eval "$(oh-my-posh init bash --config /usr/share/oh-my-posh/themes/deepspace.omp.json)"
EOF
```

**4. Source from `/etc/bash.bashrc`:**
```bash
echo '[ -f /etc/profile.d/oh-my-posh.sh ] && . /etc/profile.d/oh-my-posh.sh' | sudo tee -a /etc/bash.bashrc
```

**5. Optional - add user PATH and VS Code integration to `/etc/bash.bashrc`:**
```bash
sudo tee -a /etc/bash.bashrc > /dev/null << 'EOF'

# User local bin path
export PATH="$HOME/.local/bin:$PATH"

# VS Code shell integration
export VSCODE_SHELL_INTEGRATION=1
EOF
```

---

### Installing for User Account

**1. Download DeepSpace theme:**
```bash
mkdir -p ~/.config/oh-my-posh/themes
curl -fsSL -o ~/.config/oh-my-posh/themes/deepspace.omp.json \
  https://raw.githubusercontent.com/r3dprojects/deepspace/main/deepspace.omp.json
```

**2. Add to `~/.bashrc`:**
```bash
export PATH="$HOME/.local/bin:$PATH"
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' SIGWINCH
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/deepspace.omp.json)"
```

---

## ZSH Installation

*Coming soon*

```zsh
export PATH="$HOME/.local/bin:$PATH"
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' WINCH
eval "$(oh-my-posh init zsh --config /path/to/deepspace.omp.json)"
```

---

## PowerShell Installation

```pwsh
oh-my-posh init pwsh --config 'C:\Users\<username>\Documents\WindowsPowerShell\themes\deepspace.omp.json' | Invoke-Expression
```

---

## Terminal Configuration

### WezTerm (Recommended)

System-wide config at `/etc/wezterm/wezterm.lua`:
```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 11.0
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

return config
```

### Other Terminals

Set your terminal font to `CaskaydiaCove Nerd Font Mono` in preferences.

---

## Customisation

[Oh My Posh Custom Theme Documentation](https://ohmyposh.dev/docs/installation/customize)
