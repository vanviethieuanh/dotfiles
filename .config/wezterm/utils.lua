-- utils.lua
local wezterm = require("wezterm")

local M = {}

-- Returns a table of theme colors from the current color scheme name
function M.get_theme_colors(scheme_name)
	local schemes = wezterm.get_builtin_color_schemes()
	local colors = schemes[scheme_name]
	return colors
end

return M
