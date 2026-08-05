local mainMod = "SUPER"

hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus --new-window"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" })) -- dwindle
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock")) -- dwindle
hl.bind(mainMod .. " + TAB", hl.dsp.window.float({ action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	hl.bind(mainMod .. " + " .. (i % 10), hl.dsp.focus({ workspace = i }))
end

hl.bind("CTRL + SUPER + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind("CTRL + SUPER + right", hl.dsp.focus({ workspace = "+1" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	hl.bind(mainMod .. " + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Fn keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { locked = true })

-- Screenshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m output -m DP-1"), { locked = true })

-- Search
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("vicinae vicinae://extensions/vicinae/core/search-emojis"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("vicinae deeplink vicinae://launch/clipboard/history"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/scripts/repomenu.sh"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("~/.config/rofi/scripts/powermenu.sh"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot"))

-- Toggle fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
