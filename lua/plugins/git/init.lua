local M = {
	{
		"tpope/vim-fugitive",
		config = function()
			require("plugins.git.config")
		end,
	},

	{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
}

return M
