# DeepSpace OMP Theme

## For use in

BASH ZSH Powershell

## Fonts supported & tested

[Cascadia Code NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip)

### Oh My Posh Install

[Windows](https://ohmyposh.dev/docs/installation/windows)

[Linux](https://ohmyposh.dev/docs/installation/linux)

[macOS](https://ohmyposh.dev/docs/installation/macos)

### Install a theme

[Oh My Posh Custom Theme](https://ohmyposh.dev/docs/installation/customize)

## BASH

Add to .bashrc

```bash
export PATH="$HOME/.local/bin:$PATH"
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' SIGWINCH
eval "$(oh-my-posh init bash --config /path/to/deepspace.omp.json)"
```

## ZSH

```zsh
export PATH="$HOME/.local/bin:$PATH"
export TERMCOLS=$(tput cols)
trap 'export TERMCOLS=$(tput cols)' WINCH
eval "$(oh-my-posh init zsh --config /path/to/deepspace.omp.json)"
```

## POWERSHELL

```pwsh
oh-my-posh init pwsh --config 'C:\Users\...\Documents\WindowsPowerShell\themes\deepspace.json' | Invoke-Expression
```
