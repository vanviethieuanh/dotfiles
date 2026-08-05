-- Window and layer rules
-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more

hl.layer_rule({
	name = "waybar",

	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0,
})

-- hl.layer_rule({
--   name = "swaync"
--
--   match = { namespace = "swaync.*" },
--   blur = true,
--   ignore_alpha = 0
-- })

hl.layer_rule({
	name = "eww",

	match = { namespace = "eww" },
	ignore_alpha = 0,
})

hl.window_rule({
	name = "foot",

	match = { class = ".*foot" },
	opacity = "0.95",
})

hl.window_rule({
	name = "Nautilus",

	match = { class = "org.gnome.Nautilus" },
	size = { "(monitor_w*0.4)", "(monitor_h*0.4)" },

	float = true,
	center = true,
})

hl.window_rule({
	name = "Clipse",

	match = { class = "clipse" },

	float = true,
	stay_focused = true,
	center = true,
	size = { 622, 652 },
})

hl.layer_rule({
	name = "Vicinae",

	match = { namespace = "vicinae" },

	blur = true,
	ignore_alpha = 0,
	no_anim = true,
})
