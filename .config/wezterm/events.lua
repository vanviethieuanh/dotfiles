local wezterm = require("wezterm")

wezterm.on("save-output", function(window, pane)
	local zones = pane:get_semantic_zones()
	local i = #zones
	local last_index = nil
	while i > 0 and not last_index do
		if zones[i].semantic_type == "Output" then
			last_index = i
		end
		i = i - 1
	end

	if not last_index then
		local err_msg = "No output found in the current pane."
		wezterm.log_error(err_msg)
		window:toast_notification("Error", err_msg)
		return
	end

	local latest_output_zone = zones[last_index]
	local latest_output_text = pane:get_text_from_semantic_zone(latest_output_zone)
	local latest_input_zone = zones[last_index - 1]
	local latest_input_text
	if latest_input_zone then
		latest_input_text = pane:get_text_from_semantic_zone(latest_input_zone)
	else
		latest_input_text = "[No input found]"
	end

	local text = latest_input_text .. "\n\n" .. latest_output_text

	local cwd_uri = pane:get_current_working_dir()
	if not cwd_uri or cwd_uri.scheme ~= "file" then
		local err_msg = "Failed to get current working directory. URI: " .. tostring(cwd_uri)
		wezterm.log_error(err_msg)
		window:toast_notification("Error", err_msg)
		return
	end

	local output_file_path = cwd_uri.file_path .. "/wezterm-output-" .. os.date("%Y%m%d-%H%M%S") .. ".log"
	local output_file, err = io.open(output_file_path, "w")
	if not output_file then
		local err_msg = "Failed to open file " .. output_file_path .. " for writing: " .. err
		wezterm.log_error(err_msg)
		window:toast_notification("Error", err_msg)
		return
	end

	output_file:write(text)
	output_file:flush()
	output_file:close()

	local info_msg = "Wrote output to file: " .. output_file_path
	wezterm.log_info(info_msg)
	window:toast_notification("Info", info_msg, tostring(cwd_uri), 5000)
end)
