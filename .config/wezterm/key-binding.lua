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

	table.insert(M.Linux, {
		key = "4",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action_callback(function(win, pane)
			local act = wezterm.action
			-- Split right
			win:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
			wezterm.sleep_ms(100) -- slight delay to ensure split order
			-- Split bottom on left pane
			win:perform_action(act.ActivatePaneDirection("Left"), pane)
			win:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
			wezterm.sleep_ms(100)
			-- Split bottom on right pane
			win:perform_action(act.ActivatePaneDirection("Right"), pane)
			win:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
		end),
	})
end

return M
