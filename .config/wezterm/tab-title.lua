-- tab_title_formatter.lua
local wezterm = require("wezterm")

-- The filled in variant of the < symbol
local LEFT_CHAR = "█"

-- The filled in variant of the > symbol
local RIGHT_CHAR = "█"

local M = {}

-- Helper function to get tab title
local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

function M.setup(theme_colors)
	wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
		local edge_background = "black"

		local background = theme_colors.cursor_fg or "#1b1032"
		local foreground = "grey"

		if tab.is_active then
			background = theme_colors.selection_bg or "#2b2042"
			foreground = theme_colors.selection_fg or "#c0c0c0"
		elseif hover then
			background = theme_colors.cursor_fg or "#3b3052"
			foreground = "white"
		end

		local edge_foreground = background
		local title = tab_title(tab)
		title = wezterm.truncate_right(title, max_width - 2)

		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = LEFT_CHAR },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = RIGHT_CHAR },
		}
	end)
end

return M
