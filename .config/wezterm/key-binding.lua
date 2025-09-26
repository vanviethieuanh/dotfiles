local M = {}

local wezterm = require("wezterm")
local act = wezterm.action

M.Linux = {
	leader = { key = "a", mods = "CTRL" },
	keys = {},
}
for i = 1, 8 do
	-- ALT + number to activate that tab
	table.insert(M.Linux.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab, this keybinding precedence the nvim F1 -> help
	table.insert(M.Linux.keys, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

M.Mac = {
	leader = { key = "a", mods = "CMD" },
	keys = {
		{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "s", mods = "LEADER", action = wezterm.action.EmitEvent("save-output") },
		{
			key = "|",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
	},
}

for i = 1, 8 do
	-- CMD + number to switch tabs (like in Safari, iTerm2, Chrome)
	table.insert(M.Mac.keys, {
		key = tostring(i),
		mods = "CMD",
		action = act.ActivateTab(i - 1),
	})
	-- F1–F8 still work the same, if you want
	table.insert(M.Mac.keys, {
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
