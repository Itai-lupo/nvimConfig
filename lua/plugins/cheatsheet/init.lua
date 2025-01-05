local M = {
	"sudormrfbin/cheatsheet.nvim",
	config = function()
		require("plugins.cheatsheet.config")
	end,
    dependencies = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'}
    }
}

return M
