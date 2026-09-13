local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Shell: default to PowerShell
config.default_prog = { "powershell.exe", "-NoLogo" }

-- Font (matches the Neovim/LazyVim setup)
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 15.0

-- Color scheme
config.color_scheme = "rose-pine-moon"

-- Window opacity (1.0 = fully opaque, 0.0 = fully transparent)
config.window_background_opacity = 0.8

-- Frosted-glass backdrop (Windows equivalent of macOS's background blur)
config.win32_system_backdrop = "Acrylic"

-- UI
config.window_decorations = "TITLE | RESIZE"
config.window_frame = {
	font_size = 13.0,
}
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}
config.enable_scroll_bar = false
config.scrollback_lines = 10000
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

-- Behavior
config.window_close_confirmation = "NeverPrompt"
config.check_for_updates = false

-- Keybindings: handy split/nav keys similar to tmux-style workflows,
-- useful alongside Neovim splits
config.keys = {
	{ key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
}

return config
