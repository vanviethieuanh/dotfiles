-- Pull in the wezterm API
local wezterm = require("wezterm")

local constants = require("constants")
local utils = require("utils")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.keys = {}

-- NOTE: Color Scheme
local selected_color_scheme = "Gruvbox dark, hard (base16)"

local theme_colors = utils.get_theme_colors(selected_color_scheme)
config.color_scheme = selected_color_scheme

-- This is where you actually apply your config choices
-- NOTE: Font settings
--
if wezterm.target_triple == "aarch64-apple-darwin" then
	config.font_size = 16 -- macOS Apple Silicon
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.window_decorations = "RESIZE"
	config.font_size = 12 -- Linux
else
	config.font_size = 14 -- Fallback/default
end
config.line_height = 1.2
config.font = wezterm.font("RobotoMono Nerd Font")

-- NOTE: Colors
config.colors = {}

-- NOTE: Appearance
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_background_image = constants.bg_image

require("tab-title").setup(theme_colors)

wezterm.on("window-resized", utils.center_content)
wezterm.on("window-config-reloaded", utils.center_content)

-- NOTE: Key binding
if wezterm.target_triple == "aarch64-apple-darwin" then
-- macOS-specific bindings can go here
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	local linux_keys = require("key-binding").Linux
	for _, key in ipairs(linux_keys) do
		table.insert(config.keys, key)
	end
end

return config
