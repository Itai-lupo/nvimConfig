local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("plugins.treesitter.config")
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/playground" },
}

return M
