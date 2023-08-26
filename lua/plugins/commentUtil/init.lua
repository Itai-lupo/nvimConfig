local M = {
	"numToStr/Comment.nvim",
	config = function()
		print("a")
		require("plugins.commentUtil.config")
	end,
}

return M
