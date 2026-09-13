# dotfiles

Personal WezTerm + LazyVim (Neovim) configuration for Windows.

## What's in here

- `wezterm/wezterm.lua` — WezTerm terminal config (Catppuccin Mocha / rose-pine-moon,
  frosted-glass acrylic backdrop, Hack Nerd Font Mono, custom pane-split keybindings)
- `nvim/` — LazyVim configuration (based on the [LazyVim starter](https://github.com/LazyVim/starter))

## Setup on a new Windows machine

1. Install prerequisites:
   ```powershell
   winget install --id=Neovim.Neovim -e
   winget install --id=wez.wezterm -e
   winget install --id=BurntSushi.ripgrep.MSVC -e
   winget install --id=sharkdp.fd -e
   winget install --id=BrechtSanders.WinLibs.POSIX.UCRT -e   # C compiler for treesitter
   ```

2. Clone this repo (anywhere, e.g. `C:\Susanth\Projects\dotfiles`):
   ```powershell
   git clone <this-repo-url> C:\Susanth\Projects\dotfiles
   cd C:\Susanth\Projects\dotfiles
   ```

3. Install a Nerd Font (not tracked in this repo — binary/licensing):
   ```powershell
   winget install --id=DEVCOM.JetBrainsMonoNerdFont -e --silent --accept-package-agreements --accept-source-agreements
   ```
   For Hack Nerd Font Mono instead (no winget package, manual install, no admin needed):
   ```powershell
   $tmp = "$env:TEMP\NerdFont"
   New-Item -ItemType Directory -Force -Path $tmp | Out-Null
   Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip" -OutFile "$tmp\Hack.zip"
   Expand-Archive -Path "$tmp\Hack.zip" -DestinationPath "$tmp\extracted" -Force
   $shell = New-Object -ComObject Shell.Application
   $fonts = $shell.Namespace(0x14)
   Get-ChildItem "$tmp\extracted" -Filter "HackNerdFontMono-*.ttf" | ForEach-Object { $fonts.CopyHere($_.FullName, 0x10) }
   ```

4. Run the installer to symlink configs into place:
   ```powershell
   .\install.ps1
   ```
   This links:
   - `nvim/` → `%LOCALAPPDATA%\nvim`
   - `wezterm/wezterm.lua` → `%USERPROFILE%\.config\wezterm\wezterm.lua`

   Creating symlinks on Windows needs either an elevated (admin) PowerShell,
   or Developer Mode enabled: Settings → Privacy & Security → For developers → Developer Mode.

5. Open WezTerm, then run `nvim` — LazyVim bootstraps `lazy.nvim` and installs
   all plugins automatically on first launch. Run `:checkhealth` afterward to
   confirm fonts/icons/treesitter compiler are all working.

## Keeping it in sync

Since `install.ps1` uses symlinks (not copies), editing `~/.config/wezterm/wezterm.lua`
or any file under `%LOCALAPPDATA%\nvim` edits the file *in this repo* directly —
just `git add`, `commit`, and `push` from here as usual.
