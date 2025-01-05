local M = {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim",--[[  {
		        "nvim-telescope/telescope-fzf-native.nvim",
		        build = "make"
            } ]]
        },
		config = function()
			require("plugins.telescope.config")
		end,
		cmd = "Telescope",
	}

return M
