local M = {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("plugins.indent_color.config")
	end,
    main = "ibl"
}

return M
