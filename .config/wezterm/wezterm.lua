-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- NOTE: Font settings
config.font_size = 16
config.line_height = 1.2
config.font = wezterm.font("RobotoMono Nerd Font")

-- NOTE: Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

-- NOTE: Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"

-- and finally, return the configuration to wezterm
return config
