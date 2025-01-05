local M = {
	{
		"tpope/vim-fugitive",
		config = function()
			require("plugins.git.config")
		end,
	},

	{ "lewis6991/gitsigns.nvim",
        config =  function ()
            require("plugins.git.config_gitsighns")
        end
}, -- show line modifications on left hand side
}

return M
