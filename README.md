# DeepSpace OMP Theme

**Compatible with Oh My Posh v28.0.0+**

A modern, feature-rich Oh My Posh theme with responsive design and comprehensive language support.

## For use in

BASH | ZSH | PowerShell

---

## Prerequisites

### Install Nerd Font (Cascadia Code)

DeepSpace requires a Nerd Font for icons and glyphs to render correctly.

**Recommended Installation Method (Linux):**
```bash
nerd_font_name="CascadiaCode" bash <(curl -fsSL https://raw.githubusercontent.com/monoira/nefoin/main/install.sh)
```

**Manual Download:**
[Cascadia Code NF](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip)

**Linux (system-wide):**
```bash
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

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

**Platform-specific guides:**
[Windows](https://ohmyposh.dev/docs/installation/windows) | [Linux](https://ohmyposh.dev/docs/installation/linux) | [macOS](https://ohmyposh.dev/docs/installation/macos)

---

## BASH Installation

### Installing for User Account (Recommended)

**1. Download DeepSpace theme:**
```bash
mkdir -p ~/.cache/oh-my-posh/themes
curl -fsSL -o ~/.cache/oh-my-posh/themes/deepspace.omp.json \
  https://raw.githubusercontent.com/r3dprojects/deepspace/main/deepspace.omp.json
```

**2. Add to `~/.bashrc`:**
```bash
# Oh My Posh DeepSpace theme
export PATH="$HOME/.local/bin:$PATH"
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' SIGWINCH

eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/deepspace.omp.json)"

# Required for Oh My Posh v28.0.0+ (terminal dimensions display)
function set_poshcontext() {
    export POSH_TERM_DIMS="$(tput cols 2>/dev/null || echo 80)×$(tput lines 2>/dev/null || echo 24)"
}
```

**3. Apply changes:**
```bash
source ~/.bashrc
```

---

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

# Required for Oh My Posh v28.0.0+ (terminal dimensions display)
function set_poshcontext() {
    export POSH_TERM_DIMS="$(tput cols 2>/dev/null || echo 80)×$(tput lines 2>/dev/null || echo 24)"
}
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

## ZSH Installation

**1. Download DeepSpace theme:**
```bash
mkdir -p ~/.cache/oh-my-posh/themes
curl -fsSL -o ~/.cache/oh-my-posh/themes/deepspace.omp.json \
  https://raw.githubusercontent.com/r3dprojects/deepspace/main/deepspace.omp.json
```

**2. Add to `~/.zshrc`:**
```zsh
# Oh My Posh DeepSpace theme
export PATH="$HOME/.local/bin:$PATH"
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' WINCH

eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/deepspace.omp.json)"

# Required for Oh My Posh v28.0.0+ (terminal dimensions display)
function set_poshcontext() {
    export POSH_TERM_DIMS="$(tput cols 2>/dev/null || echo 80)×$(tput lines 2>/dev/null || echo 24)"
}
```

**3. Apply changes:**
```zsh
source ~/.zshrc
```

---

## PowerShell Installation

**1. Download DeepSpace theme:**
```powershell
New-Item -Path "$env:USERPROFILE\Documents\PowerShell\themes" -ItemType Directory -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/r3dprojects/deepspace/main/deepspace.omp.json" -OutFile "$env:USERPROFILE\Documents\PowerShell\themes\deepspace.omp.json"
```

**2. Add to PowerShell profile:**
```powershell
oh-my-posh init pwsh --config "$env:USERPROFILE\Documents\PowerShell\themes\deepspace.omp.json" | Invoke-Expression
```

---

## Terminal Configuration

### Recommended Settings

**Font:** `CaskaydiaCove Nerd Font` (NOT "Mono" variant for Alacritty)
**Size:** 13pt
**Dimensions:** 120 columns × 60 rows

### WezTerm (Recommended)

**User config:** `~/.config/wezterm/wezterm.lua` (required for desktop launcher)

```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font configuration
config.font = wezterm.font('CaskaydiaCove Nerd Font')
config.font_size = 13.0

-- Terminal settings
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'

-- Window dimensions
config.initial_cols = 120
config.initial_rows = 60

-- Padding (0 bottom prevents gap with tmux status bar)
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 0,
}

config.window_background_opacity = 0.95
config.cursor_blink_rate = 500
config.default_cursor_style = 'BlinkingBar'
config.scrollback_lines = 10000

return config
```

### Alacritty

**Config:** `~/.config/alacritty/alacritty.toml`

```toml
[font]
size = 13.0
builtin_box_drawing = false  # CRITICAL: Must be false for proper icon rendering

[font.normal]
family = "CaskaydiaCove Nerd Font"  # NOT "Mono" variant

[window]
decorations = "None"  # Borderless
opacity = 0.95

[window.dimensions]
columns = 120
rows = 60

[window.padding]
x = 4
y = 0  # Prevents gap with tmux status bar
```

**Important:** Set `builtin_box_drawing = false` to prevent oh-my-posh icons rendering 33% smaller.

### GNOME Terminal

1. Open Preferences
2. Set font to `CaskaydiaCove Nerd Font 13`
3. Set dimensions to 120 columns × 60 rows

### Other Terminals

Set your terminal font to `CaskaydiaCove Nerd Font` (size 13pt recommended) in terminal preferences.

---

## Theme Features

### Prompt Structure (4-line layout)

**Line 1 (Top-left):** OS + Username@Hostname + Git status
**Line 1 (Top-right):** Battery, npm/pnpm, Node, Python, PHP, Docker, Terraform, AWS, TMUX indicator, Terminal dimensions, Time

**Line 2 (Middle-left):** OS icon + Path (cycling gradient colors) + Status indicators
**Line 2 (Middle-right):** Command execution time + System info (memory/swap usage)

**Line 3 (Bottom):** Prompt symbol (❯❯❯)

### Color Palette

- **Path:** #bb9af7 (magenta) on #2c2e3e
- **OS/Terminal:** #7dcfff (cyan) on #2c2e3e
- **Git:** #7dcfff on #3b3d57
- **Git changed:** #B388FF (light magenta)
- **Success:** #95f5a3 (green)
- **Error:** #ee3003 (red)

### Key Features

- **Powerline symbols** and diamond segments
- **Responsive design** with breakpoints:
  - 160+ cols: Full version info
  - 120-159 cols: Abbreviated versions
  - 80-119 cols: Icon-only mode
  - <80 cols: Minimal mode
- **Git integration:**
  - Branch name (truncated at 25 chars)
  - Ahead/behind indicators
  - Working/staging changes count
  - Stash count
  - Color-coded status (green=ahead, cyan=behind, magenta=changed)
- **Language version detection:**
  - Node.js
  - Python
  - PHP
  - Go
  - Svelte
- **Environment indicators:**
  - Docker context
  - Terraform workspace
  - AWS profile
  - npm/pnpm detection
  - TMUX session indicator
- **System monitoring:**
  - Battery percentage (color-coded: red<20%, orange 20-50%, yellow 50-80%, green>80%)
  - Memory usage percentage
  - Swap usage percentage
  - Command execution time (>500ms)
- **Terminal dimensions display:** Shows current terminal size (COLSxROWS)
- **12-hour time format** with AM/PM

---

## Oh My Posh v28.0.0+ Changes

### Breaking Changes

- **Command segments deprecated** → Replaced with environment variable approach
- **Terminal dimensions:** Now uses `POSH_TERM_DIMS` environment variable set by `set_poshcontext()` shell function

### Migration Notes

If upgrading from Oh My Posh v26.x/v27.x:

1. **Update Oh My Posh:**
   ```bash
   curl -s https://ohmyposh.dev/install.sh | bash -s
   ```

2. **Add `set_poshcontext()` function to your shell config** (see installation instructions above)

3. **Restart your shell:**
   ```bash
   source ~/.bashrc  # or ~/.zshrc for zsh
   ```

The DeepSpace theme config is already v28.0.0+ compatible.

---

## Troubleshooting

**Icons appear as boxes:**
- Install CaskaydiaCove Nerd Font
- Set terminal font to `CaskaydiaCove Nerd Font`
- For Alacritty: Set `builtin_box_drawing = false`

**Icons too small (Alacritty):**
- Use `CaskaydiaCove Nerd Font` (NOT "Mono" variant)
- Set `builtin_box_drawing = false` in alacritty.toml

**Terminal dimensions not showing:**
- Ensure `set_poshcontext()` function is in your shell config (required for v28.0.0+)
- Source your shell config: `source ~/.bashrc`

**Prompt looks janky on startup:**
- Add soft reset to shell config (before oh-my-posh init):
  ```bash
  # Soft reset for clean oh-my-posh rendering
  if [[ -z "$TMUX" ]]; then
      printf '\033c'
  fi
  ```

---

## Customization

[Oh My Posh Custom Theme Documentation](https://ohmyposh.dev/docs/installation/customize)

---

## License

MIT License - See LICENSE file for details

## Repository

https://github.com/r3dprojects/deepspace
