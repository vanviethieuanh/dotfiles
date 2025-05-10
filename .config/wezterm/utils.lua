-- utils.lua
local wezterm = require("wezterm")

local M = {}

-- Returns a table of theme colors from the current color scheme name
function M.get_theme_colors(scheme_name)
	local schemes = wezterm.get_builtin_color_schemes()
	local colors = schemes[scheme_name]
	return colors
end

function M.center_content(window, _)
	local overrides = window:get_config_overrides() or {}

	local tabsz = window:active_tab():get_size()
	local cellheight = tabsz.pixel_height / tabsz.rows

	local window_height = window:get_dimensions().pixel_height
	local pane_height = math.floor(window_height / cellheight) * cellheight

	local new_padding = {
		left = 0,
		right = 0,
		top = (window_height - pane_height) / 2,
		bottom = 0,
	}
	if overrides.window_padding and new_padding.top == overrides.window_padding.top then
		return
	end
	overrides.window_padding = new_padding
	window:set_config_overrides(overrides)
end

return M
