local M = {
	n = {
		["<leader>u"] = {
			vim.cmd.UndotreeToggle,
			"open undo tree",
		},
	},
}

return M
