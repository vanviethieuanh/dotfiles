-- Pull in the wezterm API
local wezterm = require("wezterm")

local constants = require("constants")
local utils = require("utils")

-- This will hold the configuration.
local config = wezterm.config_builder()

require("events")

config.keys = {}

config.initial_cols = 80
config.initial_rows = 24

config.enable_wayland = false

-- NOTE: Color Scheme
local selected_color_scheme = "Gruvbox dark, hard (base16)"

local theme_colors = utils.get_theme_colors(selected_color_scheme)
config.color_scheme = selected_color_scheme

-- This is where you actually apply your config choices
-- NOTE: Font settings
--
if wezterm.target_triple == "aarch64-apple-darwin" then
	config.font_size = 14 -- macOS Apple Silicon
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
	config.font_size = 18 -- Linux
else
	config.font_size = 14 -- Fallback/default
end

config.integrated_title_buttons = {}
config.line_height = 1.2
config.font = wezterm.font("RobotoMono Nerd Font")

-- NOTE: Colors
config.colors = {}

-- NOTE: Appearance
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- config.window_background_image = constants.bg_image
config.tab_max_width = 64

require("tab-title").setup(theme_colors)

-- wezterm.on("window-resized", utils.center_content)
-- wezterm.on("window-config-reloaded", utils.center_content)

-- NOTE: Key binding
if wezterm.target_triple == "aarch64-apple-darwin" then
	local mac_keys = require("key-binding").Mac.keys
	local mac_leader = require("key-binding").Mac.leader

	config.leader = mac_leader
	for _, key in ipairs(mac_keys) do
		table.insert(config.keys, key)
	end
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	local linux_keys = require("key-binding").Linux.keys
	local linux_leader = require("key-binding").Linux.leader

	config.leader = linux_leader
	for _, key in ipairs(linux_keys) do
		table.insert(config.keys, key)
	end
end

config.window_padding = {
	left = 40,
	right = 40,
	top = 20,
	bottom = 20,
}

return config
