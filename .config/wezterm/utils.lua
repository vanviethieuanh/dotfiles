-- utils.lua
local wezterm = require("wezterm")

local M = {}

-- Returns a table of theme colors from the current color scheme name
function M.get_theme_colors(scheme_name)
	local schemes = wezterm.get_builtin_color_schemes()
	local colors = schemes[scheme_name]
	return colors
end

function M.center_content(window, pane)
	local win_dim = window:get_dimensions()
	local tab_dim = pane:tab():get_size()
	local overrides = window:get_config_overrides() or {}
	local padding_left = (win_dim.pixel_width - tab_dim.pixel_width) / 2
	local padding_top = (win_dim.pixel_height - tab_dim.pixel_height) / 2
	local new_padding = {
		left = padding_left,
		right = 0,
		top = padding_top,
		bottom = 0,
	}
	if overrides.window_padding and new_padding.left == overrides.window_padding.left then
		return
	end
	overrides.window_padding = new_padding
	window:set_config_overrides(overrides)
end

return M
