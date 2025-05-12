local M = {}

local wezterm = require("wezterm")
local act = wezterm.action

M.Linux = {}
for i = 1, 8 do
	-- ALT + number to activate that tab
	table.insert(M.Linux, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab, this keybinding precedence the nvim F1 -> help
	table.insert(M.Linux, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

return M
