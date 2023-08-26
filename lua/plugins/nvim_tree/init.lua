local M = {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.nvim_tree.config")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
	},
}

return M
