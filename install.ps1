# dotfiles installer (Windows)
# Symlinks this repo's configs into the locations Neovim/WezTerm expect.
# Run from an elevated PowerShell (symlinks on Windows need admin rights,
# unless Developer Mode is enabled in Windows Settings > For Developers).

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot

function Link-Config($source, $target) {
    if (Test-Path $target) {
        $backup = "$target.bak-$(Get-Date -Format yyyyMMdd-HHmmss)"
        Write-Output "Existing config found at $target - backing up to $backup"
        Rename-Item -Path $target -NewName (Split-Path $backup -Leaf)
    }
    $targetParent = Split-Path $target -Parent
    if (-not (Test-Path $targetParent)) {
        New-Item -ItemType Directory -Force -Path $targetParent | Out-Null
    }
    New-Item -ItemType SymbolicLink -Path $target -Target $source -Force | Out-Null
    Write-Output "Linked $target -> $source"
}

# Neovim (LazyVim) config
Link-Config "$repoRoot\nvim" "$env:LOCALAPPDATA\nvim"

# WezTerm config
Link-Config "$repoRoot\wezterm\wezterm.lua" "$env:USERPROFILE\.config\wezterm\wezterm.lua"

Write-Output ""
Write-Output "Done. Fonts are NOT included in this repo (binary/licensing) - install them separately:"
Write-Output "  winget install --id=DEVCOM.JetBrainsMonoNerdFont -e"
Write-Output "  (Hack Nerd Font Mono has no winget package - see README for the manual install snippet)"
Write-Output ""
Write-Output "Then open a fresh WezTerm window and run 'nvim' - LazyVim will bootstrap plugins on first launch."
