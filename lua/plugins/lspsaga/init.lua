local M = {
	"glepnir/lspsaga.nvim",
	branch = "main",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		require("plugins.lspsaga.config")
	end,
}

return M
