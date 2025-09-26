local M = {}

-- Split the current pane into a quad (田) layout
function M.split_quad(window, pane)
	local top = pane:split({ direction = "Top" })
	top:split({ direction = "Right" })
	pane:split({ direction = "Right" })
end

return M
