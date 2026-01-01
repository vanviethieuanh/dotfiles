local wezterm = require("wezterm")
local custom_actions = require("actions")
local act = wezterm.action

local M = {}

-- helper: tab keybindings
local function tab_keys(mods)
	local keys = {}
	for i = 1, 8 do
		table.insert(keys, { key = tostring(i), mods = mods, action = act.ActivateTab(i - 1) })
		table.insert(keys, { key = "F" .. tostring(i), action = act.ActivateTab(i - 1) })
	end
	return keys
end

-- common leader key actions
local function leader_keys()
	return {
		{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "s", mods = "LEADER", action = act.EmitEvent("save-output") },
		{ key = "q", mods = "LEADER", action = wezterm.action_callback(custom_actions.split_quad) },
		{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	}
end

M.Linux = {
	leader = { key = "a", mods = "CTRL" },
	keys = (function()
		local keys = {}
		for _, k in ipairs(leader_keys()) do
			table.insert(keys, k)
		end
		for _, k in ipairs(tab_keys("ALT")) do
			table.insert(keys, k)
		end
		return keys
	end)(),
}

M.Mac = {
	leader = { key = "a", mods = "CMD" },
	keys = (function()
		local keys = {}
		for _, k in ipairs(leader_keys()) do
			table.insert(keys, k)
		end
		for _, k in ipairs(tab_keys("CMD")) do
			table.insert(keys, k)
		end
		return keys
	end)(),
}

return M
