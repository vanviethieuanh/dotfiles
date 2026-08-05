-- Autostart applications on the hyprland.start event.
-- hl.exec_cmd() spawns asynchronously, no need for & disown.
hl.on("hyprland.start", function()
	-- hl.exec_cmd("hyprpaper")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("swaync")
	-- hl.exec_cmd("walker --gapplication-service")

	-- NOTE: DO NOT change to systemd, unstable.
	-- For Wayland compositors, especially Hyprland,
	-- systemd --user graphical integration can be inconsistent unless the compositor properly imports environment variables into the user manager.
	hl.exec_cmd("vicinae server --replace")

	-- hl.exec_cmd("~/.config/hypr/start/eww.sh")
	hl.exec_cmd("~/.config/hypr/start/waybar.sh")
	-- hl.exec_cmd("clipse -listen")

	hl.exec_cmd("hyprctl setcursor 'Capitaine Cursors' 36")
end)
